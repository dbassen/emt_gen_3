### SELECTED DATA FILE INDICES FOR EXPERIMENTAL CONDITION

initial_cond_update_array = [];
rate_constant_update_array = [];
control_parameter_update_array = [];

# Shear condition application
M = 1 # MAGNITUDE (Dynes / cm^2)
F = 1 # FREQUENCY (Hz)

include("shearTransferFunc.jl")

push!(initial_cond_update_array,[SHEAR_STRESS_initial_cond_index,TAO_1])
push!(initial_cond_update_array,[SHEAR_STRESS_2_initial_cond_index,TAO_2])


# Run snail slug instead
#push!(rate_constant_update_array,[152,10.0]) # induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
#push!(rate_constant_update_array,[ss_virus_forward_rate_index,4.0])
#push!(rate_constant_update_array,[ss_virus_reverse_rate_index,0.1])

# give MAPK inhibitor

#push!(rate_constant_update_array,[U0126_foward_rate_index,4.0])
#push!(rate_constant_update_array,[U0126_reverse_rate_index,0.1])

# ECADHERINchange this to transcription rate
# push!(rate_constant_update_array,[ecad_trans_rate_index,ecad_trans_rate*5.0])

# Block TGFB3
#push!(rate_constant_update_array,[TGFB3_Ab_foward_rate_index,4.0])
#push!(rate_constant_update_array,[TGFB3_Ab_reverse_rate_index,0.1])

# TGFB3 dosing

#push!(rate_constant_update_array,[TGFB3_foward_rate_index,4.0])
#push!(rate_constant_update_array,[TGFB3_reverse_rate_index,0.1])

# DN LEF1 temoprary
#lef1_induciton_rate_index = 141
#lef1_induciton_rate = 0.01

# DN SMAD temoprary
#SMAD_induciton_rate_index = 134
#SMAD_induciton_rate = 0.01

# push modifications to RAM
#UpdateArray(data_dictionary,"INITIAL_CONDITION_ARRAY",initial_cond_update_array)
#UpdateArray(data_dictionary,"RATE_CONSTANT_ARRAY",rate_constant_update_array)


# mRNA degradation test
#tubulin_induction_index = 145
#push!(rate_constant_update_array,[tubulin_induction_index,0.0])
