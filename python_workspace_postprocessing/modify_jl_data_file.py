# This file modifies the data file
# (1) Allows for easy editting of the data fiel
# (2) Allows for obvious reproducibility of data file modifications

execfile('../pyprgs/in_out_line.py')

linelist = lin.reader('Datafile_raw.jl')

# data file
# use simple line replaces and insertions

# load data file modifications flat  file
# find network.dat line
#     replace pointer
#



execfile('data_file_flat_mods.py')


network_path = ['readdlm,','"../Network.dat"']
keywords_values = keywords_values+[network_path]

bionum_start='# Set the maximum specific growth rate -' # == overwrite (delete) this line and next before inserting lines


def replace_elements(line,s,x):
    new_line = line
#    print line,s,x
    # this is still messed up not writing intitial condition array etc.
    if 'rate_constant_array' in s:
        #print line
        a=new_line.index(',')+1
        b=new_line.index(')')
        rep = new_line[a:b]
        new_line = new_line.replace(rep,str(x))
        #clip=new_line.index('$')+1
        return new_line#[clip:]

    elif 'initial_condition_array' in s:
        #print line
        a=new_line.index(',')+1
        b=new_line.index(')')
        rep = new_line[a:b]
        new_line = new_line.replace(rep,str(x))
        #print new_line
        #clip=new_line.index('$')+1
        return new_line#[clip:]

    elif 'saturation_constant_array' in s:
        a=new_line.index('= ')+1
        b=new_line.index(';')
        rep = new_line[a:b]
        new_line = new_line.replace(rep,' '+str(x))
        #clip=new_line.index('$')+1
        return new_line#[clip:]

    elif 'Network.dat"' in line:
        a=new_line.index('readdlm,')+8
        b=new_line.index('));')
        rep = new_line[a:b]
        new_line = new_line.replace(rep,str(x))
        return new_line

    else:
        print 'wrong pointer for value replacement'
        print line
        print s
        print x
        raise ValueError

# something is wrong with these pointers...

def pull_index_df_rIca(line):
    new_line=line
    a=new_line.index('\t#\t')+3
    b=new_line.rindex('\t')
    rep = new_line[a:b]
    #new_line = new_line.replace(rep,str(x))

    return rep
##
replacements = []
ppase_i=None
RNAP_i =None
RIBOSOME_i = None
for x,i in zip(linelist,range(len(linelist))):
    for y in keywords_values:
        lookup = y[0]
        check = ''
        if '$' in lookup:
            clip=lookup.index('$')+1
            lookup = lookup[clip:]
            check = y[0][:clip-1]
        #print lookup, check
        if lookup in x and check in x:
            replacements.append((y[0],i,y[1]))

    if bionum_start in x:
        bionum_start_i=i
    if 'PPase' in x and 'initial_condition_array' in x:
        ppase_i=pull_index_df_rIca(x)
    if 'RNAP' in x and 'initial_condition_array' in x:
        RNAP_i =pull_index_df_rIca(x)
    if 'RIBOSOME' in x and 'initial_condition_array' in x:
        RIBOSOME_i =pull_index_df_rIca(x)

new_linelist = linelist[:]

for s,i,value in replacements:
    new_linelist[i]=replace_elements(new_linelist[i],s,value)
##

# delete existing two lines
new_linelist.pop(bionum_start_i)
new_linelist.pop(bionum_start_i)

bionum = lin.reader('bionumbers.jl') # bionum jl

bionum.reverse()

for line in bionum:
    new_linelist.insert(bionum_start_i,line)

lin.writer("Datafile_modified.jl",new_linelist)

# get ribosome RNAP and PPase rate indecies from data file

bal = lin.reader("Balances_raw.jl")

bmods =lin.reader("Balance_mods.jl")
bmods.reverse()

bmod_start_i=64

new_linelist_2 = bal[:]
for line in bmods:
    app = line
    if 'RNAP_i' in line:
        app = line.replace('RNAP_i',str(RNAP_i))
    if 'RIBOSOME_i' in line:
        app = line.replace('RIBOSOME_i',str(RIBOSOME_i))
    if 'ppase_i' in line:
        app = line.replace('ppase_i',str(ppase_i))

    new_linelist_2.insert(bmod_start_i,app)
lin.writer("Balances_modified.jl",new_linelist_2)
#
