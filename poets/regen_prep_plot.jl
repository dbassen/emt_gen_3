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

## Designate arrays for each figure

ST_PECAM = Array{Float64,1}([])
ST_ACTA  = Array{Float64,1}([])
ST_Slug  = Array{Float64,1}([])
ST_TGFB3 = Array{Float64,1}([])


# OSC
# [Control, 1dyn, 5dyn, 10dyn] # 1hz
OSC_PECAM  = Array{Float64,1}([])
OSC_ACTA   = Array{Float64,1}([])
OSC_Slug   = Array{Float64,1}([])
OSC_TGFB3  = Array{Float64,1}([])



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
# PANEL Steady shear cd31
bar1 = state[1][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar2 = state[2][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar3 = state[3][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar4 = state[4][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
push!(ST_PECAM,bar1)
push!(ST_PECAM,bar2)
push!(ST_PECAM,bar3)
push!(ST_PECAM,bar4)

# PANEL Steady shear sma
bar1 = state[1][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar2 = state[2][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar3 = state[3][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar4 = state[4][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
push!(ST_ACTA,bar1)
push!(ST_ACTA,bar2)
push!(ST_ACTA,bar3)
push!(ST_ACTA,bar4)

# PANEL Steady shear slug
bar1 = state[1][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar2 = state[2][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar3 = state[3][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar4 = state[4][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
push!(ST_Slug,bar1)
push!(ST_Slug,bar2)
push!(ST_Slug,bar3)
push!(ST_Slug,bar4)

# PANEL Steady shear tgfb3
bar1 = state[1][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar2 = state[2][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar3 = state[3][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar4 = state[4][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
push!(ST_TGFB3,bar1)
push!(ST_TGFB3,bar2)
push!(ST_TGFB3,bar3)
push!(ST_TGFB3,bar4)

# PANEL OSC cd31
bar1 = state[1][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar2 = state[5][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar3 = state[6][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
bar4 = state[7][t48,index_cd31_mrna]/max(state[1][t48,index_cd31_mrna],MIN)
push!(OSC_PECAM,bar1)
push!(OSC_PECAM,bar2)
push!(OSC_PECAM,bar3)
push!(OSC_PECAM,bar4)

# PANEL OSC sma
bar1 = state[1][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar2 = state[5][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar3 = state[6][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
bar4 = state[7][t48,index_asma_vim_mrna]/max(state[1][t48,index_asma_vim_mrna],MIN)
push!(OSC_ACTA,bar1)
push!(OSC_ACTA,bar2)
push!(OSC_ACTA,bar3)
push!(OSC_ACTA,bar4)

# PANEL OSC slug
bar1 = state[1][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar2 = state[5][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar3 = state[6][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
bar4 = state[7][t48,index_slug_mrna]/max(state[1][t48,index_slug_mrna],MIN)
push!(OSC_Slug,bar1)
push!(OSC_Slug,bar2)
push!(OSC_Slug,bar3)
push!(OSC_Slug,bar4)

# PANEL OSC tgfb3
bar1 = state[1][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar2 = state[5][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar3 = state[6][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
bar4 = state[7][t48,index_tgfb3_mrna]/max(state[1][t48,index_tgfb3_mrna],MIN)
push!(OSC_TGFB3,bar1)
push!(OSC_TGFB3,bar2)
push!(OSC_TGFB3,bar3)
push!(OSC_TGFB3,bar4)


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

ST_PECAM_raw = copy(ST_PECAM)
ST_ACTA_raw = copy(ST_ACTA)
ST_Slug_raw = copy(ST_Slug)
ST_TGFB3_raw = copy(ST_TGFB3)

OSC_PECAM_raw = copy(OSC_PECAM)
OSC_ACTA_raw = copy(OSC_ACTA)
OSC_Slug_raw = copy(OSC_Slug)
OSC_TGFB3_raw = copy(OSC_TGFB3)

ST_PECAM = [sum(ST_PECAM[1:4:end])/N, sum(ST_PECAM[2:4:end])/N, sum(ST_PECAM[3:4:end])/N, sum(ST_PECAM[4:4:end])/N, std(ST_PECAM[1:4:end]), std(ST_PECAM[2:4:end]), std(ST_PECAM[3:4:end]), std(ST_PECAM[4:4:end])]
ST_ACTA  = [sum(ST_ACTA[1:4:end])/N, sum(ST_ACTA[2:4:end])/N, sum(ST_ACTA[3:4:end])/N, sum(ST_ACTA[4:4:end])/N, std(ST_ACTA[1:4:end]), std(ST_ACTA[2:4:end]), std(ST_ACTA[3:4:end]), std(ST_ACTA[4:4:end])]
ST_Slug  = [sum(ST_Slug[1:4:end])/N, sum(ST_Slug[2:4:end])/N, sum(ST_Slug[3:4:end])/N, sum(ST_Slug[4:4:end])/N, std(ST_Slug[1:4:end]), std(ST_Slug[2:4:end]), std(ST_Slug[3:4:end]), std(ST_Slug[4:4:end])]
ST_TGFB3 = [sum(ST_TGFB3[1:4:end])/N, sum(ST_TGFB3[2:4:end])/N, sum(ST_TGFB3[3:4:end])/N, sum(ST_TGFB3[4:4:end])/N, std(ST_TGFB3[1:4:end]), std(ST_TGFB3[2:4:end]), std(ST_TGFB3[3:4:end]), std(ST_TGFB3[4:4:end])]

OSC_PECAM  = [sum(OSC_PECAM[1:4:end])/N, sum(OSC_PECAM[2:4:end])/N, sum(OSC_PECAM[3:4:end])/N, sum(OSC_PECAM[4:4:end])/N, std(OSC_PECAM[1:4:end]), std(OSC_PECAM[2:4:end]), std(OSC_PECAM[3:4:end]), std(OSC_PECAM[4:4:end])]
OSC_ACTA   = [sum(OSC_ACTA[1:4:end])/N, sum(OSC_ACTA[2:4:end])/N, sum(OSC_ACTA[3:4:end])/N, sum(OSC_ACTA[4:4:end])/N, std(OSC_ACTA[1:4:end]), std(OSC_ACTA[2:4:end]), std(OSC_ACTA[3:4:end]), std(OSC_ACTA[4:4:end])]
OSC_Slug   = [sum(OSC_Slug[1:4:end])/N, sum(OSC_Slug[2:4:end])/N, sum(OSC_Slug[3:4:end])/N, sum(OSC_Slug[4:4:end])/N, std(OSC_Slug[1:4:end]), std(OSC_Slug[2:4:end]), std(OSC_Slug[3:4:end]), std(OSC_Slug[4:4:end])]
OSC_TGFB3  = [sum(OSC_TGFB3[1:4:end])/N, sum(OSC_TGFB3[2:4:end])/N, sum(OSC_TGFB3[3:4:end])/N, sum(OSC_TGFB3[4:4:end])/N, std(OSC_TGFB3[1:4:end]), std(OSC_TGFB3[2:4:end]), std(OSC_TGFB3[3:4:end]), std(OSC_TGFB3[4:4:end])]

out_dir = "../poets/results_poets/"

writedlm(string(out_dir,"ST_PECAM",".dat"),ST_PECAM)
writedlm(string(out_dir,"ST_ACTA",".dat"),ST_ACTA)
writedlm(string(out_dir,"ST_Slug",".dat"),ST_Slug)
writedlm(string(out_dir,"ST_TGFB3",".dat"),ST_TGFB3)
writedlm(string(out_dir,"OSC_PECAM",".dat"),OSC_PECAM)
writedlm(string(out_dir,"OSC_ACTA",".dat"),OSC_ACTA)
writedlm(string(out_dir,"OSC_Slug",".dat"),OSC_Slug)
writedlm(string(out_dir,"OSC_TGFB3",".dat"),OSC_TGFB3)

writedlm(string(out_dir,"ST_PECAM_raw",".dat"),ST_PECAM_raw)
writedlm(string(out_dir,"ST_ACTA_raw",".dat"),ST_ACTA_raw)
writedlm(string(out_dir,"ST_Slug_raw",".dat"),ST_Slug_raw)
writedlm(string(out_dir,"ST_TGFB3_raw",".dat"),ST_TGFB3_raw)
writedlm(string(out_dir,"OSC_PECAM_raw",".dat"),OSC_PECAM_raw)
writedlm(string(out_dir,"OSC_ACTA_raw",".dat"),OSC_ACTA_raw)
writedlm(string(out_dir,"OSC_Slug_raw",".dat"),OSC_Slug_raw)
writedlm(string(out_dir,"OSC_TGFB3_raw",".dat"),OSC_TGFB3_raw)


println(now())
