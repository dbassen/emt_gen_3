dat<-read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/output/xss.dat",header=F,sep='\t')#,row.names=NULL)
species<-read.csv("/Users/dbassen/work/varner_gould_emt_model/emt_grn_bassen_model/Results/df_names_r.csv",header=T)

names(dat) <- species$V1

abundance_nm <- format(as.numeric(dat), scientific=FALSE,digits=2, nsmall=2)

#abundance_nm <- as.integer(dat)


dat.ready <- cbind(species,abundance_nm)

 
prots <- dat.ready[dat.ready$species_type=="protein",]

bcat_regs <- dat.ready[dat.ready$species_name=="Ecadherin"|dat.ready$species_name=="Bcatenin"|dat.ready$species_name=="Ecadherin_Bcatenin"|dat.ready$species_name=="APC_AXIN_Bcatenin"|dat.ready$species_name=="APC_AXIN",]

mrna <- dat.ready[dat.ready$species_type=="mRNA",]

dat.ready[dat.ready$species_type=="reg",]
bcat_regs


#prots[prots$abundance_nm>1e3,] # broke?

#mean(prots$abundance_nm)
#hist(log10(abundance_nm))#,data=prots)

dat<-read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/output/xss.dat",header=F,sep='\t')#,row.names=NULL)

dat_ess<-read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/output/Fig2Simulations/X_ssecad.dat",header=F,sep='\t')#,row.names=NULL)
dat_ss<-read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/output/Fig2Simulations/X_ss.dat",header=F,sep='\t')#,row.names=NULL)

ecad_XSS <- dat$V51
ecad_ess <- dat_ess[528,]$V51
ecad_ss <- dat_ss[528,]$V51

ecad_XSS
ecad_ss
ecad_ess

ecadbcat_XSS <- dat$V53
ecadbcat_ss <- dat_ss[528,]$V53
ecadbcat_ess <- dat_ess[528,]$V53

ecadbcat_XSS 
ecadbcat_ss 
ecadbcat_ess 


tcf4_active_xss <-dat$V57
tcf4_active_ss <-dat_ss[528,]$V57

tcf4_active_xss 
tcf4_active_ss


yreg_XSS <- dat$V61
yreg_ess <- dat_ess[528,]$V61
yreg_ss <- dat_ss[528,]$V61

yreg_XSS
yreg_ess
yreg_ss


bcat_regs_xss <- dat.ready[dat.ready$species_name=="Ecadherin"|dat.ready$species_name=="Bcatenin"|dat.ready$species_name=="Ecadherin_Bcatenin"|dat.ready$species_name=="APC_AXIN_Bcatenin"|dat.ready$species_name=="APC_AXIN",]
bcat_regs_xss

bcat_xss <-dat$V52
bcat_ss <-dat_ss[528,]$V52

tcf4_active_xss 
tcf4_active_ss




hist(as.integer(as.character(prots$abundance_nm)))
dafaq <- as.integer(as.character(prots$abundance_nm))

mean(dafaq)
median(dafaq)
sd(dafaq)
