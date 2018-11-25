# This file modifies the control file
# (1) Allows for easy editting of the control file
# (2) Allows for obvious reproducibility of control file modifications

execfile('../pyprgs/in_out_line.py')

line_list = lin.reader('Control.jl')

#def top_definition(line):
#    global count
#    counter = 1

class file_section:
    def __init__(self,List):
        self.text = List[:]
        self.return_text = self.text[:]
        self.working_block = []
        self.working_block_index = None

    def check_in_block(self,block,string):
        flag = False
        for line in block:
            if string in line:
                flag = True
        return flag

    def set_working_block(self,locator):
        index = [i for block,i in zip(self.text,range(len(self.text))) if self.check_in_block(block,locator)==True][0] # finds locator string in block and rerturns index of block in text
        self.working_block = self.text[index]
        self.working_block_index = index

    def parse_actor(self,actors,i):
        #print i
        S = actors[i]
        if S == '':
            return "",""
        else:
            return tuple(S.split(':'))

    def reconfigure(self,GROUPS,INTEGR,ACTORS):
        # first we flatten the groups list while making sure to keep the index of the group with the group name
        ngroups = len(GROUPS)
        # flatten GROUPS
        logic_map = []
        logic_map_raw = [[x,group_index] for x,group_index in zip(GROUPS,range(ngroups))] # group with group indices
        for x in logic_map_raw: # flatten
            for y in x[0]:
                logic_map.append([y,x[1]])

        # Find working block (contains all logic pertaining to one reaction)
        locator = GROUPS[0][0] # what is the first reaction name of the first group
        #print(locator)
        self.set_working_block(locator)
        # make a transfer_function_vector_ for each group
        ngroups = len(GROUPS)
        if ngroups > 1:
            for x in range(ngroups):
        #        print x
                self.working_block.insert(1,"transfer_function_vector_%s = Float64[];"%x)

        # find the starting index for each logical control statement
        for line,i in zip(self.working_block,range(len(self.working_block))):
            for j in range(len(logic_map)):
                #print logic_map
                if logic_map[j][0] in line:
                    logic_map[j].append(i)
        # logic map now contains the first line of the sub-block

        counter = 0 # we need to index each logical control statement!
        # Rename any actors as necessary (differentiate between activators and inhibitors for parsing purposes)
        for x in logic_map:
            group = x[1]
            start = x[2]
            #print counter, "counter"
            # handle activators (all on one line)
            if "push!" in self.working_block[start+1]:
                # patch actors
                A,B = self.parse_actor(ACTORS,counter)
                #print A,B
                self.working_block[start+1]=self.working_block[start+1].replace(A,B)
                # patch transfer_function_vector references
                if ngroups == 1:
                    pass
                elif ngroups > 1:
                    self.working_block[start+1]=self.working_block[start+1].replace("transfer_function_vector","transfer_function_vector_%s"%group)

            # handle inhibitors (multiple lines!)
            elif "if" in self.working_block[start+1]:
                # patch actors
                A,B = self.parse_actor(ACTORS,counter)
                self.working_block[start+1]=self.working_block[start+1].replace(A,B)
                self.working_block[start+4]=self.working_block[start+4].replace(A,B)
                # patch transfer_function_vector references
                if ngroups == 1:
                    pass
                elif ngroups > 1:
                    self.working_block[start+2]=self.working_block[start+2].replace("transfer_function_vector","transfer_function_vector_%s"%group)
                    self.working_block[start+4]=self.working_block[start+4].replace("transfer_function_vector","transfer_function_vector_%s"%group)
            counter = counter +1
        # update integration functions (this method cannot handle nesting)
        if ngroups == 1:
            eq_ind = self.working_block[-4].index("=")
            self.working_block[-4] = self.working_block[-4][:eq_ind+2] + "%s(transfer_function_vector);"%INTEGR[group]
        if ngroups > 1:
            eq_ind = self.working_block[-4].index("=")
            phrase = "%s("%INTEGR[-1]
            for q in range(ngroups):
                phrase=phrase+"%s(transfer_function_vector_%s),"%(INTEGR[q],q)
            phrase = phrase[:-1]+");" # remove comma and close
            self.working_block[-4] = self.working_block[-4][:eq_ind+2] + phrase
        # push the changes
        self.return_text[self.working_block_index]=self.working_block

    def send(self):
        return self.return_text


sect_sep = '# -'
end_keyword = "# Modify the rate_vector"
top =[]
logic_section = []
bottom = []
count = 0
active_list = top # pull out the top portion of the file (before the logic statments)

for line in line_list:

    if end_keyword in line: # watch for end separator
        active_list = bottom

    if sect_sep in line: # find logic section
        count=count+1

    if count ==5: # start to pull logic section
        active_list = logic_section

    active_list.append(line)


# #  separate control blocks

# find indices of separators
seps = [i for line,i in zip(logic_section,range(len(logic_section))) if sect_sep in line ]

# 2i, 2i + 1 # take ordered pairs that do not overlap
def grab_blocks_by_pair(linelist,seps):
    blocks = []
    for i in range(len(seps)/2): # we can safely divide by two since two seps are added for each block
        #print i, (2*i),(2*i+1)
        block = linelist[ seps[2*i]: seps[2*i+1]+2]
        blocks.append(block)
    return blocks

blocks = grab_blocks_by_pair(logic_section,seps)



# Example of flat file entry
# effectors=['activation_TGFB3_by_TCF4 target','repression_TGFB3_by_YREG1']
# GROUPS=[effectors]
# INTEGR=['minimum']
# ACTORS=['','']
# pointer.reconfigure(GROUPS,INTEGR,ACTORS)
# lin.writer("block.txt",pointer.working_block)
#

#
### Theoretically, we can just stream the logic flat file here and it will generate the modified control file
### -- but still need to write the code to recombine and generate the final file
#

# load logic blocks into file_section object
pointer = file_section(blocks)

# load flat file that will call pointer to edit requested blocks
execfile("logic_flat_file.py")

control_block= pointer.send()

# extract and flatten working blocks back to a linelist
control_block= [item for sublist in control_block for item in sublist]

new_control_linelist = top+control_block+bottom

lin.writer("Control_modified.jl",new_control_linelist)

# find code block and select for modification

print("WARNING -- when integrating multuple rules (e.g. mean(min,max) MANUALLY add brackets around minimum(),maximum() inside mean()")
print("grep mean Control.jl | grep -e minimum -e maximum")
# RULE:
# sect_sep opens the entire logic section AND the first logic block/subsection
# sect_sep then closes the first block and opens the second
# therefore there are two sect_seps between all subsequent blocks
# and one sect sep at the end of the logic section
# find existing logic structure

# need to handle the following cases
# 1 multiple transferfuction integration
#   need to define more than one transferfunction vector as well as using the two references correctly

# add modifications

# replace existing logic

# save new control filey
