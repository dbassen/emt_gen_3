obj1=(BLOT,MOD) = ([0.04932735426008968,0.0,0.9237668161434978,0.852017937219731],[0.0,0.04964738314812608,1.0,0.12533984495814932])
obj2=(BLOT,MOD) = ([1.0,0.0,0.0,0.9468599033816425,0.8840579710144928,0.1497584541062802],[1.0,0.059145659868201576,0.0,0.5971646127440517,0.6655965543788214,0.013471697027742173])
obj3=(BLOT,MOD) = ([0.0,1.0],[0.0,1.0])
obj4=(BLOT,MOD) = ([0.84,0.0,0.0,0.0,0.905,0.915,0.845,0.19,0.1],[1.0,0.059145659868201576,0.15681588880934164,0.0,0.5971646127440517,0.4010295001182645,0.0014766712677726102,0.25000797518418494,0.08924580077044962])
obj5=(BLOT,MOD) = ([0.0,0.9079754601226994,1.0,0.9079754601226994,0.0,0.9079754601226994],[0.0,0.9999999999996716,0.15423496067597817,1.0,0.004626777375006241,0.9999999999997787])
obj6=(BLOT,MOD) = ([0.08465608465608465,0.0,0.9047619047619048,0.9894179894179894,0.8095238095238095,0.0,0.164021164021164,0.0,0.9947089947089947],[0.0028648402327567505,0.03565208167149636,0.6027844097257922,0.4051079991562702,0.3599615186020545,0.0,0.13106960294944078,0.03746283086378769,1.0])
obj7=(BLOT,MOD) = ([0.02358490566037736,0.0],[0.0,0.0])
obj8=(BLOT,MOD) = ([0.0,0.8114035087719298,0.043859649122807015],[0.013030317788937167,1.0,0.0])
obj9=(BLOT,MOD) = ([0.8414096916299559,0.0,0.0,0.7973568281938326,0.8722466960352423,0.1145374449339207,0.801762114537445,0.11013215859030837],[0.9356762896036852,0.05504270821447438,0.0,0.5520847526073325,1.0,0.0571807364515623,0.778175370018993,0.012292815283369127])
obj10=(BLOT,MOD) = ([0.13725490196078433,0.9362745098039216,0.00980392156862745],[0.0,1.0,2.8895233077534112e-6])
obj11y=(BLOT,MOD) = ([0.0,1.0,0.08796296296296297],[0.0,0.7644735868598931,1.0])


def tuplsnice(tupe,n=5):
    return [(round(x,n),round(y,n)) for x,y in zip(tupe[0],tupe[1])]
f = tuplsnice