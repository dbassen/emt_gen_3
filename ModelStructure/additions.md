# F(M,f) activates RhoA_GTP
# RhoA_GTP activates Active_ROCK
# Active_ROCK activates YAP1 via availability  
  # Sequestered_YAP1 and YAP1  
  # - transcription of YAP1 (Free YAP1) and competition with a sequestering equation makes sense,
  # it will probably be easier to fit transcription of sequestered YAP1
  #
  #


# New species


# Force

condition_SHEAR_STRESS,[],[],SHEAR_STRESS,-inf,inf;
condition_SHEAR_STRESS_2,[],[],SHEAR_STRESS_2,-inf,inf;

# transcription
induction_gene_RhoA,gene_RhoA,mRNA_RhoA,RNAP;
induction_gene_ROCK,gene_ROCK,mRNA_ROCK,RNAP;
induction_gene_YAP1,gene_YAP1,mRNA_YAP1,RNAP;
induction_gene_CD31,gene_CD31,mRNA_CD31,RNAP;
induction_gene_Akt,gene_Akt,mRNA_Akt,RNAP;


# // ACTIVE PECAM? Perhaps there is an active PECAM state that induced by strong shear stress
# translation

translation_mRNA_RhoA,mRNA_RhoA,RhoA,RIBOSOME;
translation_mRNA_ROCK,mRNA_ROCK,ROCK,RIBOSOME;
translation_mRNA_YAP1,mRNA_YAP1,YAP1,RIBOSOME;
translation_mRNA_CD31,mRNA_CD31,CD31,RIBOSOME;
translation_mRNA_Akt,mRNA_Akt,Akt,RIBOSOME;

# mRNA

# Protein

deactivation_RhoA_GTP,[],RhoA_GTP,RhoA,0,inf;
deactivation_Active_ROCK,[],Active_ROCK,ROCK,0,inf;
deactivation_YAP1,[],Active_YAP1,YAP1,0,inf;
deactivation_pAkt,PPase,pAkt,Akt,0,inf;


degradation_RhoA,[],RhoA,[],0,inf;
degradation_Active_RhoA,[],Active_RhoA,[],0,inf;
degradation_ROCK,[],ROCK,[],0,inf;
degradation_Active_ROCK,[],Active_ROCK,[],0,inf;
degradation_YAP1,[],YAP1,[],0,inf;
degradation_Active_YAP1,[],Active_YAP1,[],0,inf;
degradation_Sequestered_YAP1,[],degradation_Sequestered_YAP1,[],0,inf;
degradation_CD31,[],CD31,[],0,inf;
degradation_Akt,[],Akt,[],0,inf;
degradation_pAkt,[],pAkt,[],0,inf;


#YAP1

#  Sequestering_YAP1,[],YAP1,Sequestered_YAP1,-inf,inf;

Sequester_YAP1,[],YAP1,Sequestered_YAP1,0,inf;
Release_YAP1,[],Sequestered_YAP1,YAP1,0,inf;

#Activate_YAP1,ROCK,YAP1,Active_YAP1,0,inf;
//  only makes sense if nuclear transport is reversible(?)
deactivation_YAP1,[],Active_YAP1,YAP1,0,inf;
#/ control logic

# regulation

# X activates rhoA
SHEAR_STRESS_activation_RhoA,SHEAR_STRESS,RhoA,RhoA_GTP,0,inf;


# rhoa activates ROCK
RhoA_GTP_activation_ROCK,RhoA_GTP,ROCK,Active_ROCK,0,inf;

#
RhoA_GTP_activation_ROCK,RhoA_GTP,ROCK,Active_ROCK,0,inf;
Active_ROCK_activation_YAP1,Active_ROCK,YAP1,Active_YAP1,0,inf;

# PECAM (CD31) activates Akt
CD31_phosphorylation_Akt,CD31,Akt,pAkt,0,inf;

// Control terms signal transduction -
#pragma handler_class = VLCGSignalTransductionControlParserDelegate
ROCK_inhibition_Sequester_YAP1,ROCK,Sequester_YAP1,inhibition;
Akt_acitvation_Sequester_YAP1,pAkt,Sequester_YAP1,induction;


##  ss reg by psmad controled by Active_YAP1
activation_SNAIL_SLUG_by_pSmad,pSmad,induction_gene_SNAIL_SLUG,induction;

# control (modify in python code modifier)
activation_YAP1_by_ROCK,Active_ROCK,induction_gene_YAP1,induction;
activation_CD1_by_SHEAR_STRESS_2,SHEAR_STRESS_2,induction_gene_CD31,induction;


# Subtractions
activation_SNAIL_SLUG_by_AP1_SP1_P,AP1_SP1_P,induction_gene_SNAIL_SLUG,induction;

#
