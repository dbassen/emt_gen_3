include("edit_file_global.jl")
simulations = []
simulations_ICA = []
include("edit_file_none.jl")
push!(simulations,rate_constant_update_array)
push!(simulations_ICA,initial_cond_update_array)
# push!(simulations_ICA,initial_cond_update_array)
include("edit_file_1dyne_per_cm2_0hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

include("edit_file_5dyne_per_cm2_0hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

include("edit_file_10dyne_per_cm2_0hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

include("edit_file_1dyne_per_cm2_1hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

include("edit_file_5dyne_per_cm2_1hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

include("edit_file_10dyne_per_cm2_1hz.jl")
push!(simulations_ICA,initial_cond_update_array)
push!(simulations,rate_constant_update_array)

#include("edit_file_tgfb.jl")
#push!(simulations,rate_constant_update_array)
#@show rate_constant_update_array
#include("edit_file_mapkin.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_ss.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_ssecad.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_ss_tgfb3ab.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_ss_dnlef1.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_tgfb3.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_dnsmad.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_tgfb3_dnlef1.jl")
#push!(simulations,rate_constant_update_array)
#include("edit_file_tgfb_tgfb3ab.jl")
#push!(simulations,rate_constant_update_array)#
