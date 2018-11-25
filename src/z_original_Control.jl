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
function Control(t,x,rate_vector,data_dictionary)
# ---------------------------------------------------------------------- #
# Control.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 07-02-2018 18:19:03
# 
# Arguments: 
# t  - current time 
# x  - state vector 
# rate_vector - vector of reaction rates 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ---------------------------------------------------------------------- #

# Set a default value for the allosteric control variables - 
EPSILON = 1.0e-3;
number_of_reactions = length(rate_vector);
control_vector = ones(number_of_reactions);
control_parameter_array = data_dictionary["CONTROL_PARAMETER_ARRAY"];

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

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition
if (TGFB3_Ab<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[1,1]*(TGFB3_Ab)^control_parameter_array[1,2])/(1+control_parameter_array[1,1]*(TGFB3_Ab)^control_parameter_array[1,2]));
end

control_vector[3] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition
if (vivit<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[2,1]*(vivit)^control_parameter_array[2,2])/(1+control_parameter_array[2,1]*(vivit)^control_parameter_array[2,2]));
end

control_vector[9] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition
if (GSK3_P<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[3,1]*(GSK3_P)^control_parameter_array[3,2])/(1+control_parameter_array[3,1]*(GSK3_P)^control_parameter_array[3,2]));
end

control_vector[23] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition
if (Ecadherin_Bcatenin<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[4,1]*(Ecadherin_Bcatenin)^control_parameter_array[4,2])/(1+control_parameter_array[4,1]*(Ecadherin_Bcatenin)^control_parameter_array[4,2]));
end

# Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition
if (APC_AXIN_Bcatenin<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[5,1]*(APC_AXIN_Bcatenin)^control_parameter_array[5,2])/(1+control_parameter_array[5,1]*(APC_AXIN_Bcatenin)^control_parameter_array[5,2]));
end

control_vector[25] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# ROCK_inhibition_Sequester_YAP1 target: Sequester_YAP1 actor: Active_ROCK type: inhibition
if (Active_ROCK<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[6,1]*(Active_ROCK)^control_parameter_array[6,2])/(1+control_parameter_array[6,1]*(Active_ROCK)^control_parameter_array[6,2]));
end

# Akt_acitvation_Sequester_YAP1 target: Sequester_YAP1 actor: pAkt type: induction
push!(transfer_function_vector,(control_parameter_array[7,1]*(pAkt)^control_parameter_array[7,2])/(1+control_parameter_array[7,1]*(pAkt)^control_parameter_array[7,2]));
control_vector[32] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
push!(transfer_function_vector,(control_parameter_array[8,1]*(Active_NFATc)^control_parameter_array[8,2])/(1+control_parameter_array[8,1]*(Active_NFATc)^control_parameter_array[8,2]));
# repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
if (pSmad<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[9,1]*(pSmad)^control_parameter_array[9,2])/(1+control_parameter_array[9,1]*(pSmad)^control_parameter_array[9,2]));
end

# repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[10,1]*(SNAIL_SLUG)^control_parameter_array[10,2])/(1+control_parameter_array[10,1]*(SNAIL_SLUG)^control_parameter_array[10,2]));
end

# repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
if (Active_LEF1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[11,1]*(Active_LEF1)^control_parameter_array[11,2])/(1+control_parameter_array[11,1]*(Active_LEF1)^control_parameter_array[11,2]));
end

# activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction
push!(transfer_function_vector,(control_parameter_array[12,1]*(ecad_virus)^control_parameter_array[12,2])/(1+control_parameter_array[12,1]*(ecad_virus)^control_parameter_array[12,2]));
control_vector[154] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
push!(transfer_function_vector,(control_parameter_array[13,1]*(Active_TCF4)^control_parameter_array[13,2])/(1+control_parameter_array[13,1]*(Active_TCF4)^control_parameter_array[13,2]));
# repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression
if (YREG1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[14,1]*(YREG1)^control_parameter_array[14,2])/(1+control_parameter_array[14,1]*(YREG1)^control_parameter_array[14,2]));
end

control_vector[157] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
if (SNAIL_SLUG<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[15,1]*(SNAIL_SLUG)^control_parameter_array[15,2])/(1+control_parameter_array[15,1]*(SNAIL_SLUG)^control_parameter_array[15,2]));
end

control_vector[158] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[16,1]*(pSmad)^control_parameter_array[16,2])/(1+control_parameter_array[16,1]*(pSmad)^control_parameter_array[16,2]));
# repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
if (YREG1<EPSILON);
	push!(transfer_function_vector,1.0);
else
	push!(transfer_function_vector,1.0 - (control_parameter_array[17,1]*(YREG1)^control_parameter_array[17,2])/(1+control_parameter_array[17,1]*(YREG1)^control_parameter_array[17,2]));
end

control_vector[159] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
push!(transfer_function_vector,(control_parameter_array[18,1]*(Active_LEF1)^control_parameter_array[18,2])/(1+control_parameter_array[18,1]*(Active_LEF1)^control_parameter_array[18,2]));
# activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
push!(transfer_function_vector,(control_parameter_array[19,1]*(AP1_SP1_P)^control_parameter_array[19,2])/(1+control_parameter_array[19,1]*(AP1_SP1_P)^control_parameter_array[19,2]));
control_vector[161] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_SNAIL_SLUG_by_pSmad target: induction_gene_SNAIL_SLUG actor: pSmad type: induction
push!(transfer_function_vector,(control_parameter_array[20,1]*(pSmad)^control_parameter_array[20,2])/(1+control_parameter_array[20,1]*(pSmad)^control_parameter_array[20,2]));
# activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
push!(transfer_function_vector,(control_parameter_array[21,1]*(ss_virus)^control_parameter_array[21,2])/(1+control_parameter_array[21,1]*(ss_virus)^control_parameter_array[21,2]));
control_vector[172] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_YAP1_by_ROCK target: induction_gene_YAP1 actor: Active_ROCK type: induction
push!(transfer_function_vector,(control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2])/(1+control_parameter_array[22,1]*(Active_ROCK)^control_parameter_array[22,2]));
control_vector[178] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
transfer_function_vector = Float64[];

# activation_CD1_by_SHEAR_STRESS_2 target: induction_gene_CD31 actor: SHEAR_STRESS_2 type: induction
push!(transfer_function_vector,(control_parameter_array[23,1]*(SHEAR_STRESS_2)^control_parameter_array[23,2])/(1+control_parameter_array[23,1]*(SHEAR_STRESS_2)^control_parameter_array[23,2]));
control_vector[179] = mean(transfer_function_vector);
transfer_function_vector = 0;
# ----------------------------------------------------------------------------------- #

# Modify the rate_vector with the control variables - 
rate_vector = rate_vector.*control_vector;

# Return the modified rate vector - 
return rate_vector;
end
