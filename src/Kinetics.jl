# ----------------------------------------------------------------------------------- #
# Copyright (c) 2018 Varnerlab
# School of Chemical Engineering Purdue University
# W. Lafayette IN 46907 USA

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #
function Kinetics(t,x,data_dictionary)
# --------------------------------------------------------------------- #
# Kinetics.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 07-02-2018 18:19:03
# 
# Input arguments: 
# t  - current time 
# x  - state vector 
# data_dictionary - parameter vector 
# 
# Return arguments: 
# rate_vector - rate vector 
# --------------------------------------------------------------------- #
# 
# Alias the species vector - 
gene_Smad = x[1];
gene_Ecadherin = x[2];
gene_Bcatenin = x[3];
gene_PLCy = x[4];
gene_PKC = x[5];
gene_RAF = x[6];
gene_RAS = x[7];
gene_AP1_SP1 = x[8];
gene_GSK3 = x[9];
gene_tubulin = x[10];
gene_SNAIL_SLUG = x[11];
gene_Calcineurin = x[12];
gene_APC_AXIN = x[13];
gene_PI3K = x[14];
gene_RhoA = x[15];
gene_ROCK = x[16];
gene_YAP1 = x[17];
gene_CD31 = x[18];
gene_Akt = x[19];
mRNA_Smad = x[20];
mRNA_Ecadherin = x[21];
mRNA_Bcatenin = x[22];
mRNA_PLCy = x[23];
mRNA_PKC = x[24];
mRNA_RAF = x[25];
mRNA_RAS = x[26];
mRNA_AP1_SP1 = x[27];
mRNA_Calcineurin = x[28];
mRNA_SNAIL_SLUG = x[29];
mRNA_tubulin = x[30];
mRNA_APC_AXIN = x[31];
mRNA_GSK3 = x[32];
mRNA_PI3K = x[33];
mRNA_RhoA = x[34];
mRNA_ROCK = x[35];
mRNA_YAP1 = x[36];
mRNA_CD31 = x[37];
mRNA_Akt = x[38];
PLCy = x[39];
Active_PLCy = x[40];
Calcineurin = x[41];
Active_Calcineurin = x[42];
NFATc = x[43];
Active_NFATc = x[44];
PKC = x[45];
Active_PKC = x[46];
RAF = x[47];
RAF_P = x[48];
Smad = x[49];
pSmad = x[50];
PI3K = x[51];
PI3K_P = x[52];
GSK3 = x[53];
GSK3_P = x[54];
RAS = x[55];
RAS_GTP = x[56];
MAPK = x[57];
pMAPK = x[58];
AP1_SP1 = x[59];
AP1_SP1_P = x[60];
Ecadherin = x[61];
Bcatenin = x[62];
Ecadherin_Bcatenin = x[63];
APC_AXIN = x[64];
APC_AXIN_Bcatenin = x[65];
TCF4 = x[66];
Active_TCF4 = x[67];
LEF1 = x[68];
Active_LEF1 = x[69];
SHEAR_STRESS = x[70];
RhoA = x[71];
RhoA_GTP = x[72];
ROCK = x[73];
Active_ROCK = x[74];
YAP1 = x[75];
Active_YAP1 = x[76];
Sequestered_YAP1 = x[77];
CD31 = x[78];
Akt = x[79];
pAkt = x[80];
PPase = x[81];
YREG1 = x[82];
SNAIL_SLUG = x[83];
vimentin = x[84];
tubulin = x[85];
RNAP = x[86];
RIBOSOME = x[87];
TGFB3_Ab = x[88];
ss_virus = x[89];
ecad_virus = x[90];
U0126 = x[91];
vivit = x[92];
SHEAR_STRESS_2 = x[93];
gene_TCF4 = x[94];
gene_TGFB3 = x[95];
gene_YREG1 = x[96];
gene_LEF1 = x[97];
gene_vimentin = x[98];
gene_R = x[99];
gene_VEGFR = x[100];
gene_NFATc = x[101];
gene_MAPK = x[102];
mRNA_TCF4 = x[103];
mRNA_TGFB3 = x[104];
mRNA_YREG1 = x[105];
mRNA_LEF1 = x[106];
mRNA_vimentin = x[107];
mRNA_R = x[108];
mRNA_VEGFR = x[109];
mRNA_NFATc = x[110];
mRNA_MAPK = x[111];
R = x[112];
TGFB12 = x[113];
TGFB3 = x[114];
VEGF = x[115];
TGFB12_R = x[116];
TGFB3_R = x[117];
VEGFR = x[118];
VEGF_VEGFR = x[119];

# Formulate the kinetic rate vector - 
rate_constant_array = data_dictionary["RATE_CONSTANT_ARRAY"];
saturation_constant_array = data_dictionary["SATURATION_CONSTANT_ARRAY"];
rate_vector = Float64[];

# 1 TGFB12_binding: TGFB12+R =([])=> TGFB12_R
tmp = rate_constant_array[1]*(TGFB12)/(saturation_constant_array[1,113] + TGFB12)*(R)/(saturation_constant_array[1,112] + R);
push!(rate_vector,tmp);

# 2 TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)
tmp = rate_constant_array[2]*(TGFB12_R)/(saturation_constant_array[2,116] + TGFB12_R);
push!(rate_vector,tmp);

# 3 TGFB3_binding: TGFB3+R =([])=> TGFB3_R
tmp = rate_constant_array[3]*(TGFB3)/(saturation_constant_array[3,114] + TGFB3)*(R)/(saturation_constant_array[3,112] + R);
push!(rate_vector,tmp);

# 4 TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)
tmp = rate_constant_array[4]*(TGFB3_R)/(saturation_constant_array[4,117] + TGFB3_R);
push!(rate_vector,tmp);

# 5 VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR
tmp = rate_constant_array[5]*(VEGF)/(saturation_constant_array[5,115] + VEGF)*(VEGFR)/(saturation_constant_array[5,118] + VEGFR);
push!(rate_vector,tmp);

# 6 VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)
tmp = rate_constant_array[6]*(VEGF_VEGFR)/(saturation_constant_array[6,119] + VEGF_VEGFR);
push!(rate_vector,tmp);

# 7 VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy
tmp = rate_constant_array[7]*(VEGF_VEGFR)*(PLCy)/(saturation_constant_array[7,39] + PLCy);
push!(rate_vector,tmp);

# 8 PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin
tmp = rate_constant_array[8]*(Active_PLCy)*(Calcineurin)/(saturation_constant_array[8,41] + Calcineurin);
push!(rate_vector,tmp);

# 9 Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc
tmp = rate_constant_array[9]*(Active_Calcineurin)*(NFATc)/(saturation_constant_array[9,43] + NFATc);
push!(rate_vector,tmp);

# 10 PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC
tmp = rate_constant_array[10]*(Active_PLCy)*(PKC)/(saturation_constant_array[10,45] + PKC);
push!(rate_vector,tmp);

# 11 PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P
tmp = rate_constant_array[11]*(Active_PKC)*(RAF)/(saturation_constant_array[11,47] + RAF);
push!(rate_vector,tmp);

# 12 TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad
tmp = rate_constant_array[12]*(TGFB12_R)*(Smad)/(saturation_constant_array[12,49] + Smad);
push!(rate_vector,tmp);

# 13 TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad
tmp = rate_constant_array[13]*(TGFB3_R)*(Smad)/(saturation_constant_array[13,49] + Smad);
push!(rate_vector,tmp);

# 14 TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P
tmp = rate_constant_array[14]*(TGFB3_R)*(PI3K)/(saturation_constant_array[14,51] + PI3K);
push!(rate_vector,tmp);

# 15 PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P
tmp = rate_constant_array[15]*(PI3K_P)*(GSK3)/(saturation_constant_array[15,53] + GSK3);
push!(rate_vector,tmp);

# 16 TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
tmp = rate_constant_array[16]*(TGFB12_R)*(RAS)/(saturation_constant_array[16,55] + RAS);
push!(rate_vector,tmp);

# 17 RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
tmp = rate_constant_array[17]*(RAS_GTP)*(RAF)/(saturation_constant_array[17,47] + RAF);
push!(rate_vector,tmp);

# 18 RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
tmp = rate_constant_array[18]*(RAF_P)*(MAPK)/(saturation_constant_array[18,57] + MAPK);
push!(rate_vector,tmp);

# 19 MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
tmp = rate_constant_array[19]*(pMAPK)*(Smad)/(saturation_constant_array[19,49] + Smad);
push!(rate_vector,tmp);

# 20 MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
tmp = rate_constant_array[20]*(pMAPK)*(AP1_SP1)/(saturation_constant_array[20,59] + AP1_SP1);
push!(rate_vector,tmp);

# 21 Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
tmp = rate_constant_array[21]*(Ecadherin)/(saturation_constant_array[21,61] + Ecadherin)*(Bcatenin)/(saturation_constant_array[21,62] + Bcatenin);
push!(rate_vector,tmp);

# 22 Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
tmp = rate_constant_array[22]*(Ecadherin_Bcatenin)/(saturation_constant_array[22,63] + Ecadherin_Bcatenin);
push!(rate_vector,tmp);

# 23 Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin
tmp = rate_constant_array[23]*(APC_AXIN)/(saturation_constant_array[23,64] + APC_AXIN)*(Bcatenin)/(saturation_constant_array[23,62] + Bcatenin);
push!(rate_vector,tmp);

# 24 Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin
tmp = rate_constant_array[24]*(APC_AXIN_Bcatenin)/(saturation_constant_array[24,65] + APC_AXIN_Bcatenin);
push!(rate_vector,tmp);

# 25 TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
tmp = rate_constant_array[25]*(TCF4)/(saturation_constant_array[25,66] + TCF4)*(Bcatenin)/(saturation_constant_array[25,62] + Bcatenin);
push!(rate_vector,tmp);

# 26 TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
tmp = rate_constant_array[26]*(Active_TCF4)/(saturation_constant_array[26,67] + Active_TCF4);
push!(rate_vector,tmp);

# 27 LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
tmp = rate_constant_array[27]*(LEF1)/(saturation_constant_array[27,68] + LEF1)*(Bcatenin)/(saturation_constant_array[27,62] + Bcatenin);
push!(rate_vector,tmp);

# 28 LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
tmp = rate_constant_array[28]*(Active_LEF1)/(saturation_constant_array[28,69] + Active_LEF1);
push!(rate_vector,tmp);

# 29 SHEAR_STRESS_activation_RhoA: RhoA =(SHEAR_STRESS)=> RhoA_GTP
tmp = rate_constant_array[29]*(SHEAR_STRESS)*(RhoA)/(saturation_constant_array[29,71] + RhoA);
push!(rate_vector,tmp);

# 30 RhoA_GTP_activation_ROCK: ROCK =(RhoA_GTP)=> Active_ROCK
tmp = rate_constant_array[30]*(RhoA_GTP)*(ROCK)/(saturation_constant_array[30,73] + ROCK);
push!(rate_vector,tmp);

# 31 Active_ROCK_activation_YAP1: YAP1 =(Active_ROCK)=> Active_YAP1
tmp = rate_constant_array[31]*(Active_ROCK)*(YAP1)/(saturation_constant_array[31,75] + YAP1);
push!(rate_vector,tmp);

# 32 Sequester_YAP1: YAP1 =([])=> Sequestered_YAP1
tmp = rate_constant_array[32]*(YAP1)/(saturation_constant_array[32,75] + YAP1);
push!(rate_vector,tmp);

# 33 Release_YAP1: Sequestered_YAP1 =([])=> YAP1
tmp = rate_constant_array[33]*(Sequestered_YAP1)/(saturation_constant_array[33,77] + Sequestered_YAP1);
push!(rate_vector,tmp);

# 34 CD31_phosphorylation_Akt: Akt =(CD31)=> pAkt
tmp = rate_constant_array[34]*(CD31)*(Akt)/(saturation_constant_array[34,79] + Akt);
push!(rate_vector,tmp);

# 35 deactivation_pSmad: pSmad =(PPase)=> Smad
tmp = rate_constant_array[35]*(PPase)*(pSmad)/(saturation_constant_array[35,50] + pSmad);
push!(rate_vector,tmp);

# 36 deactivation_RAF_P: RAF_P =(PPase)=> RAF
tmp = rate_constant_array[36]*(PPase)*(RAF_P)/(saturation_constant_array[36,48] + RAF_P);
push!(rate_vector,tmp);

# 37 deactivation_RAS_GTP: RAS_GTP =([])=> RAS
tmp = rate_constant_array[37]*(RAS_GTP)/(saturation_constant_array[37,56] + RAS_GTP);
push!(rate_vector,tmp);

# 38 deactivation_pMAPK: pMAPK =(PPase)=> MAPK
tmp = rate_constant_array[38]*(PPase)*(pMAPK)/(saturation_constant_array[38,58] + pMAPK);
push!(rate_vector,tmp);

# 39 deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1
tmp = rate_constant_array[39]*(PPase)*(AP1_SP1_P)/(saturation_constant_array[39,60] + AP1_SP1_P);
push!(rate_vector,tmp);

# 40 deactivation_Active_PLCy: Active_PLCy =([])=> PLCy
tmp = rate_constant_array[40]*(Active_PLCy)/(saturation_constant_array[40,40] + Active_PLCy);
push!(rate_vector,tmp);

# 41 deactivation_Active_PKC: Active_PKC =([])=> PKC
tmp = rate_constant_array[41]*(Active_PKC)/(saturation_constant_array[41,46] + Active_PKC);
push!(rate_vector,tmp);

# 42 deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin
tmp = rate_constant_array[42]*(Active_Calcineurin)/(saturation_constant_array[42,42] + Active_Calcineurin);
push!(rate_vector,tmp);

# 43 deactivation_Active_NFATc: Active_NFATc =([])=> NFATc
tmp = rate_constant_array[43]*(Active_NFATc)/(saturation_constant_array[43,44] + Active_NFATc);
push!(rate_vector,tmp);

# 44 deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3
tmp = rate_constant_array[44]*(PPase)*(GSK3_P)/(saturation_constant_array[44,54] + GSK3_P);
push!(rate_vector,tmp);

# 45 degradation_TGFB12_R: TGFB12_R =([])=> []
tmp = rate_constant_array[45]*(TGFB12_R);
push!(rate_vector,tmp);

# 46 degradation_TGFB3_R: TGFB3_R =([])=> []
tmp = rate_constant_array[46]*(TGFB3_R);
push!(rate_vector,tmp);

# 47 degradation_TGFB3: TGFB3 =([])=> []
tmp = rate_constant_array[47]*(TGFB3);
push!(rate_vector,tmp);

# 48 VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
tmp = rate_constant_array[48]*(VEGF_VEGFR);
push!(rate_vector,tmp);

# 49 Bcatenin_degradation: Bcatenin =([])=> []
tmp = rate_constant_array[49]*(Bcatenin);
push!(rate_vector,tmp);

# 50 Ecadherin_degrdation: Ecadherin =([])=> []
tmp = rate_constant_array[50]*(Ecadherin);
push!(rate_vector,tmp);

# 51 Smad_degradation: Smad =([])=> []
tmp = rate_constant_array[51]*(Smad);
push!(rate_vector,tmp);

# 52 TCF4_degradation: TCF4 =([])=> []
tmp = rate_constant_array[52]*(TCF4);
push!(rate_vector,tmp);

# 53 Active_TCF4_degradation: Active_TCF4 =([])=> []
tmp = rate_constant_array[53]*(Active_TCF4);
push!(rate_vector,tmp);

# 54 YREG1_degradation: YREG1 =([])=> []
tmp = rate_constant_array[54]*(YREG1);
push!(rate_vector,tmp);

# 55 SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
tmp = rate_constant_array[55]*(SNAIL_SLUG);
push!(rate_vector,tmp);

# 56 LEF1_degradation: LEF1 =([])=> []
tmp = rate_constant_array[56]*(LEF1);
push!(rate_vector,tmp);

# 57 Active_LEF1_degradation: Active_LEF1 =([])=> []
tmp = rate_constant_array[57]*(Active_LEF1);
push!(rate_vector,tmp);

# 58 vimentin_degradation: vimentin =([])=> []
tmp = rate_constant_array[58]*(vimentin);
push!(rate_vector,tmp);

# 59 VEGFR_degradation: VEGFR =([])=> []
tmp = rate_constant_array[59]*(VEGFR);
push!(rate_vector,tmp);

# 60 NFATc_degradation: NFATc =([])=> []
tmp = rate_constant_array[60]*(NFATc);
push!(rate_vector,tmp);

# 61 Active_NFATc_degradation: Active_NFATc =([])=> []
tmp = rate_constant_array[61]*(Active_NFATc);
push!(rate_vector,tmp);

# 62 degradation_MAPK: MAPK =([])=> []
tmp = rate_constant_array[62]*(MAPK);
push!(rate_vector,tmp);

# 63 degradation_R: R =([])=> []
tmp = rate_constant_array[63]*(R);
push!(rate_vector,tmp);

# 64 Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
tmp = rate_constant_array[64]*(Ecadherin_Bcatenin);
push!(rate_vector,tmp);

# 65 AP1_SP1_degradation: AP1_SP1 =([])=> []
tmp = rate_constant_array[65]*(AP1_SP1);
push!(rate_vector,tmp);

# 66 AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
tmp = rate_constant_array[66]*(AP1_SP1_P);
push!(rate_vector,tmp);

# 67 RAS_degradation: RAS =([])=> []
tmp = rate_constant_array[67]*(RAS);
push!(rate_vector,tmp);

# 68 RAF_degradation: RAF =([])=> []
tmp = rate_constant_array[68]*(RAF);
push!(rate_vector,tmp);

# 69 RAS_GTP_degradation: RAS_GTP =([])=> []
tmp = rate_constant_array[69]*(RAS_GTP);
push!(rate_vector,tmp);

# 70 RAF_P_degradation: RAF_P =([])=> []
tmp = rate_constant_array[70]*(RAF_P);
push!(rate_vector,tmp);

# 71 pMAPK_degradation: pMAPK =([])=> []
tmp = rate_constant_array[71]*(pMAPK);
push!(rate_vector,tmp);

# 72 pSmad_degradation: pSmad =([])=> []
tmp = rate_constant_array[72]*(pSmad);
push!(rate_vector,tmp);

# 73 PLCy_degradation: PLCy =([])=> []
tmp = rate_constant_array[73]*(PLCy);
push!(rate_vector,tmp);

# 74 Active_PLCy_degradation: Active_PLCy =([])=> []
tmp = rate_constant_array[74]*(Active_PLCy);
push!(rate_vector,tmp);

# 75 PKC_degradation: PKC =([])=> []
tmp = rate_constant_array[75]*(PKC);
push!(rate_vector,tmp);

# 76 Active_PKC_degradation: Active_PKC =([])=> []
tmp = rate_constant_array[76]*(Active_PKC);
push!(rate_vector,tmp);

# 77 Calcineurin_degradation: Calcineurin =([])=> []
tmp = rate_constant_array[77]*(Calcineurin);
push!(rate_vector,tmp);

# 78 Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
tmp = rate_constant_array[78]*(Active_Calcineurin);
push!(rate_vector,tmp);

# 79 degradation_APC_AXIN: APC_AXIN =([])=> []
tmp = rate_constant_array[79]*(APC_AXIN);
push!(rate_vector,tmp);

# 80 degradation_GSK3_P: GSK3_P =([])=> []
tmp = rate_constant_array[80]*(GSK3_P);
push!(rate_vector,tmp);

# 81 degradation_GSK3: GSK3 =([])=> []
tmp = rate_constant_array[81]*(GSK3);
push!(rate_vector,tmp);

# 82 degradation_PI3K: PI3K =([])=> []
tmp = rate_constant_array[82]*(PI3K);
push!(rate_vector,tmp);

# 83 degradation_APC_AXIN_Bcatenin: APC_AXIN_Bcatenin =([])=> []
tmp = rate_constant_array[83]*(APC_AXIN_Bcatenin);
push!(rate_vector,tmp);

# 84 deactivation_RhoA_GTP: RhoA_GTP =([])=> RhoA
tmp = rate_constant_array[84]*(RhoA_GTP)/(saturation_constant_array[84,72] + RhoA_GTP);
push!(rate_vector,tmp);

# 85 deactivation_Active_ROCK: Active_ROCK =([])=> ROCK
tmp = rate_constant_array[85]*(Active_ROCK)/(saturation_constant_array[85,74] + Active_ROCK);
push!(rate_vector,tmp);

# 86 deactivation_YAP1: Active_YAP1 =([])=> YAP1
tmp = rate_constant_array[86]*(Active_YAP1)/(saturation_constant_array[86,76] + Active_YAP1);
push!(rate_vector,tmp);

# 87 deactivation_pAkt: pAkt =(PPase)=> Akt
tmp = rate_constant_array[87]*(PPase)*(pAkt)/(saturation_constant_array[87,80] + pAkt);
push!(rate_vector,tmp);

# 88 degradation_RhoA: RhoA =([])=> []
tmp = rate_constant_array[88]*(RhoA);
push!(rate_vector,tmp);

# 89 degradation_RhoA_GTP: RhoA_GTP =([])=> []
tmp = rate_constant_array[89]*(RhoA_GTP);
push!(rate_vector,tmp);

# 90 degradation_ROCK: ROCK =([])=> []
tmp = rate_constant_array[90]*(ROCK);
push!(rate_vector,tmp);

# 91 degradation_Active_ROCK: Active_ROCK =([])=> []
tmp = rate_constant_array[91]*(Active_ROCK);
push!(rate_vector,tmp);

# 92 degradation_YAP1: YAP1 =([])=> []
tmp = rate_constant_array[92]*(YAP1);
push!(rate_vector,tmp);

# 93 degradation_Active_YAP1: Active_YAP1 =([])=> []
tmp = rate_constant_array[93]*(Active_YAP1);
push!(rate_vector,tmp);

# 94 degradation_Sequestered_YAP1: Sequestered_YAP1 =([])=> []
tmp = rate_constant_array[94]*(Sequestered_YAP1);
push!(rate_vector,tmp);

# 95 degradation_CD31: CD31 =([])=> []
tmp = rate_constant_array[95]*(CD31);
push!(rate_vector,tmp);

# 96 degradation_Akt: Akt =([])=> []
tmp = rate_constant_array[96]*(Akt);
push!(rate_vector,tmp);

# 97 degradation_pAkt: pAkt =([])=> []
tmp = rate_constant_array[97]*(pAkt);
push!(rate_vector,tmp);

# 98 tubulin_degradation: tubulin =([])=> []
tmp = rate_constant_array[98]*(tubulin);
push!(rate_vector,tmp);

# 99 generation_RNAP: RNAP =([])=> []
tmp = rate_constant_array[99]*(RNAP);
push!(rate_vector,tmp);

# 100 generation_RNAP: [] =([])=> RNAP (reverse)
tmp = rate_constant_array[100];
push!(rate_vector,tmp);

# 101 generation_RIBOSOME: RIBOSOME =([])=> []
tmp = rate_constant_array[101]*(RIBOSOME);
push!(rate_vector,tmp);

# 102 generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
tmp = rate_constant_array[102];
push!(rate_vector,tmp);

# 103 generation_PPase: PPase =([])=> []
tmp = rate_constant_array[103]*(PPase);
push!(rate_vector,tmp);

# 104 generation_PPase: [] =([])=> PPase (reverse)
tmp = rate_constant_array[104];
push!(rate_vector,tmp);

# 105 addition_TGFB3_Ab: TGFB3_Ab =([])=> []
tmp = rate_constant_array[105]*(TGFB3_Ab);
push!(rate_vector,tmp);

# 106 addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
tmp = rate_constant_array[106];
push!(rate_vector,tmp);

# 107 addition_ss_virus: ss_virus =([])=> []
tmp = rate_constant_array[107]*(ss_virus);
push!(rate_vector,tmp);

# 108 addition_ss_virus: [] =([])=> ss_virus (reverse)
tmp = rate_constant_array[108];
push!(rate_vector,tmp);

# 109 addition_ecad_virus: ecad_virus =([])=> []
tmp = rate_constant_array[109]*(ecad_virus);
push!(rate_vector,tmp);

# 110 addition_ecad_virus: [] =([])=> ecad_virus (reverse)
tmp = rate_constant_array[110];
push!(rate_vector,tmp);

# 111 addition_TGFb12: [] =([])=> TGFB12
tmp = rate_constant_array[111];
push!(rate_vector,tmp);

# 112 addition_TGFb12: TGFB12 =([])=> [] (reverse)
tmp = rate_constant_array[112]*(TGFB12);
push!(rate_vector,tmp);

# 113 addition_VEGF: [] =([])=> VEGF
tmp = rate_constant_array[113];
push!(rate_vector,tmp);

# 114 addition_VEGF: VEGF =([])=> [] (reverse)
tmp = rate_constant_array[114]*(VEGF);
push!(rate_vector,tmp);

# 115 addition_TGFB3: [] =([])=> TGFB3
tmp = rate_constant_array[115];
push!(rate_vector,tmp);

# 116 addition_TGFB3: TGFB3 =([])=> [] (reverse)
tmp = rate_constant_array[116]*(TGFB3);
push!(rate_vector,tmp);

# 117 addition_U0126: U0126 =([])=> []
tmp = rate_constant_array[117]*(U0126);
push!(rate_vector,tmp);

# 118 addition_U0126: [] =([])=> U0126 (reverse)
tmp = rate_constant_array[118];
push!(rate_vector,tmp);

# 119 addition_vivit: vivit =([])=> []
tmp = rate_constant_array[119]*(vivit);
push!(rate_vector,tmp);

# 120 addition_vivit: [] =([])=> vivit (reverse)
tmp = rate_constant_array[120];
push!(rate_vector,tmp);

# 121 condition_SHEAR_STRESS: [] =([])=> SHEAR_STRESS
tmp = rate_constant_array[121];
push!(rate_vector,tmp);

# 122 condition_SHEAR_STRESS: SHEAR_STRESS =([])=> [] (reverse)
tmp = rate_constant_array[122]*(SHEAR_STRESS);
push!(rate_vector,tmp);

# 123 condition_SHEAR_STRESS_2: [] =([])=> SHEAR_STRESS_2
tmp = rate_constant_array[123];
push!(rate_vector,tmp);

# 124 condition_SHEAR_STRESS_2: SHEAR_STRESS_2 =([])=> [] (reverse)
tmp = rate_constant_array[124]*(SHEAR_STRESS_2);
push!(rate_vector,tmp);

# 125 degradation_mRNA_Smad: mRNA_Smad = []
tmp = rate_constant_array[125]*(mRNA_Smad);
push!(rate_vector,tmp);

# 126 degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
tmp = rate_constant_array[126]*(mRNA_Ecadherin);
push!(rate_vector,tmp);

# 127 degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
tmp = rate_constant_array[127]*(mRNA_Bcatenin);
push!(rate_vector,tmp);

# 128 degradation_mRNA_TCF4: mRNA_TCF4 = []
tmp = rate_constant_array[128]*(mRNA_TCF4);
push!(rate_vector,tmp);

# 129 degradation_mRNA_TGFB3: mRNA_TGFB3 = []
tmp = rate_constant_array[129]*(mRNA_TGFB3);
push!(rate_vector,tmp);

# 130 degradation_mRNA_YREG1: mRNA_YREG1 = []
tmp = rate_constant_array[130]*(mRNA_YREG1);
push!(rate_vector,tmp);

# 131 degradation_mRNA_LEF1: mRNA_LEF1 = []
tmp = rate_constant_array[131]*(mRNA_LEF1);
push!(rate_vector,tmp);

# 132 degradation_mRNA_vimentin: mRNA_vimentin = []
tmp = rate_constant_array[132]*(mRNA_vimentin);
push!(rate_vector,tmp);

# 133 degradation_mRNA_VEGFR: mRNA_VEGFR = []
tmp = rate_constant_array[133]*(mRNA_VEGFR);
push!(rate_vector,tmp);

# 134 degradation_mRNA_NFATc: mRNA_NFATc = []
tmp = rate_constant_array[134]*(mRNA_NFATc);
push!(rate_vector,tmp);

# 135 degradation_mRNA_MAPK: mRNA_MAPK = []
tmp = rate_constant_array[135]*(mRNA_MAPK);
push!(rate_vector,tmp);

# 136 degradation_mRNA_R: mRNA_R = []
tmp = rate_constant_array[136]*(mRNA_R);
push!(rate_vector,tmp);

# 137 degradation_mRNA_PLCy: mRNA_PLCy = []
tmp = rate_constant_array[137]*(mRNA_PLCy);
push!(rate_vector,tmp);

# 138 degradation_mRNA_PKC: mRNA_PKC = []
tmp = rate_constant_array[138]*(mRNA_PKC);
push!(rate_vector,tmp);

# 139 degradation_mRNA_RAF: mRNA_RAF = []
tmp = rate_constant_array[139]*(mRNA_RAF);
push!(rate_vector,tmp);

# 140 degradation_mRNA_RAS: mRNA_RAS = []
tmp = rate_constant_array[140]*(mRNA_RAS);
push!(rate_vector,tmp);

# 141 degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
tmp = rate_constant_array[141]*(mRNA_AP1_SP1);
push!(rate_vector,tmp);

# 142 degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
tmp = rate_constant_array[142]*(mRNA_Calcineurin);
push!(rate_vector,tmp);

# 143 degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
tmp = rate_constant_array[143]*(mRNA_SNAIL_SLUG);
push!(rate_vector,tmp);

# 144 degradation_mRNA_tubulin: mRNA_tubulin = []
tmp = rate_constant_array[144]*(mRNA_tubulin);
push!(rate_vector,tmp);

# 145 degradation_mRNA_APC_AXIN: mRNA_APC_AXIN = []
tmp = rate_constant_array[145]*(mRNA_APC_AXIN);
push!(rate_vector,tmp);

# 146 degradation_mRNA_GSK3: mRNA_GSK3 = []
tmp = rate_constant_array[146]*(mRNA_GSK3);
push!(rate_vector,tmp);

# 147 degradation_mRNA_PI3K: mRNA_PI3K = []
tmp = rate_constant_array[147]*(mRNA_PI3K);
push!(rate_vector,tmp);

# 148 degradation_mRNA_RhoA: mRNA_RhoA = []
tmp = rate_constant_array[148]*(mRNA_RhoA);
push!(rate_vector,tmp);

# 149 degradation_mRNA_ROCK: mRNA_ROCK = []
tmp = rate_constant_array[149]*(mRNA_ROCK);
push!(rate_vector,tmp);

# 150 degradation_mRNA_YAP1: mRNA_YAP1 = []
tmp = rate_constant_array[150]*(mRNA_YAP1);
push!(rate_vector,tmp);

# 151 degradation_mRNA_CD31: mRNA_CD31 = []
tmp = rate_constant_array[151]*(mRNA_CD31);
push!(rate_vector,tmp);

# 152 degradation_mRNA_Akt: mRNA_Akt = []
tmp = rate_constant_array[152]*(mRNA_Akt);
push!(rate_vector,tmp);

# 153 induction_gene_Smad: gene_Smad = mRNA_Smad
tmp = rate_constant_array[153]*gene_Smad*RNAP;
push!(rate_vector,tmp);

# 154 induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
tmp = rate_constant_array[154]*gene_Ecadherin*RNAP;
push!(rate_vector,tmp);

# 155 induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
tmp = rate_constant_array[155]*gene_Bcatenin*RNAP;
push!(rate_vector,tmp);

# 156 induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
tmp = rate_constant_array[156]*gene_TCF4*RNAP;
push!(rate_vector,tmp);

# 157 induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
tmp = rate_constant_array[157]*gene_TGFB3*RNAP;
push!(rate_vector,tmp);

# 158 induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
tmp = rate_constant_array[158]*gene_YREG1*RNAP;
push!(rate_vector,tmp);

# 159 induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
tmp = rate_constant_array[159]*gene_LEF1*RNAP;
push!(rate_vector,tmp);

# 160 induction_gene_R: gene_R = mRNA_R
tmp = rate_constant_array[160]*gene_R*RNAP;
push!(rate_vector,tmp);

# 161 induction_gene_vimentin: gene_vimentin = mRNA_vimentin
tmp = rate_constant_array[161]*gene_vimentin*RNAP;
push!(rate_vector,tmp);

# 162 induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
tmp = rate_constant_array[162]*gene_VEGFR*RNAP;
push!(rate_vector,tmp);

# 163 induction_gene_NFATc: gene_NFATc = mRNA_NFATc
tmp = rate_constant_array[163]*gene_NFATc*RNAP;
push!(rate_vector,tmp);

# 164 induction_gene_PLCy: gene_PLCy = mRNA_PLCy
tmp = rate_constant_array[164]*gene_PLCy*RNAP;
push!(rate_vector,tmp);

# 165 induction_gene_PKC: gene_PKC = mRNA_PKC
tmp = rate_constant_array[165]*gene_PKC*RNAP;
push!(rate_vector,tmp);

# 166 induction_gene_RAF: gene_RAF = mRNA_RAF
tmp = rate_constant_array[166]*gene_RAF*RNAP;
push!(rate_vector,tmp);

# 167 induction_gene_RAS: gene_RAS = mRNA_RAS
tmp = rate_constant_array[167]*gene_RAS*RNAP;
push!(rate_vector,tmp);

# 168 induction_gene_MAPK: gene_MAPK = mRNA_MAPK
tmp = rate_constant_array[168]*gene_MAPK*RNAP;
push!(rate_vector,tmp);

# 169 induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
tmp = rate_constant_array[169]*gene_AP1_SP1*RNAP;
push!(rate_vector,tmp);

# 170 induction_gene_GSK3: gene_GSK3 = mRNA_GSK3
tmp = rate_constant_array[170]*gene_GSK3*RNAP;
push!(rate_vector,tmp);

# 171 induction_gene_tubulin: gene_tubulin = mRNA_tubulin
tmp = rate_constant_array[171]*gene_tubulin*RNAP;
push!(rate_vector,tmp);

# 172 induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
tmp = rate_constant_array[172]*gene_SNAIL_SLUG*RNAP;
push!(rate_vector,tmp);

# 173 induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
tmp = rate_constant_array[173]*gene_Calcineurin*RNAP;
push!(rate_vector,tmp);

# 174 induction_gene_APC_AXIN: gene_APC_AXIN = mRNA_APC_AXIN
tmp = rate_constant_array[174]*gene_APC_AXIN*RNAP;
push!(rate_vector,tmp);

# 175 induction_gene_PI3K: gene_PI3K = mRNA_PI3K
tmp = rate_constant_array[175]*gene_PI3K*RNAP;
push!(rate_vector,tmp);

# 176 induction_gene_RhoA: gene_RhoA = mRNA_RhoA
tmp = rate_constant_array[176]*gene_RhoA*RNAP;
push!(rate_vector,tmp);

# 177 induction_gene_ROCK: gene_ROCK = mRNA_ROCK
tmp = rate_constant_array[177]*gene_ROCK*RNAP;
push!(rate_vector,tmp);

# 178 induction_gene_YAP1: gene_YAP1 = mRNA_YAP1
tmp = rate_constant_array[178]*gene_YAP1*RNAP;
push!(rate_vector,tmp);

# 179 induction_gene_CD31: gene_CD31 = mRNA_CD31
tmp = rate_constant_array[179]*gene_CD31*RNAP;
push!(rate_vector,tmp);

# 180 induction_gene_Akt: gene_Akt = mRNA_Akt
tmp = rate_constant_array[180]*gene_Akt*RNAP;
push!(rate_vector,tmp);

# 181 translation_mRNA_Smad: mRNA_Smad = Smad
tmp = rate_constant_array[181]*mRNA_Smad*RIBOSOME;
push!(rate_vector,tmp);

# 182 translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
tmp = rate_constant_array[182]*mRNA_Ecadherin*RIBOSOME;
push!(rate_vector,tmp);

# 183 translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
tmp = rate_constant_array[183]*mRNA_Bcatenin*RIBOSOME;
push!(rate_vector,tmp);

# 184 translation_mRNA_TCF4: mRNA_TCF4 = TCF4
tmp = rate_constant_array[184]*mRNA_TCF4*RIBOSOME;
push!(rate_vector,tmp);

# 185 translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
tmp = rate_constant_array[185]*mRNA_TGFB3*RIBOSOME;
push!(rate_vector,tmp);

# 186 translation_mRNA_YREG1: mRNA_YREG1 = YREG1
tmp = rate_constant_array[186]*mRNA_YREG1*RIBOSOME;
push!(rate_vector,tmp);

# 187 translation_mRNA_LEF1: mRNA_LEF1 = LEF1
tmp = rate_constant_array[187]*mRNA_LEF1*RIBOSOME;
push!(rate_vector,tmp);

# 188 translation_mRNA_vimentin: mRNA_vimentin = vimentin
tmp = rate_constant_array[188]*mRNA_vimentin*RIBOSOME;
push!(rate_vector,tmp);

# 189 translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
tmp = rate_constant_array[189]*mRNA_VEGFR*RIBOSOME;
push!(rate_vector,tmp);

# 190 translation_mRNA_NFATc: mRNA_NFATc = NFATc
tmp = rate_constant_array[190]*mRNA_NFATc*RIBOSOME;
push!(rate_vector,tmp);

# 191 translation_mRNA_MAPK: mRNA_MAPK = MAPK
tmp = rate_constant_array[191]*mRNA_MAPK*RIBOSOME;
push!(rate_vector,tmp);

# 192 translation_mRNA_R: mRNA_R = R
tmp = rate_constant_array[192]*mRNA_R*RIBOSOME;
push!(rate_vector,tmp);

# 193 translation_mRNA_PLCy: mRNA_PLCy = PLCy
tmp = rate_constant_array[193]*mRNA_PLCy*RIBOSOME;
push!(rate_vector,tmp);

# 194 translation_mRNA_PKC: mRNA_PKC = PKC
tmp = rate_constant_array[194]*mRNA_PKC*RIBOSOME;
push!(rate_vector,tmp);

# 195 translation_mRNA_RAF: mRNA_RAF = RAF
tmp = rate_constant_array[195]*mRNA_RAF*RIBOSOME;
push!(rate_vector,tmp);

# 196 translation_mRNA_RAS: mRNA_RAS = RAS
tmp = rate_constant_array[196]*mRNA_RAS*RIBOSOME;
push!(rate_vector,tmp);

# 197 translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
tmp = rate_constant_array[197]*mRNA_AP1_SP1*RIBOSOME;
push!(rate_vector,tmp);

# 198 translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
tmp = rate_constant_array[198]*mRNA_Calcineurin*RIBOSOME;
push!(rate_vector,tmp);

# 199 translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
tmp = rate_constant_array[199]*mRNA_SNAIL_SLUG*RIBOSOME;
push!(rate_vector,tmp);

# 200 translation_mRNA_tubulin: mRNA_tubulin = tubulin
tmp = rate_constant_array[200]*mRNA_tubulin*RIBOSOME;
push!(rate_vector,tmp);

# 201 translation_mRNA_APC_AXIN: mRNA_APC_AXIN = APC_AXIN
tmp = rate_constant_array[201]*mRNA_APC_AXIN*RIBOSOME;
push!(rate_vector,tmp);

# 202 translation_mRNA_GSK3: mRNA_GSK3 = GSK3
tmp = rate_constant_array[202]*mRNA_GSK3*RIBOSOME;
push!(rate_vector,tmp);

# 203 translation_mRNA_PI3K: mRNA_PI3K = PI3K
tmp = rate_constant_array[203]*mRNA_PI3K*RIBOSOME;
push!(rate_vector,tmp);

# 204 translation_mRNA_RhoA: mRNA_RhoA = RhoA
tmp = rate_constant_array[204]*mRNA_RhoA*RIBOSOME;
push!(rate_vector,tmp);

# 205 translation_mRNA_ROCK: mRNA_ROCK = ROCK
tmp = rate_constant_array[205]*mRNA_ROCK*RIBOSOME;
push!(rate_vector,tmp);

# 206 translation_mRNA_YAP1: mRNA_YAP1 = YAP1
tmp = rate_constant_array[206]*mRNA_YAP1*RIBOSOME;
push!(rate_vector,tmp);

# 207 translation_mRNA_CD31: mRNA_CD31 = CD31
tmp = rate_constant_array[207]*mRNA_CD31*RIBOSOME;
push!(rate_vector,tmp);

# 208 translation_mRNA_Akt: mRNA_Akt = Akt
tmp = rate_constant_array[208]*mRNA_Akt*RIBOSOME;
push!(rate_vector,tmp);

# return the kinetics vector -
return rate_vector;
end
