### DB 5/17/17
# Logic flat file 

# Ecadherin transcription
activators=['activation_Ecadherin_by_Active_NFATc','activation_Ecadherin_by_ecad_virus']
inhibitors=['repression_Ecadherin_by_SNAIL_SLUG','repression_Ecadherin_by_Active_LEF1']
GROUPS = [activators,inhibitors] # ENTER GROUPS OF CONTROL TERMS THAT ARE TO BE INTERGRATED TOGETHER
INTEGR = ['maximum','minimum','mean'] # ENTER JULIA FUNCTION NAMES FOR THE INTEGRATION FUNCTIONS # last one is the outter most integration function
ACTORS = ['','','SNAIL_SLUG:SNAIL_SLUG*Active_LEF1','Active_LEF1:Active_LEF1*pSmad'] # old:new '' means no modification
pointer.reconfigure(GROUPS,INTEGR,ACTORS)

# TGFB3 transcription

effectors=['activation_TGFB3_by_TCF4 target','repression_TGFB3_by_YREG1']
GROUPS=[effectors]
INTEGR=['minimum']
ACTORS=['','']
pointer.reconfigure(GROUPS,INTEGR,ACTORS)

# SNAIL_SLUG transcription
activators=['activation_SNAIL_SLUG_by_AP1_SP1_P','activation_SNAIL_SLUG_by_ss_virus']
GROUPS=[activators]
INTEGR=['maximum']
ACTORS=['','']
pointer.reconfigure(GROUPS,INTEGR,ACTORS)


### EOF
