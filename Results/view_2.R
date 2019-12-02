xss_dat<-read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/output/xss.dat",header=F,sep='\t')#,row.names=NULL)
osc_1 <- read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/output/handfit/X_1dyne_per_cm2_1hz.dat",header=F,sep='\t')
osc_5 <- read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/output/handfit/X_5dyne_per_cm2_1hz.dat",header=F,sep='\t')
lss_5 <- read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/output/handfit/X_5dyne_per_cm2_0hz.dat",header=F,sep='\t')
lss_10<- read.csv("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/output/handfit/X_10dyne_per_cm2_0hz.dat",header=F,sep='\t')

source("/Users/dbassen/Dropbox/server_swap_space/gen_3_model/src/names.dat")
species <- newnames
names(xss_dat) <- species
names(osc_1) <- species
names(osc_5) <- species
names(lss_10) <- species
names(lss_5) <- species


# now need to plot the data 
# YAP1, YAP1_Active, PECAM,  Vim, Ecad

osc_1_48 <- osc_1[250,] # select last timepoint (48hrs)
osc_1_a<-c(osc_1_48$YAP1,osc_1_48$Active_YAP1,osc_1_48$CD31,osc_1_48$vimentin,osc_1_48$Ecadherin+osc_1_48$Ecadherin_Bcatenin)

osc_5_48 <- osc_5[250,] # select last timepoint (48hrs)
osc_5_a<-c(osc_5_48$YAP1,osc_5_48$Active_YAP1,osc_5_48$CD31,osc_5_48$vimentin,osc_5_48$Ecadherin+osc_5_48$Ecadherin_Bcatenin)

lss_5_48 <- lss_5[250,] # select last timepoint (48hrs)
lss_5_a<-c(lss_5_48$YAP1,lss_5_48$Active_YAP1,lss_5_48$CD31,lss_5_48$vimentin,lss_5_48$Ecadherin+lss_5_48$Ecadherin_Bcatenin)

lss_10_48 <- lss_10[250,] # select last timepoint
lss_10_a<-c(lss_10_48$YAP1,lss_10_48$Active_YAP1,lss_10_48$CD31,lss_10_48$vimentin,lss_10_48$Ecadherin+lss_10_48$Ecadherin_Bcatenin)

xss_dat_a <- c(xss_dat$YAP1,xss_dat$Active_YAP1,xss_dat$CD31,xss_dat$vimentin,xss_dat$Ecadherin+xss_dat$Ecadherin_Bcatenin)

par(mfrow=c(4,1))

means <- xss_dat_a
lvls  <- c("YAP1", "YAPN'","PECAM",  "Vim", "Ecad")
padx   <- 0.0

YTOP <- 200
TIC   <- 4
name  <- "XSS"
#barplotname<-'/Users/dbassen/work/tonicity_MPA_spring_2015/morpho_data_consolidated/bar_morph_ratios_07_27_2015.pdf'
#barcol<-c("green","blue","black","gray","gray")
mp <- barplot(means, axes=FALSE, axisnames=FALSE,  main=name, xlab="", ylab="",ylim=c(0,YTOP))#,col=barcol)
axis(1, labels=lvls, at = mp,cex.axis=2)
axis(2, at=seq(0 , YTOP, by=ceiling(YTOP/TIC)),cex.axis=2,las=1)

means <- osc_1_a
lvls  <- c("YAP1", "YAPN'","PECAM",  "Vim", "Ecad")
padx   <- 0.0

name  <- "OSC1"
#barplotname<-'/Users/dbassen/work/tonicity_MPA_spring_2015/morpho_data_consolidated/bar_morph_ratios_07_27_2015.pdf'
#barcol<-c("green","blue","black","gray","gray")
mp <- barplot(means, axes=FALSE, axisnames=FALSE,  main=name, xlab="", ylab="",ylim=c(0,YTOP))#,col=barcol)
axis(1, labels=lvls, at = mp,cex.axis=2)
axis(2, at=seq(0 , YTOP, by=ceiling(YTOP/TIC)),cex.axis=2,las=1)

means <- lss_5_a
lvls  <- c("YAP1", "YAPN'","PECAM",  "Vim", "Ecad")
padx   <- 0.0

name  <- "LSS5"
#barplotname<-'/Users/dbassen/work/tonicity_MPA_spring_2015/morpho_data_consolidated/bar_morph_ratios_07_27_2015.pdf'
#barcol<-c("green","blue","black","gray","gray")
mp <- barplot(means, axes=FALSE, axisnames=FALSE,  main=name, xlab="", ylab="",ylim=c(0,YTOP))#,col=barcol)
axis(1, labels=lvls, at = mp,cex.axis=2)
axis(2, at=seq(0 , YTOP, by=ceiling(YTOP/TIC)),cex.axis=2,las=1)


means <- lss_10_a
lvls  <- c("YAP1", "YAPN'","PECAM",  "Vim", "Ecad")
padx   <- 0.0

name  <- "LSS10"
#barplotname<-'/Users/dbassen/work/tonicity_MPA_spring_2015/morpho_data_consolidated/bar_morph_ratios_07_27_2015.pdf'
#barcol<-c("green","blue","black","gray","gray")
mp <- barplot(means, axes=FALSE, axisnames=FALSE,  main=name, xlab="", ylab="",ylim=c(0,YTOP))#,col=barcol)
axis(1, labels=lvls, at = mp,cex.axis=2)
axis(2, at=seq(0 , YTOP, by=ceiling(YTOP/TIC)),cex.axis=2,las=1)

####

means <- osc_5_a
lvls  <- c("YAP1", "YAPN'","PECAM",  "Vim", "Ecad")
padx   <- 0.0

name  <- "OSC5"
#barplotname<-'/Users/dbassen/work/tonicity_MPA_spring_2015/morpho_data_consolidated/bar_morph_ratios_07_27_2015.pdf'
#barcol<-c("green","blue","black","gray","gray")
mp <- barplot(means, axes=FALSE, axisnames=FALSE,  main=name, xlab="", ylab="",ylim=c(0,YTOP))#,col=barcol)
axis(1, labels=lvls, at = mp,cex.axis=2)
axis(2, at=seq(0 , YTOP, by=ceiling(YTOP/TIC)),cex.axis=2,las=1)


####


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
