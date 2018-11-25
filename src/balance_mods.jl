
# set ribosome and RNAP rates to 0
dxdt_vector[RNAP_i] = 0;
dxdt_vector[RIBOSOME_i] = 0;
# set ppase rate to 0
dxdt_vector[ppase_i] = 0;
dxdt_vector[SHEAR_STRESS_i] = 0;
dxdt_vector[SHEAR_STRESS_2_i] = 0;
#
