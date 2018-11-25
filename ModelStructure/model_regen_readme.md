# gen 3 rebuild when adding new model species / reactions

1. Make changes to Model.net in /Users/dbassen/Dropbox/server_swap_space/gen_3_model/ModelStructure/Model.net

2. run source Generate.sh Configuration.xml in
/Users/dbassen/work/KwateeServer-v1.0

3. copy source files from /Users/dbassen/work/KwateeServer-v1.0/gen3/src to
/Users/dbassen/Dropbox/server_swap_space/gen_3_model/src/
_and_ copy KwateeServer-v1.0/gen3/network/Network.dat to server_swap_space/gen_3_model/
  __Can use__ /Users/dbassen/Dropbox/server_swap_space/gen_3_model/readme_copy_files.md
    ___summary___ get src files and network.dat

__in /src/__
4. run source updateSrcFiles.sh which runs modify_jl_control_logic.py and modify_jl_data_file.py
_and_ run source move_sim_files.sh to replace the original files
_and_ manually add [] to mean( minimum(),maximum() ) statements
#                             ^                   ^
*                             [                   ]
# repair balances.jl shear stress indices
# Also manually add endogenous expression for CD31 and YAP1 (see below)
# push!(transfer_function_vector,0.5) (more below)

5. edit edit_file_global.jl to include any new species to change
_and especially if_ any new treatment rates edit to change to 0
_and you need to set these manually..._
# initial conditions
tgfb12_initial_cond_index = 115 # TGFB12
R_initial_cond_index = 114
vegf_initial_cond_index = 120 # VEGF

6. run python the_edit_editor.py
_and_ run it again if indices are incorrect (if they are still wrong check for discrepancies)

7. update indices in new_SimulationFunctions.jl

8. Verify no new changes to RunAllSimulations control function order / #

# notes


More edits to the control fie are required:

# activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[16,1]*(pSmad*Active_YAP1)^control_parameter_array[16,2])/(1+control_parameter_array[16,1]*(pSmad*Active_YAP1)^control_parameter_array[16,2]));

<!-- else
	push!(transfer_function_vector,1.0 - (control_parameter_array[9,1]*(pSmad*Active_YAP1)^control_parameter_array[9,2])/(1+control_parameter_array[9,1]*(pSmad*Active_YAP1)^control_parameter_array[9,2]));
end -->

# Added endogenous expression (need to do same for CD31)
# activation_YAP1_by_ROCK target: induction_gene_YAP1 actor: Active_ROCK type: induction
push!(transfer_function_vector,(control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2])/(1+control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2]));
push!(transfer_function_vector,0.5) # partial endogenous expression





#remove Active_RhoA and patch any errors with RhoA_GTP in Model.net

# add shear terms dxdt to 0 in balances, due to dilution term (?)
# set ribosome and RNAP rates to 0
dxdt_vector[88] = 0;
dxdt_vector[89] = 0;
# set ppase rate to 0
dxdt_vector[78] = 0;
# set shear values to 0
dxdt_vector[70] = 0;
dxdt_vector[95] = 0;

# reverify RhoA in Model.net


# control mods for endogenous expression ::
#  activation_YAP1_by_ROCK target: induction_gene_YAP1 actor: Active_ROCK type: induction
push!(transfer_function_vector,(control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2])/(1+control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2]));
push!(transfer_function_vector,0.7)
control_vector[178] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_CD1_by_SHEAR_STRESS_2 target: induction_gene_CD31 actor: SHEAR_STRESS_2 type: induction
push!(transfer_function_vector,(control_parameter_array[23,1]*(SHEAR_STRESS_2)^control_parameter_array[23,2])/(1+control_parameter_array[23,1]*(SHEAR_STRESS_2)^control_parameter_array[23,2]));
push!(transfer_function_vector,0.5)
control_vector[179] = mean(transfer_function_vector);
transfer_function_vector = 0;
