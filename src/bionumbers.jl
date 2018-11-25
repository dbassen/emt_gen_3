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

