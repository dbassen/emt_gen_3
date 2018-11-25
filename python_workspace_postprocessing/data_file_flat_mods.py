# add modifications to data file here
ppase = ['initial_condition_array$PPase',110.0]
rnap  = ['initial_condition_array$RNAP',270.0]
ribo  = ['initial_condition_array$RIBOSOME',3599.9]
dact_psmad = ['rate_constant_array$deactivation_pSmad: pSmad =(PPase)=> Smad',0.9]
dact_plcy  = ['rate_constant_array$deactivation_Active_PLCy: Active_PLCy =([])=> PLCy',25.0]
dact_pkc   = ['rate_constant_array$deactivation_Active_PKC: Active_PKC =([])=> PKC',1.0]
dact_calc  = ['rate_constant_array$deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin',100.0]
dact_nfatc = ['rate_constant_array$deactivation_Active_NFATc: Active_NFATc =([])=> NFATc',100.0]
sat_ecad_bcat_ecad = ['saturation_constant_array$Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin\t species: Ecadherin',2.0]
sat_ecad_bcat_bcat = ['saturation_constant_array$Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin\t species: Bcatenin',0.5]

# ADD NEW KEYWORD VARIABLE TO THE LIST BELOW
keywords_values = [ppase,rnap,ribo,dact_psmad,dact_plcy,dact_pkc,dact_calc,dact_nfatc,sat_ecad_bcat_ecad,sat_ecad_bcat_bcat]
