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
function DataFile(TSTART,TSTOP,Ts)
# ----------------------------------------------------------------------------------- #
# DataFile.jl was generated using the Kwatee code generation system.
# DataFile: Stores model parameters as key - value pairs in a Julia Dict()
# Username: jeffreyvarner
# Type: GRN-JULIA
# Version: 1.0
# Generation timestamp: 07-02-2018 18:19:03
#
# Input arguments:
# TSTART  - Time start
# TSTOP  - Time stop
# Ts - Time step
#
# Return arguments:
# data_dictionary  - Data dictionary instance (holds model parameters)
# ----------------------------------------------------------------------------------- #

# Load the stoichiometric matrix -
S = float(open(readdlm,"../Network.dat"));
(NSPECIES,NREACTIONS) = size(S);

# How many genes do we have in the model? -
number_of_genes = 28;

# Formulate the initial condition array -
initial_condition_array = Float64[];
push!(initial_condition_array,1.0);	#	1	gene_Smad
push!(initial_condition_array,1.0);	#	2	gene_Ecadherin
push!(initial_condition_array,1.0);	#	3	gene_Bcatenin
push!(initial_condition_array,1.0);	#	4	gene_PLCy
push!(initial_condition_array,1.0);	#	5	gene_PKC
push!(initial_condition_array,1.0);	#	6	gene_RAF
push!(initial_condition_array,1.0);	#	7	gene_RAS
push!(initial_condition_array,1.0);	#	8	gene_AP1_SP1
push!(initial_condition_array,1.0);	#	9	gene_GSK3
push!(initial_condition_array,1.0);	#	10	gene_tubulin
push!(initial_condition_array,1.0);	#	11	gene_SNAIL_SLUG
push!(initial_condition_array,1.0);	#	12	gene_Calcineurin
push!(initial_condition_array,1.0);	#	13	gene_APC_AXIN
push!(initial_condition_array,1.0);	#	14	gene_PI3K
push!(initial_condition_array,1.0);	#	15	gene_RhoA
push!(initial_condition_array,1.0);	#	16	gene_ROCK
push!(initial_condition_array,1.0);	#	17	gene_YAP1
push!(initial_condition_array,1.0);	#	18	gene_CD31
push!(initial_condition_array,1.0);	#	19	gene_Akt
push!(initial_condition_array,0.0);	#	20	mRNA_Smad
push!(initial_condition_array,0.0);	#	21	mRNA_Ecadherin
push!(initial_condition_array,0.0);	#	22	mRNA_Bcatenin
push!(initial_condition_array,0.0);	#	23	mRNA_PLCy
push!(initial_condition_array,0.0);	#	24	mRNA_PKC
push!(initial_condition_array,0.0);	#	25	mRNA_RAF
push!(initial_condition_array,0.0);	#	26	mRNA_RAS
push!(initial_condition_array,0.0);	#	27	mRNA_AP1_SP1
push!(initial_condition_array,0.0);	#	28	mRNA_Calcineurin
push!(initial_condition_array,0.0);	#	29	mRNA_SNAIL_SLUG
push!(initial_condition_array,0.0);	#	30	mRNA_tubulin
push!(initial_condition_array,0.0);	#	31	mRNA_APC_AXIN
push!(initial_condition_array,0.0);	#	32	mRNA_GSK3
push!(initial_condition_array,0.0);	#	33	mRNA_PI3K
push!(initial_condition_array,0.0);	#	34	mRNA_RhoA
push!(initial_condition_array,0.0);	#	35	mRNA_ROCK
push!(initial_condition_array,0.0);	#	36	mRNA_YAP1
push!(initial_condition_array,0.0);	#	37	mRNA_CD31
push!(initial_condition_array,0.0);	#	38	mRNA_Akt
push!(initial_condition_array,0.0);	#	39	PLCy
push!(initial_condition_array,0.0);	#	40	Active_PLCy
push!(initial_condition_array,0.0);	#	41	Calcineurin
push!(initial_condition_array,0.0);	#	42	Active_Calcineurin
push!(initial_condition_array,0.0);	#	43	NFATc
push!(initial_condition_array,0.0);	#	44	Active_NFATc
push!(initial_condition_array,0.0);	#	45	PKC
push!(initial_condition_array,0.0);	#	46	Active_PKC
push!(initial_condition_array,0.0);	#	47	RAF
push!(initial_condition_array,0.0);	#	48	RAF_P
push!(initial_condition_array,0.0);	#	49	Smad
push!(initial_condition_array,0.0);	#	50	pSmad
push!(initial_condition_array,0.0);	#	51	PI3K
push!(initial_condition_array,0.0);	#	52	PI3K_P
push!(initial_condition_array,0.0);	#	53	GSK3
push!(initial_condition_array,0.0);	#	54	GSK3_P
push!(initial_condition_array,0.0);	#	55	RAS
push!(initial_condition_array,0.0);	#	56	RAS_GTP
push!(initial_condition_array,0.0);	#	57	MAPK
push!(initial_condition_array,0.0);	#	58	pMAPK
push!(initial_condition_array,0.0);	#	59	AP1_SP1
push!(initial_condition_array,0.0);	#	60	AP1_SP1_P
push!(initial_condition_array,0.0);	#	61	Ecadherin
push!(initial_condition_array,0.0);	#	62	Bcatenin
push!(initial_condition_array,0.0);	#	63	Ecadherin_Bcatenin
push!(initial_condition_array,0.0);	#	64	APC_AXIN
push!(initial_condition_array,0.0);	#	65	APC_AXIN_Bcatenin
push!(initial_condition_array,0.0);	#	66	TCF4
push!(initial_condition_array,0.0);	#	67	Active_TCF4
push!(initial_condition_array,0.0);	#	68	LEF1
push!(initial_condition_array,0.0);	#	69	Active_LEF1
push!(initial_condition_array,0.0);	#	70	SHEAR_STRESS
push!(initial_condition_array,0.0);	#	71	RhoA
push!(initial_condition_array,0.0);	#	72	RhoA_GTP
push!(initial_condition_array,0.0);	#	73	ROCK
push!(initial_condition_array,0.0);	#	74	Active_ROCK
push!(initial_condition_array,0.0);	#	75	YAP1
push!(initial_condition_array,0.0);	#	76	Active_YAP1
push!(initial_condition_array,0.0);	#	77	Sequestered_YAP1
push!(initial_condition_array,0.0);	#	78	CD31
push!(initial_condition_array,0.0);	#	79	Akt
push!(initial_condition_array,0.0);	#	80	pAkt
push!(initial_condition_array,110.0);	#	81	PPase
push!(initial_condition_array,0.0);	#	82	YREG1
push!(initial_condition_array,0.0);	#	83	SNAIL_SLUG
push!(initial_condition_array,0.0);	#	84	vimentin
push!(initial_condition_array,0.0);	#	85	tubulin
push!(initial_condition_array,270.0);	#	86	RNAP
push!(initial_condition_array,3599.9);	#	87	RIBOSOME
push!(initial_condition_array,0.0);	#	88	TGFB3_Ab
push!(initial_condition_array,0.0);	#	89	ss_virus
push!(initial_condition_array,0.0);	#	90	ecad_virus
push!(initial_condition_array,0.0);	#	91	U0126
push!(initial_condition_array,0.0);	#	92	vivit
push!(initial_condition_array,0.0);	#	93	SHEAR_STRESS_2
push!(initial_condition_array,1.0);	#	94	gene_TCF4
push!(initial_condition_array,1.0);	#	95	gene_TGFB3
push!(initial_condition_array,1.0);	#	96	gene_YREG1
push!(initial_condition_array,1.0);	#	97	gene_LEF1
push!(initial_condition_array,1.0);	#	98	gene_vimentin
push!(initial_condition_array,1.0);	#	99	gene_R
push!(initial_condition_array,1.0);	#	100	gene_VEGFR
push!(initial_condition_array,1.0);	#	101	gene_NFATc
push!(initial_condition_array,1.0);	#	102	gene_MAPK
push!(initial_condition_array,0.0);	#	103	mRNA_TCF4
push!(initial_condition_array,0.0);	#	104	mRNA_TGFB3
push!(initial_condition_array,0.0);	#	105	mRNA_YREG1
push!(initial_condition_array,0.0);	#	106	mRNA_LEF1
push!(initial_condition_array,0.0);	#	107	mRNA_vimentin
push!(initial_condition_array,0.0);	#	108	mRNA_R
push!(initial_condition_array,0.0);	#	109	mRNA_VEGFR
push!(initial_condition_array,0.0);	#	110	mRNA_NFATc
push!(initial_condition_array,0.0);	#	111	mRNA_MAPK
push!(initial_condition_array,0.0);	#	112	R
push!(initial_condition_array,0.0);	#	113	TGFB12
push!(initial_condition_array,0.0);	#	114	TGFB3
push!(initial_condition_array,0.0);	#	115	VEGF
push!(initial_condition_array,0.0);	#	116	TGFB12_R
push!(initial_condition_array,0.0);	#	117	TGFB3_R
push!(initial_condition_array,0.0);	#	118	VEGFR
push!(initial_condition_array,0.0);	#	119	VEGF_VEGFR

# Formulate the time constant array -
time_constant_array = Float64[];
push!(time_constant_array,1.0);	#	1	 time constant: gene_Smad
push!(time_constant_array,1.0);	#	2	 time constant: gene_Ecadherin
push!(time_constant_array,1.0);	#	3	 time constant: gene_Bcatenin
push!(time_constant_array,1.0);	#	4	 time constant: gene_PLCy
push!(time_constant_array,1.0);	#	5	 time constant: gene_PKC
push!(time_constant_array,1.0);	#	6	 time constant: gene_RAF
push!(time_constant_array,1.0);	#	7	 time constant: gene_RAS
push!(time_constant_array,1.0);	#	8	 time constant: gene_AP1_SP1
push!(time_constant_array,1.0);	#	9	 time constant: gene_GSK3
push!(time_constant_array,1.0);	#	10	 time constant: gene_tubulin
push!(time_constant_array,1.0);	#	11	 time constant: gene_SNAIL_SLUG
push!(time_constant_array,1.0);	#	12	 time constant: gene_Calcineurin
push!(time_constant_array,1.0);	#	13	 time constant: gene_APC_AXIN
push!(time_constant_array,1.0);	#	14	 time constant: gene_PI3K
push!(time_constant_array,1.0);	#	15	 time constant: gene_RhoA
push!(time_constant_array,1.0);	#	16	 time constant: gene_ROCK
push!(time_constant_array,1.0);	#	17	 time constant: gene_YAP1
push!(time_constant_array,1.0);	#	18	 time constant: gene_CD31
push!(time_constant_array,1.0);	#	19	 time constant: gene_Akt
push!(time_constant_array,0.1);	#	20	 time constant: mRNA_Smad
push!(time_constant_array,0.1);	#	21	 time constant: mRNA_Ecadherin
push!(time_constant_array,0.1);	#	22	 time constant: mRNA_Bcatenin
push!(time_constant_array,0.1);	#	23	 time constant: mRNA_PLCy
push!(time_constant_array,0.1);	#	24	 time constant: mRNA_PKC
push!(time_constant_array,0.1);	#	25	 time constant: mRNA_RAF
push!(time_constant_array,0.1);	#	26	 time constant: mRNA_RAS
push!(time_constant_array,0.1);	#	27	 time constant: mRNA_AP1_SP1
push!(time_constant_array,0.1);	#	28	 time constant: mRNA_Calcineurin
push!(time_constant_array,0.1);	#	29	 time constant: mRNA_SNAIL_SLUG
push!(time_constant_array,0.1);	#	30	 time constant: mRNA_tubulin
push!(time_constant_array,0.1);	#	31	 time constant: mRNA_APC_AXIN
push!(time_constant_array,0.1);	#	32	 time constant: mRNA_GSK3
push!(time_constant_array,0.1);	#	33	 time constant: mRNA_PI3K
push!(time_constant_array,0.1);	#	34	 time constant: mRNA_RhoA
push!(time_constant_array,0.1);	#	35	 time constant: mRNA_ROCK
push!(time_constant_array,0.1);	#	36	 time constant: mRNA_YAP1
push!(time_constant_array,0.1);	#	37	 time constant: mRNA_CD31
push!(time_constant_array,0.1);	#	38	 time constant: mRNA_Akt
push!(time_constant_array,1.0);	#	39	 time constant: PLCy
push!(time_constant_array,1.0);	#	40	 time constant: Active_PLCy
push!(time_constant_array,1.0);	#	41	 time constant: Calcineurin
push!(time_constant_array,1.0);	#	42	 time constant: Active_Calcineurin
push!(time_constant_array,1.0);	#	43	 time constant: NFATc
push!(time_constant_array,1.0);	#	44	 time constant: Active_NFATc
push!(time_constant_array,1.0);	#	45	 time constant: PKC
push!(time_constant_array,1.0);	#	46	 time constant: Active_PKC
push!(time_constant_array,1.0);	#	47	 time constant: RAF
push!(time_constant_array,1.0);	#	48	 time constant: RAF_P
push!(time_constant_array,1.0);	#	49	 time constant: Smad
push!(time_constant_array,1.0);	#	50	 time constant: pSmad
push!(time_constant_array,1.0);	#	51	 time constant: PI3K
push!(time_constant_array,1.0);	#	52	 time constant: PI3K_P
push!(time_constant_array,1.0);	#	53	 time constant: GSK3
push!(time_constant_array,1.0);	#	54	 time constant: GSK3_P
push!(time_constant_array,1.0);	#	55	 time constant: RAS
push!(time_constant_array,1.0);	#	56	 time constant: RAS_GTP
push!(time_constant_array,1.0);	#	57	 time constant: MAPK
push!(time_constant_array,1.0);	#	58	 time constant: pMAPK
push!(time_constant_array,1.0);	#	59	 time constant: AP1_SP1
push!(time_constant_array,1.0);	#	60	 time constant: AP1_SP1_P
push!(time_constant_array,1.0);	#	61	 time constant: Ecadherin
push!(time_constant_array,1.0);	#	62	 time constant: Bcatenin
push!(time_constant_array,1.0);	#	63	 time constant: Ecadherin_Bcatenin
push!(time_constant_array,1.0);	#	64	 time constant: APC_AXIN
push!(time_constant_array,1.0);	#	65	 time constant: APC_AXIN_Bcatenin
push!(time_constant_array,1.0);	#	66	 time constant: TCF4
push!(time_constant_array,1.0);	#	67	 time constant: Active_TCF4
push!(time_constant_array,1.0);	#	68	 time constant: LEF1
push!(time_constant_array,1.0);	#	69	 time constant: Active_LEF1
push!(time_constant_array,1.0);	#	70	 time constant: SHEAR_STRESS
push!(time_constant_array,1.0);	#	71	 time constant: RhoA
push!(time_constant_array,1.0);	#	72	 time constant: RhoA_GTP
push!(time_constant_array,1.0);	#	73	 time constant: ROCK
push!(time_constant_array,1.0);	#	74	 time constant: Active_ROCK
push!(time_constant_array,1.0);	#	75	 time constant: YAP1
push!(time_constant_array,1.0);	#	76	 time constant: Active_YAP1
push!(time_constant_array,1.0);	#	77	 time constant: Sequestered_YAP1
push!(time_constant_array,1.0);	#	78	 time constant: CD31
push!(time_constant_array,1.0);	#	79	 time constant: Akt
push!(time_constant_array,1.0);	#	80	 time constant: pAkt
push!(time_constant_array,1.0);	#	81	 time constant: PPase
push!(time_constant_array,1.0);	#	82	 time constant: YREG1
push!(time_constant_array,1.0);	#	83	 time constant: SNAIL_SLUG
push!(time_constant_array,1.0);	#	84	 time constant: vimentin
push!(time_constant_array,1.0);	#	85	 time constant: tubulin
push!(time_constant_array,1.0);	#	86	 time constant: RNAP
push!(time_constant_array,1.0);	#	87	 time constant: RIBOSOME
push!(time_constant_array,1.0);	#	88	 time constant: TGFB3_Ab
push!(time_constant_array,1.0);	#	89	 time constant: ss_virus
push!(time_constant_array,1.0);	#	90	 time constant: ecad_virus
push!(time_constant_array,1.0);	#	91	 time constant: U0126
push!(time_constant_array,1.0);	#	92	 time constant: vivit
push!(time_constant_array,1.0);	#	93	 time constant: SHEAR_STRESS_2
push!(time_constant_array,1.0);	#	94	 time constant: gene_TCF4
push!(time_constant_array,1.0);	#	95	 time constant: gene_TGFB3
push!(time_constant_array,1.0);	#	96	 time constant: gene_YREG1
push!(time_constant_array,1.0);	#	97	 time constant: gene_LEF1
push!(time_constant_array,1.0);	#	98	 time constant: gene_vimentin
push!(time_constant_array,1.0);	#	99	 time constant: gene_R
push!(time_constant_array,1.0);	#	100	 time constant: gene_VEGFR
push!(time_constant_array,1.0);	#	101	 time constant: gene_NFATc
push!(time_constant_array,1.0);	#	102	 time constant: gene_MAPK
push!(time_constant_array,0.1);	#	103	 time constant: mRNA_TCF4
push!(time_constant_array,0.1);	#	104	 time constant: mRNA_TGFB3
push!(time_constant_array,0.1);	#	105	 time constant: mRNA_YREG1
push!(time_constant_array,0.1);	#	106	 time constant: mRNA_LEF1
push!(time_constant_array,0.1);	#	107	 time constant: mRNA_vimentin
push!(time_constant_array,0.1);	#	108	 time constant: mRNA_R
push!(time_constant_array,0.1);	#	109	 time constant: mRNA_VEGFR
push!(time_constant_array,0.1);	#	110	 time constant: mRNA_NFATc
push!(time_constant_array,0.1);	#	111	 time constant: mRNA_MAPK
push!(time_constant_array,1.0);	#	112	 time constant: R
push!(time_constant_array,1.0);	#	113	 time constant: TGFB12
push!(time_constant_array,1.0);	#	114	 time constant: TGFB3
push!(time_constant_array,1.0);	#	115	 time constant: VEGF
push!(time_constant_array,1.0);	#	116	 time constant: TGFB12_R
push!(time_constant_array,1.0);	#	117	 time constant: TGFB3_R
push!(time_constant_array,1.0);	#	118	 time constant: VEGFR
push!(time_constant_array,1.0);	#	119	 time constant: VEGF_VEGFR

# Formulate the rate constant array -
rate_constant_array = Float64[];
push!(rate_constant_array,1.0);	# 1	TGFB12_binding: TGFB12+R =([])=> TGFB12_R
push!(rate_constant_array,1.0);	# 2	TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)
push!(rate_constant_array,1.0);	# 3	TGFB3_binding: TGFB3+R =([])=> TGFB3_R
push!(rate_constant_array,1.0);	# 4	TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)
push!(rate_constant_array,1.0);	# 5	VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR
push!(rate_constant_array,1.0);	# 6	VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)
push!(rate_constant_array,1.0);	# 7	VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy
push!(rate_constant_array,1.0);	# 8	PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin
push!(rate_constant_array,1.0);	# 9	Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc
push!(rate_constant_array,1.0);	# 10	PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC
push!(rate_constant_array,1.0);	# 11	PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P
push!(rate_constant_array,1.0);	# 12	TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad
push!(rate_constant_array,1.0);	# 13	TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad
push!(rate_constant_array,1.0);	# 14	TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P
push!(rate_constant_array,1.0);	# 15	PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P
push!(rate_constant_array,1.0);	# 16	TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP
push!(rate_constant_array,1.0);	# 17	RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P
push!(rate_constant_array,1.0);	# 18	RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK
push!(rate_constant_array,1.0);	# 19	MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad
push!(rate_constant_array,1.0);	# 20	MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P
push!(rate_constant_array,1.0);	# 21	Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin
push!(rate_constant_array,1.0);	# 22	Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 23	Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin
push!(rate_constant_array,1.0);	# 24	Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin
push!(rate_constant_array,1.0);	# 25	TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4
push!(rate_constant_array,1.0);	# 26	TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 27	LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1
push!(rate_constant_array,1.0);	# 28	LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)
push!(rate_constant_array,1.0);	# 29	SHEAR_STRESS_activation_RhoA: RhoA =(SHEAR_STRESS)=> RhoA_GTP
push!(rate_constant_array,1.0);	# 30	RhoA_GTP_activation_ROCK: ROCK =(RhoA_GTP)=> Active_ROCK
push!(rate_constant_array,1.0);	# 31	Active_ROCK_activation_YAP1: YAP1 =(Active_ROCK)=> Active_YAP1
push!(rate_constant_array,1.0);	# 32	Sequester_YAP1: YAP1 =([])=> Sequestered_YAP1
push!(rate_constant_array,1.0);	# 33	Release_YAP1: Sequestered_YAP1 =([])=> YAP1
push!(rate_constant_array,1.0);	# 34	CD31_phosphorylation_Akt: Akt =(CD31)=> pAkt
push!(rate_constant_array,0.9);	# 35	deactivation_pSmad: pSmad =(PPase)=> Smad
push!(rate_constant_array,1.0);	# 36	deactivation_RAF_P: RAF_P =(PPase)=> RAF
push!(rate_constant_array,1.0);	# 37	deactivation_RAS_GTP: RAS_GTP =([])=> RAS
push!(rate_constant_array,1.0);	# 38	deactivation_pMAPK: pMAPK =(PPase)=> MAPK
push!(rate_constant_array,1.0);	# 39	deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1
push!(rate_constant_array,25.0);	# 40	deactivation_Active_PLCy: Active_PLCy =([])=> PLCy
push!(rate_constant_array,1.0);	# 41	deactivation_Active_PKC: Active_PKC =([])=> PKC
push!(rate_constant_array,100.0);	# 42	deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin
push!(rate_constant_array,100.0);	# 43	deactivation_Active_NFATc: Active_NFATc =([])=> NFATc
push!(rate_constant_array,1.0);	# 44	deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3
push!(rate_constant_array,0.1);	# 45	degradation_TGFB12_R: TGFB12_R =([])=> []
push!(rate_constant_array,0.1);	# 46	degradation_TGFB3_R: TGFB3_R =([])=> []
push!(rate_constant_array,0.1);	# 47	degradation_TGFB3: TGFB3 =([])=> []
push!(rate_constant_array,0.1);	# 48	VEGF_VEGFR_degradation: VEGF_VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 49	Bcatenin_degradation: Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 50	Ecadherin_degrdation: Ecadherin =([])=> []
push!(rate_constant_array,0.1);	# 51	Smad_degradation: Smad =([])=> []
push!(rate_constant_array,0.1);	# 52	TCF4_degradation: TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 53	Active_TCF4_degradation: Active_TCF4 =([])=> []
push!(rate_constant_array,0.1);	# 54	YREG1_degradation: YREG1 =([])=> []
push!(rate_constant_array,0.1);	# 55	SNAIL_SLUG_degradation: SNAIL_SLUG =([])=> []
push!(rate_constant_array,0.1);	# 56	LEF1_degradation: LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 57	Active_LEF1_degradation: Active_LEF1 =([])=> []
push!(rate_constant_array,0.1);	# 58	vimentin_degradation: vimentin =([])=> []
push!(rate_constant_array,0.1);	# 59	VEGFR_degradation: VEGFR =([])=> []
push!(rate_constant_array,0.1);	# 60	NFATc_degradation: NFATc =([])=> []
push!(rate_constant_array,0.1);	# 61	Active_NFATc_degradation: Active_NFATc =([])=> []
push!(rate_constant_array,0.1);	# 62	degradation_MAPK: MAPK =([])=> []
push!(rate_constant_array,0.1);	# 63	degradation_R: R =([])=> []
push!(rate_constant_array,0.1);	# 64	Ecadherin_Bcatenin_degradation: Ecadherin_Bcatenin =([])=> []
push!(rate_constant_array,0.1);	# 65	AP1_SP1_degradation: AP1_SP1 =([])=> []
push!(rate_constant_array,0.1);	# 66	AP1_SP1_P_degradation: AP1_SP1_P =([])=> []
push!(rate_constant_array,0.1);	# 67	RAS_degradation: RAS =([])=> []
push!(rate_constant_array,0.1);	# 68	RAF_degradation: RAF =([])=> []
push!(rate_constant_array,0.1);	# 69	RAS_GTP_degradation: RAS_GTP =([])=> []
push!(rate_constant_array,0.1);	# 70	RAF_P_degradation: RAF_P =([])=> []
push!(rate_constant_array,0.1);	# 71	pMAPK_degradation: pMAPK =([])=> []
push!(rate_constant_array,0.1);	# 72	pSmad_degradation: pSmad =([])=> []
push!(rate_constant_array,0.1);	# 73	PLCy_degradation: PLCy =([])=> []
push!(rate_constant_array,0.1);	# 74	Active_PLCy_degradation: Active_PLCy =([])=> []
push!(rate_constant_array,0.1);	# 75	PKC_degradation: PKC =([])=> []
push!(rate_constant_array,0.1);	# 76	Active_PKC_degradation: Active_PKC =([])=> []
push!(rate_constant_array,0.1);	# 77	Calcineurin_degradation: Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 78	Active_Calcineurin_degradation: Active_Calcineurin =([])=> []
push!(rate_constant_array,0.1);	# 79	degradation_APC_AXIN: APC_AXIN =([])=> []
push!(rate_constant_array,0.1);	# 80	degradation_GSK3_P: GSK3_P =([])=> []
push!(rate_constant_array,0.1);	# 81	degradation_GSK3: GSK3 =([])=> []
push!(rate_constant_array,0.1);	# 82	degradation_PI3K: PI3K =([])=> []
push!(rate_constant_array,0.1);	# 83	degradation_APC_AXIN_Bcatenin: APC_AXIN_Bcatenin =([])=> []
push!(rate_constant_array,1.0);	# 84	deactivation_RhoA_GTP: RhoA_GTP =([])=> RhoA
push!(rate_constant_array,1.0);	# 85	deactivation_Active_ROCK: Active_ROCK =([])=> ROCK
push!(rate_constant_array,1.0);	# 86	deactivation_YAP1: Active_YAP1 =([])=> YAP1
push!(rate_constant_array,1.0);	# 87	deactivation_pAkt: pAkt =(PPase)=> Akt
push!(rate_constant_array,0.1);	# 88	degradation_RhoA: RhoA =([])=> []
push!(rate_constant_array,0.1);	# 89	degradation_RhoA_GTP: RhoA_GTP =([])=> []
push!(rate_constant_array,0.1);	# 90	degradation_ROCK: ROCK =([])=> []
push!(rate_constant_array,0.1);	# 91	degradation_Active_ROCK: Active_ROCK =([])=> []
push!(rate_constant_array,0.1);	# 92	degradation_YAP1: YAP1 =([])=> []
push!(rate_constant_array,0.1);	# 93	degradation_Active_YAP1: Active_YAP1 =([])=> []
push!(rate_constant_array,0.1);	# 94	degradation_Sequestered_YAP1: Sequestered_YAP1 =([])=> []
push!(rate_constant_array,0.05);	# 95	degradation_CD31: CD31 =([])=> []
push!(rate_constant_array,0.1);	# 96	degradation_Akt: Akt =([])=> []
push!(rate_constant_array,0.1);	# 97	degradation_pAkt: pAkt =([])=> []
push!(rate_constant_array,0.1);	# 98	tubulin_degradation: tubulin =([])=> []
push!(rate_constant_array,0.1);	# 99	generation_RNAP: RNAP =([])=> []
push!(rate_constant_array,1.0);	# 100	generation_RNAP: [] =([])=> RNAP (reverse)
push!(rate_constant_array,0.1);	# 101	generation_RIBOSOME: RIBOSOME =([])=> []
push!(rate_constant_array,1.0);	# 102	generation_RIBOSOME: [] =([])=> RIBOSOME (reverse)
push!(rate_constant_array,0.1);	# 103	generation_PPase: PPase =([])=> []
push!(rate_constant_array,1.0);	# 104	generation_PPase: [] =([])=> PPase (reverse)
push!(rate_constant_array,0.1);	# 105	addition_TGFB3_Ab: TGFB3_Ab =([])=> []
push!(rate_constant_array,1.0);	# 106	addition_TGFB3_Ab: [] =([])=> TGFB3_Ab (reverse)
push!(rate_constant_array,0.1);	# 107	addition_ss_virus: ss_virus =([])=> []
push!(rate_constant_array,1.0);	# 108	addition_ss_virus: [] =([])=> ss_virus (reverse)
push!(rate_constant_array,0.1);	# 109	addition_ecad_virus: ecad_virus =([])=> []
push!(rate_constant_array,1.0);	# 110	addition_ecad_virus: [] =([])=> ecad_virus (reverse)
push!(rate_constant_array,1.0);	# 111	addition_TGFb12: [] =([])=> TGFB12
push!(rate_constant_array,0.1);	# 112	addition_TGFb12: TGFB12 =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 113	addition_VEGF: [] =([])=> VEGF
push!(rate_constant_array,0.1);	# 114	addition_VEGF: VEGF =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 115	addition_TGFB3: [] =([])=> TGFB3
push!(rate_constant_array,0.1);	# 116	addition_TGFB3: TGFB3 =([])=> [] (reverse)
push!(rate_constant_array,0.1);	# 117	addition_U0126: U0126 =([])=> []
push!(rate_constant_array,1.0);	# 118	addition_U0126: [] =([])=> U0126 (reverse)
push!(rate_constant_array,0.1);	# 119	addition_vivit: vivit =([])=> []
push!(rate_constant_array,1.0);	# 120	addition_vivit: [] =([])=> vivit (reverse)
push!(rate_constant_array,1.0);	# 121	condition_SHEAR_STRESS: [] =([])=> SHEAR_STRESS
push!(rate_constant_array,0.1);	# 122	condition_SHEAR_STRESS: SHEAR_STRESS =([])=> [] (reverse)
push!(rate_constant_array,1.0);	# 123	condition_SHEAR_STRESS_2: [] =([])=> SHEAR_STRESS_2
push!(rate_constant_array,0.1);	# 124	condition_SHEAR_STRESS_2: SHEAR_STRESS_2 =([])=> [] (reverse)
push!(rate_constant_array,0.1);	# 125	degradation_mRNA_Smad: mRNA_Smad = []
push!(rate_constant_array,0.1);	# 126	degradation_mRNA_Ecadherin: mRNA_Ecadherin = []
push!(rate_constant_array,0.1);	# 127	degradation_mRNA_Bcatenin: mRNA_Bcatenin = []
push!(rate_constant_array,0.1);	# 128	degradation_mRNA_TCF4: mRNA_TCF4 = []
push!(rate_constant_array,0.1);	# 129	degradation_mRNA_TGFB3: mRNA_TGFB3 = []
push!(rate_constant_array,0.1);	# 130	degradation_mRNA_YREG1: mRNA_YREG1 = []
push!(rate_constant_array,0.1);	# 131	degradation_mRNA_LEF1: mRNA_LEF1 = []
push!(rate_constant_array,0.1);	# 132	degradation_mRNA_vimentin: mRNA_vimentin = []
push!(rate_constant_array,0.1);	# 133	degradation_mRNA_VEGFR: mRNA_VEGFR = []
push!(rate_constant_array,0.1);	# 134	degradation_mRNA_NFATc: mRNA_NFATc = []
push!(rate_constant_array,0.1);	# 135	degradation_mRNA_MAPK: mRNA_MAPK = []
push!(rate_constant_array,0.1);	# 136	degradation_mRNA_R: mRNA_R = []
push!(rate_constant_array,0.1);	# 137	degradation_mRNA_PLCy: mRNA_PLCy = []
push!(rate_constant_array,0.1);	# 138	degradation_mRNA_PKC: mRNA_PKC = []
push!(rate_constant_array,0.1);	# 139	degradation_mRNA_RAF: mRNA_RAF = []
push!(rate_constant_array,0.1);	# 140	degradation_mRNA_RAS: mRNA_RAS = []
push!(rate_constant_array,0.1);	# 141	degradation_mRNA_AP1_SP1: mRNA_AP1_SP1 = []
push!(rate_constant_array,0.1);	# 142	degradation_mRNA_Calcineurin: mRNA_Calcineurin = []
push!(rate_constant_array,0.1);	# 143	degradation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = []
push!(rate_constant_array,0.1);	# 144	degradation_mRNA_tubulin: mRNA_tubulin = []
push!(rate_constant_array,0.1);	# 145	degradation_mRNA_APC_AXIN: mRNA_APC_AXIN = []
push!(rate_constant_array,0.1);	# 146	degradation_mRNA_GSK3: mRNA_GSK3 = []
push!(rate_constant_array,0.1);	# 147	degradation_mRNA_PI3K: mRNA_PI3K = []
push!(rate_constant_array,0.1);	# 148	degradation_mRNA_RhoA: mRNA_RhoA = []
push!(rate_constant_array,0.1);	# 149	degradation_mRNA_ROCK: mRNA_ROCK = []
push!(rate_constant_array,0.1);	# 150	degradation_mRNA_YAP1: mRNA_YAP1 = []
push!(rate_constant_array,0.1);	# 151	degradation_mRNA_CD31: mRNA_CD31 = []
push!(rate_constant_array,0.1);	# 152	degradation_mRNA_Akt: mRNA_Akt = []
push!(rate_constant_array,1.0);	# 153	induction_gene_Smad: gene_Smad = mRNA_Smad
push!(rate_constant_array,1.0);	# 154	induction_gene_Ecadherin: gene_Ecadherin = mRNA_Ecadherin
push!(rate_constant_array,1.0);	# 155	induction_gene_Bcatenin: gene_Bcatenin = mRNA_Bcatenin
push!(rate_constant_array,1.0);	# 156	induction_gene_TCF4: gene_TCF4 = mRNA_TCF4
push!(rate_constant_array,1.0);	# 157	induction_gene_TGFB3: gene_TGFB3 = mRNA_TGFB3
push!(rate_constant_array,1.0);	# 158	induction_gene_YREG1: gene_YREG1 = mRNA_YREG1
push!(rate_constant_array,1.0);	# 159	induction_gene_LEF1: gene_LEF1 = mRNA_LEF1
push!(rate_constant_array,1.0);	# 160	induction_gene_R: gene_R = mRNA_R
push!(rate_constant_array,1.0);	# 161	induction_gene_vimentin: gene_vimentin = mRNA_vimentin
push!(rate_constant_array,1.0);	# 162	induction_gene_VEGFR: gene_VEGFR = mRNA_VEGFR
push!(rate_constant_array,1.0);	# 163	induction_gene_NFATc: gene_NFATc = mRNA_NFATc
push!(rate_constant_array,1.0);	# 164	induction_gene_PLCy: gene_PLCy = mRNA_PLCy
push!(rate_constant_array,1.0);	# 165	induction_gene_PKC: gene_PKC = mRNA_PKC
push!(rate_constant_array,1.0);	# 166	induction_gene_RAF: gene_RAF = mRNA_RAF
push!(rate_constant_array,1.0);	# 167	induction_gene_RAS: gene_RAS = mRNA_RAS
push!(rate_constant_array,1.0);	# 168	induction_gene_MAPK: gene_MAPK = mRNA_MAPK
push!(rate_constant_array,1.0);	# 169	induction_gene_AP1_SP1: gene_AP1_SP1 = mRNA_AP1_SP1
push!(rate_constant_array,1.0);	# 170	induction_gene_GSK3: gene_GSK3 = mRNA_GSK3
push!(rate_constant_array,1.0);	# 171	induction_gene_tubulin: gene_tubulin = mRNA_tubulin
push!(rate_constant_array,1.0);	# 172	induction_gene_SNAIL_SLUG: gene_SNAIL_SLUG = mRNA_SNAIL_SLUG
push!(rate_constant_array,1.0);	# 173	induction_gene_Calcineurin: gene_Calcineurin = mRNA_Calcineurin
push!(rate_constant_array,1.0);	# 174	induction_gene_APC_AXIN: gene_APC_AXIN = mRNA_APC_AXIN
push!(rate_constant_array,1.0);	# 175	induction_gene_PI3K: gene_PI3K = mRNA_PI3K
push!(rate_constant_array,1.0);	# 176	induction_gene_RhoA: gene_RhoA = mRNA_RhoA
push!(rate_constant_array,1.0);	# 177	induction_gene_ROCK: gene_ROCK = mRNA_ROCK
push!(rate_constant_array,1.0);	# 178	induction_gene_YAP1: gene_YAP1 = mRNA_YAP1
push!(rate_constant_array,1.0);	# 179	induction_gene_CD31: gene_CD31 = mRNA_CD31
push!(rate_constant_array,1.0);	# 180	induction_gene_Akt: gene_Akt = mRNA_Akt
push!(rate_constant_array,1.0);	# 181	translation_mRNA_Smad: mRNA_Smad = Smad
push!(rate_constant_array,1.0);	# 182	translation_mRNA_Ecadherin: mRNA_Ecadherin = Ecadherin
push!(rate_constant_array,1.0);	# 183	translation_mRNA_Bcatenin: mRNA_Bcatenin = Bcatenin
push!(rate_constant_array,1.0);	# 184	translation_mRNA_TCF4: mRNA_TCF4 = TCF4
push!(rate_constant_array,1.0);	# 185	translation_mRNA_TGFB3: mRNA_TGFB3 = TGFB3
push!(rate_constant_array,1.0);	# 186	translation_mRNA_YREG1: mRNA_YREG1 = YREG1
push!(rate_constant_array,1.0);	# 187	translation_mRNA_LEF1: mRNA_LEF1 = LEF1
push!(rate_constant_array,1.0);	# 188	translation_mRNA_vimentin: mRNA_vimentin = vimentin
push!(rate_constant_array,1.0);	# 189	translation_mRNA_VEGFR: mRNA_VEGFR = VEGFR
push!(rate_constant_array,1.0);	# 190	translation_mRNA_NFATc: mRNA_NFATc = NFATc
push!(rate_constant_array,1.0);	# 191	translation_mRNA_MAPK: mRNA_MAPK = MAPK
push!(rate_constant_array,1.0);	# 192	translation_mRNA_R: mRNA_R = R
push!(rate_constant_array,1.0);	# 193	translation_mRNA_PLCy: mRNA_PLCy = PLCy
push!(rate_constant_array,1.0);	# 194	translation_mRNA_PKC: mRNA_PKC = PKC
push!(rate_constant_array,1.0);	# 195	translation_mRNA_RAF: mRNA_RAF = RAF
push!(rate_constant_array,1.0);	# 196	translation_mRNA_RAS: mRNA_RAS = RAS
push!(rate_constant_array,1.0);	# 197	translation_mRNA_AP1_SP1: mRNA_AP1_SP1 = AP1_SP1
push!(rate_constant_array,1.0);	# 198	translation_mRNA_Calcineurin: mRNA_Calcineurin = Calcineurin
push!(rate_constant_array,1.0);	# 199	translation_mRNA_SNAIL_SLUG: mRNA_SNAIL_SLUG = SNAIL_SLUG
push!(rate_constant_array,1.0);	# 200	translation_mRNA_tubulin: mRNA_tubulin = tubulin
push!(rate_constant_array,1.0);	# 201	translation_mRNA_APC_AXIN: mRNA_APC_AXIN = APC_AXIN
push!(rate_constant_array,1.0);	# 202	translation_mRNA_GSK3: mRNA_GSK3 = GSK3
push!(rate_constant_array,1.0);	# 203	translation_mRNA_PI3K: mRNA_PI3K = PI3K
push!(rate_constant_array,1.0);	# 204	translation_mRNA_RhoA: mRNA_RhoA = RhoA
push!(rate_constant_array,1.0);	# 205	translation_mRNA_ROCK: mRNA_ROCK = ROCK
push!(rate_constant_array,1.0);	# 206	translation_mRNA_YAP1: mRNA_YAP1 = YAP1
push!(rate_constant_array,1.0);	# 207	translation_mRNA_CD31: mRNA_CD31 = CD31
push!(rate_constant_array,1.0);	# 208	translation_mRNA_Akt: mRNA_Akt = Akt

# Formulate the saturation constant array -
saturation_constant_array = zeros(NREACTIONS,NSPECIES);
saturation_constant_array[1,113] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: TGFB12
saturation_constant_array[1,112] = 1.0;	# TGFB12_binding: TGFB12+R =([])=> TGFB12_R	 species: R
saturation_constant_array[2,116] = 1.0;	# TGFB12_binding: TGFB12_R =([])=> TGFB12+R (reverse)	 species: TGFB12_R
saturation_constant_array[3,114] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: TGFB3
saturation_constant_array[3,112] = 1.0;	# TGFB3_binding: TGFB3+R =([])=> TGFB3_R	 species: R
saturation_constant_array[4,117] = 1.0;	# TGFB3_binding: TGFB3_R =([])=> TGFB3+R (reverse)	 species: TGFB3_R
saturation_constant_array[5,115] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGF
saturation_constant_array[5,118] = 1.0;	# VEGF_binding: VEGF+VEGFR =([])=> VEGF_VEGFR	 species: VEGFR
saturation_constant_array[6,119] = 1.0;	# VEGF_binding: VEGF_VEGFR =([])=> VEGF+VEGFR (reverse)	 species: VEGF_VEGFR
saturation_constant_array[7,39] = 1.0;	# VEGF_VEGFR_PLCy: PLCy =(VEGF_VEGFR)=> Active_PLCy	 species: PLCy
saturation_constant_array[8,41] = 1.0;	# PLCy_activation_Calcineurin: Calcineurin =(Active_PLCy)=> Active_Calcineurin	 species: Calcineurin
saturation_constant_array[9,43] = 1.0;	# Calcineurin_activation_NFATc: NFATc =(Active_Calcineurin)=> Active_NFATc	 species: NFATc
saturation_constant_array[10,45] = 1.0;	# PLCy_activatation_PKC: PKC =(Active_PLCy)=> Active_PKC	 species: PKC
saturation_constant_array[11,47] = 1.0;	# PKC_activation_RAF: RAF =(Active_PKC)=> RAF_P	 species: RAF
saturation_constant_array[12,49] = 1.0;	# TGFB12_R_phosphorylation_Smad: Smad =(TGFB12_R)=> pSmad	 species: Smad
saturation_constant_array[13,49] = 1.0;	# TGFB3_R_phosphorylation_Smad: Smad =(TGFB3_R)=> pSmad	 species: Smad
saturation_constant_array[14,51] = 1.0;	# TGFB3_R_phosphorylation_PI3K: PI3K =(TGFB3_R)=> PI3K_P	 species: PI3K
saturation_constant_array[15,53] = 1.0;	# PI3K_phosphorylation_GSK3: GSK3 =(PI3K_P)=> GSK3_P	 species: GSK3
saturation_constant_array[16,55] = 1.0;	# TGFB12_R_activation_RAS: RAS =(TGFB12_R)=> RAS_GTP	 species: RAS
saturation_constant_array[17,47] = 1.0;	# RAS_GTP_phosphorylation_RAF: RAF =(RAS_GTP)=> RAF_P	 species: RAF
saturation_constant_array[18,57] = 1.0;	# RAF_P_phosphorylation_MAPK: MAPK =(RAF_P)=> pMAPK	 species: MAPK
saturation_constant_array[19,49] = 1.0;	# MAPK_phosphorylation_Smad: Smad =(pMAPK)=> pSmad	 species: Smad
saturation_constant_array[20,59] = 1.0;	# MAPK_phosphorylation_AP1_SP1: AP1_SP1 =(pMAPK)=> AP1_SP1_P	 species: AP1_SP1
saturation_constant_array[21,61] = 2.0;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Ecadherin
saturation_constant_array[21,62] = 0.5;	# Binding_Ecadherin_Bcatenin: Ecadherin+Bcatenin =([])=> Ecadherin_Bcatenin	 species: Bcatenin
saturation_constant_array[22,63] = 1.0;	# Binding_Ecadherin_Bcatenin: Ecadherin_Bcatenin =([])=> Ecadherin+Bcatenin (reverse)	 species: Ecadherin_Bcatenin
saturation_constant_array[23,64] = 1.0;	# Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin	 species: APC_AXIN
saturation_constant_array[23,62] = 1.0;	# Binding_APC_AXIN_forw: APC_AXIN+Bcatenin =([])=> APC_AXIN_Bcatenin	 species: Bcatenin
saturation_constant_array[24,65] = 1.0;	# Binding_APC_AXIN_revs: APC_AXIN_Bcatenin =([])=> APC_AXIN+Bcatenin	 species: APC_AXIN_Bcatenin
saturation_constant_array[25,66] = 1.0;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: TCF4
saturation_constant_array[25,62] = 1.0;	# TCF4_Bcatenin_complex_formation: TCF4+Bcatenin =([])=> Active_TCF4	 species: Bcatenin
saturation_constant_array[26,67] = 1.0;	# TCF4_Bcatenin_complex_formation: Active_TCF4 =([])=> TCF4+Bcatenin (reverse)	 species: Active_TCF4
saturation_constant_array[27,68] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: LEF1
saturation_constant_array[27,62] = 1.0;	# LEF1_Bcatenin_complex_formation: LEF1+Bcatenin =([])=> Active_LEF1	 species: Bcatenin
saturation_constant_array[28,69] = 1.0;	# LEF1_Bcatenin_complex_formation: Active_LEF1 =([])=> LEF1+Bcatenin (reverse)	 species: Active_LEF1
saturation_constant_array[29,71] = 1.0;	# SHEAR_STRESS_activation_RhoA: RhoA =(SHEAR_STRESS)=> RhoA_GTP	 species: RhoA
saturation_constant_array[30,73] = 1.0;	# RhoA_GTP_activation_ROCK: ROCK =(RhoA_GTP)=> Active_ROCK	 species: ROCK
saturation_constant_array[31,75] = 1.0;	# Active_ROCK_activation_YAP1: YAP1 =(Active_ROCK)=> Active_YAP1	 species: YAP1
saturation_constant_array[32,75] = 1.0;	# Sequester_YAP1: YAP1 =([])=> Sequestered_YAP1	 species: YAP1
saturation_constant_array[33,77] = 1.0;	# Release_YAP1: Sequestered_YAP1 =([])=> YAP1	 species: Sequestered_YAP1
saturation_constant_array[34,79] = 5.0;	# CD31_phosphorylation_Akt: Akt =(CD31)=> pAkt	 species: Akt
saturation_constant_array[35,50] = 1.0;	# deactivation_pSmad: pSmad =(PPase)=> Smad	 species: pSmad
saturation_constant_array[36,48] = 1.0;	# deactivation_RAF_P: RAF_P =(PPase)=> RAF	 species: RAF_P
saturation_constant_array[37,56] = 1.0;	# deactivation_RAS_GTP: RAS_GTP =([])=> RAS	 species: RAS_GTP
saturation_constant_array[38,58] = 1.0;	# deactivation_pMAPK: pMAPK =(PPase)=> MAPK	 species: pMAPK
saturation_constant_array[39,60] = 1.0;	# deactivation_AP1_SP1: AP1_SP1_P =(PPase)=> AP1_SP1	 species: AP1_SP1_P
saturation_constant_array[40,40] = 1.0;	# deactivation_Active_PLCy: Active_PLCy =([])=> PLCy	 species: Active_PLCy
saturation_constant_array[41,46] = 1.0;	# deactivation_Active_PKC: Active_PKC =([])=> PKC	 species: Active_PKC
saturation_constant_array[42,42] = 1.0;	# deactivation_Active_Calcineurin: Active_Calcineurin =([])=> Calcineurin	 species: Active_Calcineurin
saturation_constant_array[43,44] = 1.0;	# deactivation_Active_NFATc: Active_NFATc =([])=> NFATc	 species: Active_NFATc
saturation_constant_array[44,54] = 1.0;	# deactivation_GSK3_P: GSK3_P =(PPase)=> GSK3	 species: GSK3_P
saturation_constant_array[84,72] = 1.0;	# deactivation_RhoA_GTP: RhoA_GTP =([])=> RhoA	 species: RhoA_GTP
saturation_constant_array[85,74] = 1.0;	# deactivation_Active_ROCK: Active_ROCK =([])=> ROCK	 species: Active_ROCK
saturation_constant_array[86,76] = 1.0;	# deactivation_YAP1: Active_YAP1 =([])=> YAP1	 species: Active_YAP1
saturation_constant_array[87,80] = 1.0;	# deactivation_pAkt: pAkt =(PPase)=> Akt	 species: pAkt

# Formulate control parameter array -
control_parameter_array = zeros(24,2);
# TGFB3_inhibition: TGFB3_Ab inhibition; TGFB3_binding
control_parameter_array[1,1] = 0.1;	#	1 Gain: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition
control_parameter_array[1,2] = 1.0;	#	1 Order: 	TGFB3_inhibition target: TGFB3_binding actor: TGFB3_Ab type: inhibition

# NFATc_inhibition: vivit inhibition; Calcineurin_activation_NFATc
control_parameter_array[2,1] = 0.1;	#	2 Gain: 	NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition
control_parameter_array[2,2] = 1.0;	#	2 Order: 	NFATc_inhibition target: Calcineurin_activation_NFATc actor: vivit type: inhibition

# GSK3_P_inhibition_Binding_APC_AXIN_forw: GSK3_P inhibition; Binding_APC_AXIN_forw
control_parameter_array[3,1] = 0.1;	#	3 Gain: 	GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition
control_parameter_array[3,2] = 1.0;	#	3 Order: 	GSK3_P_inhibition_Binding_APC_AXIN_forw target: Binding_APC_AXIN_forw actor: GSK3_P type: inhibition

# Active_TCF4_inhibition_Ecad: Ecadherin_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[4,1] = 0.1;	#	4 Gain: 	Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition
control_parameter_array[4,2] = 1.0;	#	4 Order: 	Active_TCF4_inhibition_Ecad target: TCF4_Bcatenin_complex_formation actor: Ecadherin_Bcatenin type: inhibition

# Active_TCF4_inhibition_APC: APC_AXIN_Bcatenin inhibition; TCF4_Bcatenin_complex_formation
control_parameter_array[5,1] = 0.1;	#	5 Gain: 	Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition
control_parameter_array[5,2] = 1.0;	#	5 Order: 	Active_TCF4_inhibition_APC target: TCF4_Bcatenin_complex_formation actor: APC_AXIN_Bcatenin type: inhibition

# ROCK_inhibition_Sequester_YAP1: Active_ROCK inhibition; Sequester_YAP1
control_parameter_array[6,1] = 0.1;	#	6 Gain: 	ROCK_inhibition_Sequester_YAP1 target: Sequester_YAP1 actor: Active_ROCK type: inhibition
control_parameter_array[6,2] = 1.0;	#	6 Order: 	ROCK_inhibition_Sequester_YAP1 target: Sequester_YAP1 actor: Active_ROCK type: inhibition

# Akt_acitvation_Sequester_YAP1: pAkt induction; Sequester_YAP1
control_parameter_array[7,1] = 0.1;	#	7 Gain: 	Akt_acitvation_Sequester_YAP1 target: Sequester_YAP1 actor: pAkt type: induction
control_parameter_array[7,2] = 1.0;	#	7 Order: 	Akt_acitvation_Sequester_YAP1 target: Sequester_YAP1 actor: pAkt type: induction

# activation_Ecadherin_by_Active_NFATc: Active_NFATc induction induction_gene_Ecadherin
control_parameter_array[8,1] = 0.1;	#	8 Gain: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction
control_parameter_array[8,2] = 1.0;	#	8 Order: 	activation_Ecadherin_by_Active_NFATc target: induction_gene_Ecadherin actor: Active_NFATc type: induction

# repression_Ecadherin_by_pSmad: pSmad repression induction_gene_Ecadherin
control_parameter_array[9,1] = 0.1;	#	9 Gain: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression
control_parameter_array[9,2] = 1.0;	#	9 Order: 	repression_Ecadherin_by_pSmad target: induction_gene_Ecadherin actor: pSmad type: repression

# repression_Ecadherin_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_Ecadherin
control_parameter_array[10,1] = 0.1;	#	10 Gain: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression
control_parameter_array[10,2] = 1.0;	#	10 Order: 	repression_Ecadherin_by_SNAIL_SLUG target: induction_gene_Ecadherin actor: SNAIL_SLUG type: repression

# repression_Ecadherin_by_Active_LEF1: Active_LEF1 repression induction_gene_Ecadherin
control_parameter_array[11,1] = 0.1;	#	11 Gain: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression
control_parameter_array[11,2] = 1.0;	#	11 Order: 	repression_Ecadherin_by_Active_LEF1 target: induction_gene_Ecadherin actor: Active_LEF1 type: repression

# activation_Ecadherin_by_ecad_virus: ecad_virus induction induction_gene_Ecadherin
control_parameter_array[12,1] = 0.1;	#	12 Gain: 	activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction
control_parameter_array[12,2] = 1.0;	#	12 Order: 	activation_Ecadherin_by_ecad_virus target: induction_gene_Ecadherin actor: ecad_virus type: induction

# activation_TGFB3_by_TCF4: Active_TCF4 induction induction_gene_TGFB3
control_parameter_array[13,1] = 0.1;	#	13 Gain: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction
control_parameter_array[13,2] = 1.0;	#	13 Order: 	activation_TGFB3_by_TCF4 target: induction_gene_TGFB3 actor: Active_TCF4 type: induction

# repression_TGFB3_by_YREG1: YREG1 repression induction_gene_TGFB3
control_parameter_array[14,1] = 0.1;	#	14 Gain: 	repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression
control_parameter_array[14,2] = 1.0;	#	14 Order: 	repression_TGFB3_by_YREG1 target: induction_gene_TGFB3 actor: YREG1 type: repression

# repression_YREG1_by_SNAIL_SLUG: SNAIL_SLUG repression induction_gene_YREG1
control_parameter_array[15,1] = 0.1;	#	15 Gain: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression
control_parameter_array[15,2] = 1.0;	#	15 Order: 	repression_YREG1_by_SNAIL_SLUG target: induction_gene_YREG1 actor: SNAIL_SLUG type: repression

# activation_LEF1_by_pSmad: pSmad induction induction_gene_LEF1
control_parameter_array[16,1] = 0.1;	#	16 Gain: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction
control_parameter_array[16,2] = 1.0;	#	16 Order: 	activation_LEF1_by_pSmad target: induction_gene_LEF1 actor: pSmad type: induction

# repression_LEF1_by_YREG1: YREG1 repression induction_gene_LEF1
control_parameter_array[17,1] = 0.1;	#	17 Gain: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression
control_parameter_array[17,2] = 1.0;	#	17 Order: 	repression_LEF1_by_YREG1 target: induction_gene_LEF1 actor: YREG1 type: repression

# activation_vimentin_by_Active_LEF1: Active_LEF1 induction induction_gene_vimentin
control_parameter_array[18,1] = 0.1;	#	18 Gain: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction
control_parameter_array[18,2] = 1.0;	#	18 Order: 	activation_vimentin_by_Active_LEF1 target: induction_gene_vimentin actor: Active_LEF1 type: induction

# activation_vimentin_by_AP1_SP1_P: AP1_SP1_P induction induction_gene_vimentin
control_parameter_array[19,1] = 0.1;	#	19 Gain: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction
control_parameter_array[19,2] = 1.0;	#	19 Order: 	activation_vimentin_by_AP1_SP1_P target: induction_gene_vimentin actor: AP1_SP1_P type: induction

# activation_SNAIL_SLUG_by_pSmad: pSmad induction induction_gene_SNAIL_SLUG
control_parameter_array[20,1] = 0.1;	#	20 Gain: 	activation_SNAIL_SLUG_by_pSmad target: induction_gene_SNAIL_SLUG actor: pSmad type: induction
control_parameter_array[20,2] = 1.0;	#	20 Order: 	activation_SNAIL_SLUG_by_pSmad target: induction_gene_SNAIL_SLUG actor: pSmad type: induction

# activation_SNAIL_SLUG_by_ss_virus: ss_virus induction induction_gene_SNAIL_SLUG
control_parameter_array[21,1] = 0.1;	#	21 Gain: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction
control_parameter_array[21,2] = 1.0;	#	21 Order: 	activation_SNAIL_SLUG_by_ss_virus target: induction_gene_SNAIL_SLUG actor: ss_virus type: induction

# activation_YAP1_by_ROCK: Active_ROCK induction induction_gene_YAP1
control_parameter_array[22,1] = 0.1;	#	22 Gain: 	activation_YAP1_by_ROCK target: induction_gene_YAP1 actor: Active_ROCK type: induction
control_parameter_array[22,2] = 1.0;	#	22 Order: 	activation_YAP1_by_ROCK target: induction_gene_YAP1 actor: Active_ROCK type: induction

# activation_CD1_by_SHEAR_STRESS_2: SHEAR_STRESS_2 induction induction_gene_CD31
control_parameter_array[23,1] = 0.1;	#	23 Gain: 	activation_CD1_by_SHEAR_STRESS_2 target: induction_gene_CD31 actor: SHEAR_STRESS_2 type: induction
control_parameter_array[23,2] = 1.0;	#	23 Order: 	activation_CD1_by_SHEAR_STRESS_2 target: induction_gene_CD31 actor: SHEAR_STRESS_2 type: induction


# Dilution selection array -
dilution_selection_array = ones(Int,NSPECIES)
dilution_selection_array[1] = 0.0;	#	gene_Smad
dilution_selection_array[2] = 0.0;	#	gene_Ecadherin
dilution_selection_array[3] = 0.0;	#	gene_Bcatenin
dilution_selection_array[4] = 0.0;	#	gene_PLCy
dilution_selection_array[5] = 0.0;	#	gene_PKC
dilution_selection_array[6] = 0.0;	#	gene_RAF
dilution_selection_array[7] = 0.0;	#	gene_RAS
dilution_selection_array[8] = 0.0;	#	gene_AP1_SP1
dilution_selection_array[9] = 0.0;	#	gene_GSK3
dilution_selection_array[10] = 0.0;	#	gene_tubulin
dilution_selection_array[11] = 0.0;	#	gene_SNAIL_SLUG
dilution_selection_array[12] = 0.0;	#	gene_Calcineurin
dilution_selection_array[13] = 0.0;	#	gene_APC_AXIN
dilution_selection_array[14] = 0.0;	#	gene_PI3K
dilution_selection_array[15] = 0.0;	#	gene_RhoA
dilution_selection_array[16] = 0.0;	#	gene_ROCK
dilution_selection_array[17] = 0.0;	#	gene_YAP1
dilution_selection_array[18] = 0.0;	#	gene_CD31
dilution_selection_array[19] = 0.0;	#	gene_Akt
dilution_selection_array[94] = 0.0;	#	gene_TCF4
dilution_selection_array[95] = 0.0;	#	gene_TGFB3
dilution_selection_array[96] = 0.0;	#	gene_YREG1
dilution_selection_array[97] = 0.0;	#	gene_LEF1
dilution_selection_array[98] = 0.0;	#	gene_vimentin
dilution_selection_array[99] = 0.0;	#	gene_R
dilution_selection_array[100] = 0.0;	#	gene_VEGFR
dilution_selection_array[101] = 0.0;	#	gene_NFATc
dilution_selection_array[102] = 0.0;	#	gene_MAPK

# Set the maximum specific growth rate -
maximum_specific_growth_rate = 0.03; # hr^-1

# Set Bionumbers scaling constants
average_transcript_length = 15000 # n
average_protein_length = 5000     # aa

max_translation_rate = 5          # aa/sec
max_transcription_rate = 6.0       # n/sec

av_number = 6.02e23               # number/mol

hl60_diameter = 12                # \mum
fraction_nucleus = 0.49           # dimensionless
VOLUME = ((1-fraction_nucleus)*(1/6)*(3.14159)*(hl60_diameter)^3)*(1e-15)

kcat_transcription = max_transcription_rate*(3600/average_transcript_length)  # hr^-1
kcat_translation = max_translation_rate*(3600/average_protein_length)  # hr^-1

saturation_transcription = (46000*10.0)*(1/av_number)*(1/VOLUME)*1e9
saturation_translation = (100000*1.0)*(1/av_number)*(1/VOLUME)*1e9

mRNA_half_life_TF = 9             # hrs
protein_half_life = 46            # hrs

const global degradation_constant_mRNA = -(1/mRNA_half_life_TF)*log(0.5)
const global degradation_constant_protein = -(1/protein_half_life)*log(0.5)

const global const_transcription = kcat_transcription/saturation_transcription
const global const_translation   = kcat_translation/saturation_translation


# ---------------------------- DO NOT EDIT BELOW THIS LINE -------------------------- #
data_dictionary = Dict();
data_dictionary["STOICHIOMETRIC_MATRIX"] = S;
data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;
data_dictionary["SATURATION_CONSTANT_ARRAY"] = saturation_constant_array;
data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
data_dictionary["TIME_CONSTANT_ARRAY"] = time_constant_array;
data_dictionary["CONTROL_PARAMETER_ARRAY"] = control_parameter_array;
data_dictionary["MAXIMUM_SPECIFIC_GROWTH_RATE"] = maximum_specific_growth_rate;
data_dictionary["DILUTION_SELECTION_ARRAY"] = dilution_selection_array;
# ----------------------------------------------------------------------------------- #
return data_dictionary;
end
