# Regenerate results using the parameter array
println(now())
using Debug
# Initialize simulation functions
fpath="../src/new_SimulationFunctions.jl" # Loads up DataFile , SolveBalances , Balances, Kinetics, Control
include(fpath)

# Establish simulation parameters
TSTART = 0.0;
Ts = 1.0; # 0.1
TSTOP = 150.0; # 100 ; 500

# Initialize intial data dictionary
data_dictionary = DataFile(TSTART,TSTOP,Ts)
len_cpa = length(data_dictionary["CONTROL_PARAMETER_ARRAY"])
len_rca = length(data_dictionary["RATE_CONSTANT_ARRAY"])
len_sca = length(data_dictionary["SATURATION_CONSTANT_ARRAY"])
sca_indices,sca_values = [],[]
for i in 1:len_sca
  val = data_dictionary["SATURATION_CONSTANT_ARRAY"][i]
if val !=0
  push!(sca_indices,i)
  push!(sca_values,val)
end
end

sca_pack = zip(sca_indices,sca_values)

 # CPA, let's give access to gain AND power
 cpa_gain = data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] # Gain
 cpa_order= data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] # Power

 # get lengths of new arrays
 len_cpa_gain = length(cpa_gain)
 len_cpa_order = length(cpa_order)
 len_sca_values = length(sca_values)

 len_sca_prime = length(sca_values)
   A = len_rca + len_cpa_gain
   B = A + len_cpa_order
   C = B + len_sca_prime

# read parameter arrays resulting from POETs

PC = readdlm("PC.dat")

# PC is an array of parameter arrays
PC_results =[]
fraction = 1
popsize = Int(length(PC[1,:])*fraction)
println("Model Population Size ", popsize)
# popsize = 3 # useful for debugging
for i in 1:popsize
  println("Regen ",i," of ",popsize)
  # Refactor data dictionary for model execution
  # need to specify implicit strucutre of parameter_array
  P = PC[:,i]
  data_dictionary["RATE_CONSTANT_ARRAY"] = P[1:len_rca]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,1] = P[len_rca+1:A]
  data_dictionary["CONTROL_PARAMETER_ARRAY"][:,2] = P[A+1:B]
  # Rebuild SCA
  sca_pack = zip(sca_indices,P[B+1:C]) # new values
  for (i,val) in sca_pack
  data_dictionary["SATURATION_CONSTANT_ARRAY"][i]=val
  end

  # Run to Steady State
 #println("running to SS")
  XSS = EstimateSteadyState(data_dictionary)
  initial_condition_array = vec(XSS);
  data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
  xss_data_dict = deepcopy(data_dictionary)

  # simulations_name = ["edit_file_none.jl","edit_file_1dyne_per_cm2_0hz.jl","edit_file_5dyne_per_cm2_0hz.jl","edit_file_10dyne_per_cm2_0hz.jl","edit_file_1dyne_per_cm2_1hz.jl","edit_file_5dyne_per_cm2_1hz.jl","edit_file_10dyne_per_cm2_1hz.jl"]
  include("../src/spin_up_edits.jl")
  i_simdat = 1
  sim_data = [] # Keep data in RAM
  for sim in simulations
    ##### What data_dictionary should be loaded here??? clearly the active one

    sim_ICA = simulations_ICA[i_simdat]
    # println(sim_ICA) # 
    data_dictionary_active = deepcopy(xss_data_dict)
    (TSIM,X) = SolveModelGeneric_ram_regen(TSTART,TSTOP,Ts,data_dictionary_active,sim,sim_ICA)

    push!(sim_data,X)
    i_simdat = i_simdat + 1

  end
  push!(PC_results,sim_data)

end


# shear stress
index_cd31_mrna = 37
index_asma_vim_mrna = 107
index_slug_mrna = 29
index_tgfb3_mrna = 104

index_RhoA_GTP = 72
index_CD31 = 78
index_YAP1 = 75
index_Active_YAP1 = 76
index_Sequestered_YAP1 = 77
index_Ecadherin = 61
index_Ecadherin_Bcatenin = 63
index_vimentin = 84



## Designate arrays for each figure

# STATIC = Array{Float64,1}([])
# SS_1  = Array{Float64,1}([])
# SS_5  = Array{Float64,1}([])
# SS_10 = Array{Float64,1}([])
#
#
# # OSC
# # [Control, 1dyn, 5dyn, 10dyn] # 1hz
# OSC_1  = Array{Float64,1}([])
# OSC_5   = Array{Float64,1}([])
# OSC_10   = Array{Float64,1}([])

## Designate arrays for each figure

ST_PECAM = Array{Float64,1}([])
ST_Rho_Active = Array{Float64,1}([])
ST_YAP1  = Array{Float64,1}([])
ST_YAP1_Active = Array{Float64,1}([])
ST_YAP1_Sequestered = Array{Float64,1}([])
ST_Ecadherin = Array{Float64,1}([])
ST_vimentin = Array{Float64,1}([])

# OSC
# [Control, 1dyn, 5dyn, 10dyn] # 1hz
OSC_PECAM = Array{Float64,1}([])
OSC_Rho_Active = Array{Float64,1}([])
OSC_YAP1  = Array{Float64,1}([])
OSC_YAP1_Active = Array{Float64,1}([])
OSC_YAP1_Sequestered = Array{Float64,1}([])
OSC_Ecadherin = Array{Float64,1}([])
OSC_vimentin = Array{Float64,1}([])

t0  = 1
t24 = 74
t48 = 149
#t72 = 224
# loop over results and build each figure

function norm_dat(data)
  min = minimum(data)
  max = maximum(data)

#  if max == 0
  #  max = 1
#  end
SMALL = 1e-3
if sum(data) > SMALL
  normalized_data = (data-min)/(max-min)
else
  normalized_data = zeros(data)
end
end

#
#out_dir = "../poets/results_poets/"
#writedlm(string(out_dir,"ensemble_dynamics.dat"),PC_results)

for state in PC_results

    # ST_PECAM
    # ST_ACTA
    # ST_Slug
    # ST_TGFB3

MIN = 0.01

# state[i] referes to the i'th simulation type

# we could export allwith state[1][t48,:], but let's keep it simple

# static = state[1][t48,:]
# ss_1 = state[2][t48,:]
# ss_5 = state[3][t48,:]
# ss_10 = state[4][t48,:]
#
# osc_1 = state[2][t48,:]
# osc_5 = state[3][t48,:]
# osc_10 = state[4][t48,:]
#
# push!(STATIC,static)
# push!(SS_1,ss_1)
# push!(SS_5,ss_5)
# push!(SS_10,ss_10)
#
# push!(OSC_1,osc_1)
# push!(OSC_5,osc_5)
# push!(OSC_10,osc_10)


# PANEL Steady shear sma
bar1 = state[1][t48,index_RhoA_GTP]
bar2 = state[2][t48,index_RhoA_GTP]
bar3 = state[3][t48,index_RhoA_GTP]
bar4 = state[4][t48,index_RhoA_GTP]
push!(ST_Rho_Active,bar1)
push!(ST_Rho_Active,bar2)
push!(ST_Rho_Active,bar3)
push!(ST_Rho_Active,bar4)

# PANEL Steady shear cd31
bar1 = state[1][t48,index_CD31]
bar2 = state[2][t48,index_CD31]
bar3 = state[3][t48,index_CD31]
bar4 = state[4][t48,index_CD31]
push!(ST_PECAM,bar1)
push!(ST_PECAM,bar2)
push!(ST_PECAM,bar3)
push!(ST_PECAM,bar4)


# PANEL Steady shear slug
bar1 = state[1][t48,index_YAP1]
bar2 = state[2][t48,index_YAP1]
bar3 = state[3][t48,index_YAP1]
bar4 = state[4][t48,index_YAP1]
push!(ST_YAP1,bar1)
push!(ST_YAP1,bar2)
push!(ST_YAP1,bar3)
push!(ST_YAP1,bar4)

# PANEL Steady shear tgfb3
bar1 = state[1][t48,index_Active_YAP1]
bar2 = state[2][t48,index_Active_YAP1]
bar3 = state[3][t48,index_Active_YAP1]
bar4 = state[4][t48,index_Active_YAP1]
push!(ST_YAP1_Active,bar1)
push!(ST_YAP1_Active,bar2)
push!(ST_YAP1_Active,bar3)
push!(ST_YAP1_Active,bar4)



# PANEL Steady shear tgfb3
bar1 = state[1][t48,index_Sequestered_YAP1]
bar2 = state[2][t48,index_Sequestered_YAP1]
bar3 = state[3][t48,index_Sequestered_YAP1]
bar4 = state[4][t48,index_Sequestered_YAP1]
push!(ST_YAP1_Sequestered,bar1)
push!(ST_YAP1_Sequestered,bar2)
push!(ST_YAP1_Sequestered,bar3)
push!(ST_YAP1_Sequestered,bar4)

# PANEL Steady shear tgfb3
bar1 = state[1][t48,index_Ecadherin] + state[1][t48,index_Ecadherin_Bcatenin]
bar2 = state[2][t48,index_Ecadherin] + state[2][t48,index_Ecadherin_Bcatenin]
bar3 = state[3][t48,index_Ecadherin] + state[3][t48,index_Ecadherin_Bcatenin]
bar4 = state[4][t48,index_Ecadherin] + state[4][t48,index_Ecadherin_Bcatenin]
push!(ST_Ecadherin,bar1)
push!(ST_Ecadherin,bar2)
push!(ST_Ecadherin,bar3)
push!(ST_Ecadherin,bar4)


# PANEL Steady shear tgfb3
bar1 = state[1][t48,index_vimentin]
bar2 = state[2][t48,index_vimentin]
bar3 = state[3][t48,index_vimentin]
bar4 = state[4][t48,index_vimentin]
push!(ST_vimentin,bar1)
push!(ST_vimentin,bar2)
push!(ST_vimentin,bar3)
push!(ST_vimentin,bar4)

##

# PANEL OSC sma
bar1 = state[1][t48,index_RhoA_GTP]
bar2 = state[5][t48,index_RhoA_GTP]
bar3 = state[6][t48,index_RhoA_GTP]
bar4 = state[7][t48,index_RhoA_GTP]
push!(OSC_Rho_Active,bar1)
push!(OSC_Rho_Active,bar2)
push!(OSC_Rho_Active,bar3)
push!(OSC_Rho_Active,bar4)

# PANEL OSC cd31
bar1 = state[1][t48,index_CD31]
bar2 = state[5][t48,index_CD31]
bar3 = state[6][t48,index_CD31]
bar4 = state[7][t48,index_CD31]
push!(OSC_PECAM,bar1)
push!(OSC_PECAM,bar2)
push!(OSC_PECAM,bar3)
push!(OSC_PECAM,bar4)

# PANEL OSC cd31
bar1 = state[1][t48,index_YAP1]
bar2 = state[5][t48,index_YAP1]
bar3 = state[6][t48,index_YAP1]
bar4 = state[7][t48,index_YAP1]
push!(OSC_YAP1,bar1)
push!(OSC_YAP1,bar2)
push!(OSC_YAP1,bar3)
push!(OSC_YAP1,bar4)
# PANEL OSC cd31
bar1 = state[1][t48,index_Active_YAP1]
bar2 = state[5][t48,index_Active_YAP1]
bar3 = state[6][t48,index_Active_YAP1]
bar4 = state[7][t48,index_Active_YAP1]
push!(OSC_YAP1_Active,bar1)
push!(OSC_YAP1_Active,bar2)
push!(OSC_YAP1_Active,bar3)
push!(OSC_YAP1_Active,bar4)
# PANEL OSC cd31
bar1 = state[1][t48,index_Sequestered_YAP1]
bar2 = state[5][t48,index_Sequestered_YAP1]
bar3 = state[6][t48,index_Sequestered_YAP1]
bar4 = state[7][t48,index_Sequestered_YAP1]
push!(OSC_YAP1_Sequestered,bar1)
push!(OSC_YAP1_Sequestered,bar2)
push!(OSC_YAP1_Sequestered,bar3)
push!(OSC_YAP1_Sequestered,bar4)
# PANEL OSC cd31
bar1 = state[1][t48,index_Ecadherin] + state[1][t48,index_Ecadherin_Bcatenin]
bar2 = state[5][t48,index_Ecadherin] + state[5][t48,index_Ecadherin_Bcatenin]
bar3 = state[6][t48,index_Ecadherin] + state[6][t48,index_Ecadherin_Bcatenin]
bar4 = state[7][t48,index_Ecadherin] + state[7][t48,index_Ecadherin_Bcatenin]
push!(OSC_Ecadherin,bar1)
push!(OSC_Ecadherin,bar2)
push!(OSC_Ecadherin,bar3)
push!(OSC_Ecadherin,bar4)

# PANEL OSC cd31
bar1 = state[1][t48,index_vimentin]
bar2 = state[5][t48,index_vimentin]
bar3 = state[6][t48,index_vimentin]
bar4 = state[7][t48,index_vimentin]
push!(OSC_vimentin,bar1)
push!(OSC_vimentin,bar2)
push!(OSC_vimentin,bar3)
push!(OSC_vimentin,bar4)

# indices for simulation data array sim_data
# 1 "edit_file_none.jl"
# 2 "edit_file_tgfb.jl"
# 3 "edit_file_mapkin.jl"
# 4 "edit_file_ss.jl"
# 5 "edit_file_ssecad.jl"
# 6 "edit_file_ss_tgfb3ab.jl"
# 7 "edit_file_ss_dnlef1.jl"
# 8 "edit_file_tgfb3.jl"
# 9 "edit_file_dnsmad.jl"
# 10 "edit_file_tgfb3_dnlef1.jl"
end

# get mean and standard deviation
N = length(PC_results)
# bar1=sum(F2A[1:3:end])/N
# bar2=sum(F2A[2:3:end])/N
# bar3=sum(F2A[3:3:end])/N

# println(F2A[3:3:end])
#std(Array{Float64,1}(F2A[3:3:end]))

# ST_PECAM
# ST_ACTA
# ST_Slug
# ST_TGFB3
#
# OSC_PECAM
# OSC_ACTA
# OSC_Slug
# OSC_TGFB3
#
ST_PECAM_raw = copy(ST_PECAM)
ST_Rho_Active_raw = copy(ST_Rho_Active)
ST_YAP1_raw = copy(ST_YAP1)
ST_YAP1_Active_raw = copy(ST_YAP1_Active)
ST_YAP1_Sequestered_raw = copy(ST_YAP1_Sequestered)
ST_Ecadherin_raw = copy(ST_Ecadherin)
ST_vimentin_raw = copy(ST_vimentin)

OSC_PECAM_raw = copy(OSC_PECAM)
OSC_Rho_Active_raw = copy(OSC_Rho_Active)
OSC_YAP1_raw = copy(OSC_YAP1)
OSC_YAP1_Active_raw = copy(OSC_YAP1_Active)
OSC_YAP1_Sequestered_raw = copy(OSC_YAP1_Sequestered)
OSC_Ecadherin_raw = copy(OSC_Ecadherin)
OSC_vimentin_raw = copy(OSC_vimentin)
#
ST_PECAM = [sum(ST_PECAM[1:4:end])/N, sum(ST_PECAM[2:4:end])/N, sum(ST_PECAM[3:4:end])/N, sum(ST_PECAM[4:4:end])/N, std(ST_PECAM[1:4:end]), std(ST_PECAM[2:4:end]), std(ST_PECAM[3:4:end]), std(ST_PECAM[4:4:end])]
ST_Rho_Active = [sum(ST_Rho_Active[1:4:end])/N, sum(ST_Rho_Active[2:4:end])/N, sum(ST_Rho_Active[3:4:end])/N, sum(ST_Rho_Active[4:4:end])/N, std(ST_Rho_Active[1:4:end]), std(ST_Rho_Active[2:4:end]), std(ST_Rho_Active[3:4:end]), std(ST_Rho_Active[4:4:end])]
ST_YAP1 = [sum(ST_YAP1[1:4:end])/N, sum(ST_YAP1[2:4:end])/N, sum(ST_YAP1[3:4:end])/N, sum(ST_YAP1[4:4:end])/N, std(ST_YAP1[1:4:end]), std(ST_YAP1[2:4:end]), std(ST_YAP1[3:4:end]), std(ST_YAP1[4:4:end])]
ST_YAP1_Active = [sum(ST_YAP1_Active[1:4:end])/N, sum(ST_YAP1_Active[2:4:end])/N, sum(ST_YAP1_Active[3:4:end])/N, sum(ST_YAP1_Active[4:4:end])/N, std(ST_YAP1_Active[1:4:end]), std(ST_YAP1_Active[2:4:end]), std(ST_YAP1_Active[3:4:end]), std(ST_YAP1_Active[4:4:end])]
ST_YAP1_Sequestered = [sum(ST_YAP1_Sequestered[1:4:end])/N, sum(ST_YAP1_Sequestered[2:4:end])/N, sum(ST_YAP1_Sequestered[3:4:end])/N, sum(ST_YAP1_Sequestered[4:4:end])/N, std(ST_YAP1_Sequestered[1:4:end]), std(ST_YAP1_Sequestered[2:4:end]), std(ST_YAP1_Sequestered[3:4:end]), std(ST_YAP1_Sequestered[4:4:end])]
ST_Ecadherin = [sum(ST_Ecadherin[1:4:end])/N, sum(ST_Ecadherin[2:4:end])/N, sum(ST_Ecadherin[3:4:end])/N, sum(ST_Ecadherin[4:4:end])/N, std(ST_Ecadherin[1:4:end]), std(ST_Ecadherin[2:4:end]), std(ST_Ecadherin[3:4:end]), std(ST_Ecadherin[4:4:end])]
ST_vimentin = [sum(ST_vimentin[1:4:end])/N, sum(ST_vimentin[2:4:end])/N, sum(ST_vimentin[3:4:end])/N, sum(ST_vimentin[4:4:end])/N, std(ST_vimentin[1:4:end]), std(ST_vimentin[2:4:end]), std(ST_vimentin[3:4:end]), std(ST_vimentin[4:4:end])]


OSC_PECAM  = [sum(OSC_PECAM[1:4:end])/N, sum(OSC_PECAM[2:4:end])/N, sum(OSC_PECAM[3:4:end])/N, sum(OSC_PECAM[4:4:end])/N, std(OSC_PECAM[1:4:end]), std(OSC_PECAM[2:4:end]), std(OSC_PECAM[3:4:end]), std(OSC_PECAM[4:4:end])]
OSC_Rho_Active  = [sum(OSC_Rho_Active[1:4:end])/N, sum(OSC_Rho_Active[2:4:end])/N, sum(OSC_Rho_Active[3:4:end])/N, sum(OSC_Rho_Active[4:4:end])/N, std(OSC_Rho_Active[1:4:end]), std(OSC_Rho_Active[2:4:end]), std(OSC_Rho_Active[3:4:end]), std(OSC_Rho_Active[4:4:end])]
OSC_YAP1  = [sum(OSC_YAP1[1:4:end])/N, sum(OSC_YAP1[2:4:end])/N, sum(OSC_YAP1[3:4:end])/N, sum(OSC_YAP1[4:4:end])/N, std(OSC_YAP1[1:4:end]), std(OSC_YAP1[2:4:end]), std(OSC_YAP1[3:4:end]), std(OSC_YAP1[4:4:end])]
OSC_YAP1_Active  = [sum(OSC_YAP1_Active[1:4:end])/N, sum(OSC_YAP1_Active[2:4:end])/N, sum(OSC_YAP1_Active[3:4:end])/N, sum(OSC_YAP1_Active[4:4:end])/N, std(OSC_YAP1_Active[1:4:end]), std(OSC_YAP1_Active[2:4:end]), std(OSC_YAP1_Active[3:4:end]), std(OSC_YAP1_Active[4:4:end])]
OSC_YAP1_Sequestered  = [sum(OSC_YAP1_Sequestered[1:4:end])/N, sum(OSC_YAP1_Sequestered[2:4:end])/N, sum(OSC_YAP1_Sequestered[3:4:end])/N, sum(OSC_YAP1_Sequestered[4:4:end])/N, std(OSC_YAP1_Sequestered[1:4:end]), std(OSC_YAP1_Sequestered[2:4:end]), std(OSC_YAP1_Sequestered[3:4:end]), std(OSC_YAP1_Sequestered[4:4:end])]
OSC_Ecadherin  = [sum(OSC_Ecadherin[1:4:end])/N, sum(OSC_Ecadherin[2:4:end])/N, sum(OSC_Ecadherin[3:4:end])/N, sum(OSC_Ecadherin[4:4:end])/N, std(OSC_Ecadherin[1:4:end]), std(OSC_Ecadherin[2:4:end]), std(OSC_Ecadherin[3:4:end]), std(OSC_Ecadherin[4:4:end])]
OSC_vimentin  = [sum(OSC_vimentin[1:4:end])/N, sum(OSC_vimentin[2:4:end])/N, sum(OSC_vimentin[3:4:end])/N, sum(OSC_vimentin[4:4:end])/N, std(OSC_vimentin[1:4:end]), std(OSC_vimentin[2:4:end]), std(OSC_vimentin[3:4:end]), std(OSC_vimentin[4:4:end])]

out_dir = "../poets/results_poets/"

# writedlm(string(out_dir,"STATIC",".dat"),ST_PECAM)
# writedlm(string(out_dir,"OSC_1",".dat"),ST_ACTA)
# writedlm(string(out_dir,"OSC_5",".dat"),ST_Slug)
# writedlm(string(out_dir,"OSC_10",".dat"),ST_TGFB3)
# writedlm(string(out_dir,"SS_1",".dat"),OSC_PECAM)
# writedlm(string(out_dir,"SS_5",".dat"),OSC_ACTA)
# writedlm(string(out_dir,"SS_10",".dat"),OSC_Slug)


writedlm(string(out_dir,"ST_PECAM",".dat"),ST_PECAM)
writedlm(string(out_dir,"ST_Rho_Active",".dat"),ST_Rho_Active)
writedlm(string(out_dir,"ST_YAP1",".dat"),ST_YAP1)
writedlm(string(out_dir,"ST_YAP1_Active",".dat"),ST_YAP1_Active)
writedlm(string(out_dir,"ST_YAP1_Sequestered",".dat"),ST_YAP1_Sequestered)
writedlm(string(out_dir,"ST_Ecadherin",".dat"),ST_Ecadherin)
writedlm(string(out_dir,"ST_vimentin",".dat"),ST_vimentin)
writedlm(string(out_dir,"OSC_PECAM",".dat"),OSC_PECAM)
writedlm(string(out_dir,"OSC_Rho_Active",".dat"),OSC_Rho_Active)
writedlm(string(out_dir,"OSC_YAP1",".dat"),OSC_YAP1)
writedlm(string(out_dir,"OSC_YAP1_Active",".dat"),OSC_YAP1_Active)
writedlm(string(out_dir,"OSC_YAP1_Sequestered",".dat"),OSC_YAP1_Sequestered)
writedlm(string(out_dir,"OSC_Ecadherin",".dat"),OSC_Ecadherin)
writedlm(string(out_dir,"OSC_vimentin",".dat"),OSC_vimentin)

writedlm(string(out_dir,"ST_PECAM_raw",".dat"),ST_PECAM_raw)
writedlm(string(out_dir,"ST_Rho_Active_raw",".dat"),ST_Rho_Active_raw)
writedlm(string(out_dir,"ST_YAP1_raw",".dat"),ST_YAP1_raw)
writedlm(string(out_dir,"ST_YAP1_Active_raw",".dat"),ST_YAP1_Active_raw)
writedlm(string(out_dir,"ST_YAP1_Sequestered_raw",".dat"),ST_YAP1_Sequestered_raw)
writedlm(string(out_dir,"ST_Ecadherin_raw",".dat"),ST_Ecadherin_raw)
writedlm(string(out_dir,"ST_vimentin_raw",".dat"),ST_vimentin_raw)
writedlm(string(out_dir,"OSC_PECAM_raw",".dat"),OSC_PECAM_raw)
writedlm(string(out_dir,"OSC_Rho_Active_raw",".dat"),OSC_Rho_Active_raw)
writedlm(string(out_dir,"OSC_YAP1_raw",".dat"),OSC_YAP1_raw)
writedlm(string(out_dir,"OSC_YAP1_Active_raw",".dat"),OSC_YAP1_Active_raw)
writedlm(string(out_dir,"OSC_YAP1_Sequestered_raw",".dat"),OSC_YAP1_Sequestered_raw)
writedlm(string(out_dir,"OSC_Ecadherin_raw",".dat"),OSC_Ecadherin_raw)
writedlm(string(out_dir,"OSC_vimentin_raw",".dat"),OSC_vimentin_raw)





#writedlm(string(out_dir,"ST_PECAM",".dat"),ST_PECAM)
# writedlm(string(out_dir,"ST_ACTA",".dat"),ST_ACTA)
# writedlm(string(out_dir,"ST_Slug",".dat"),ST_Slug)
# writedlm(string(out_dir,"ST_TGFB3",".dat"),ST_TGFB3)
# writedlm(string(out_dir,"OSC_PECAM",".dat"),OSC_PECAM)
# writedlm(string(out_dir,"OSC_ACTA",".dat"),OSC_ACTA)
# writedlm(string(out_dir,"OSC_Slug",".dat"),OSC_Slug)
# writedlm(string(out_dir,"OSC_TGFB3",".dat"),OSC_TGFB3)
#
#writedlm(string(out_dir,"ST_PECAM_raw",".dat"),ST_PECAM_raw)
# writedlm(string(out_dir,"ST_ACTA_raw",".dat"),ST_ACTA_raw)
# writedlm(string(out_dir,"ST_Slug_raw",".dat"),ST_Slug_raw)
# writedlm(string(out_dir,"ST_TGFB3_raw",".dat"),ST_TGFB3_raw)
# writedlm(string(out_dir,"OSC_PECAM_raw",".dat"),OSC_PECAM_raw)
# writedlm(string(out_dir,"OSC_ACTA_raw",".dat"),OSC_ACTA_raw)
# writedlm(string(out_dir,"OSC_Slug_raw",".dat"),OSC_Slug_raw)
# writedlm(string(out_dir,"OSC_TGFB3_raw",".dat"),OSC_TGFB3_raw)


println(now())
