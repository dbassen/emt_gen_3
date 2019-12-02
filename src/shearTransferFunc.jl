# # Shear calcuations
# # Calculate shear factor
# k= 1
# a= 2
# b= 2
# K= 10
#
# X = k*(M^a)*(1/(b^(F)))
# TN= X/(K+X)
# # println("Shear factor")
# # println(X)
# # println(1-TN)
# # println(TN)
# # println("------------")
#
# TAO_1 = 1-TN
# TAO_2 = TN
#
# # TAO_1 RHOA
#
# k= 1
# a = 2
# b = 1 # was 4
# K = 10
#
# X = k*(M^a)*(1/(b^(F)))
# TN= X/(K+X)
# TAO_1 = 1-TN
#
# # TAO_2 CD31
# k= 0.1
# a = 4
# b = 10
# K = 10
#
# X = k*(M^a)*(1/(b^(F)))
# TN= X/(K+X)
# TAO_2 = TN

##
# M= 1
# F= 0
k= 0.5
a = 2
b = 1 # was 4
K = 10

X = k*(M^a)*(1/(b^(F)))
TN= X/(K+X)
TAO_1 = 1-TN

# TAO_2 CD31
k= 0.1
a = 4
b = 10
K = 10

X = k*(M^a)*(1/(b^(F)))
TN= X/(K+X)
TAO_2 = TN
#println(M," ",F)
#println(TAO_1," ",TAO_2)
##

# form 2

# # TAO_1 RHOA
# k= 1
# a = 1
# b = 2
# K = 1
#
#
# X = (k*(M^a)*(1/(M^(b*F))))/(K+k*(M^a)*(1/(M^(b*F))))
# TN= X/(K+X)
# TAO_1 = 1-TN
#
# # TAO_2 CD21
# k= 0.5
# a = 1.5
# b = 0.5
# K = 3
#
# X = (k*(M^a)*(1/(M^(b*F))))/(K+k*(M^a)*(1/(M^(b*F))))
# TN= X/(K+X)
# TAO_2 = TN
