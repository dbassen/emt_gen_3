# To run
#julia  run_emt_poets.jl
julia run_emt_poets.jl /home/dbassen/Dropbox/server_swap_space/gen_3_model/poets  > run_emt_poets.out
# Dependencies
emt_grn_model_objective_function.jl executes ODEs and computes objective functions.
- The edit files specify conditions for each experiment and are called via ../src/spin_up_edits.jl which loads them into memory to avoid disk hits
- For shear stress simulations, shearTransferFunc.jl will be called within the shear edit files 
- Shear data is in: "../poets/shear_data_combined.jl"

# To edit emt_grn_model_objective_function.jl
Search for:
##### HARDCODED## 
or
HARDCODED##

in emt_grn_model_objective_function.jl


# main files  

emt_grn_model_objective_function.jl  
	Objective functions and ODE executions
medici_blot_combined.jl  
	Training data  
regen_prep_plot.jl  
	Regenerate timeseries for all parameter sets and compute requested values   
results_poets  
	Data summaries for figure 2  
run_emt_poets.jl  
	Run poets  

# poets output arrays  
EC.dat  
PC.dat  
RA.dat  


# inactive files  
decomp_emt_grn_model_objective_function.jl  
out_tmp  
parallel_regen_prep_plot.jl  



# run robustness
julia run_robustness.jl > robustness.out &

# get nfat and sp1 plot

julia run_regen_abundance_plot.jl > nfataspp.out &
