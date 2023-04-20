## Dataset

The dataset comes from an association study around the APOE locus by the
Japanese Genetic Study Consortium for Alzheimer Disease (PMID:
[19442637](https://pubmed.ncbi.nlm.nih.gov/19442637/)). We simulated the
data at neutral sites that were omitted from the publication. 547
patients with LOAD and 715 controls were genotyped at SNPs in a 200 kb
region including the APOE locus. 171 SNPs passed quality control.

The study was conducted in a homogeneous Japanese population. This
avoids the problem of population substructure: mixing populations that
are heterogeneous with respect to allele frequencies and disease
prevalence causes spurious associations.

Each SNP site has 2 alleles in the sample gene pool. The allele in
lowercase is the minor allele, i.e., the allele that is less frequent in
the population.

    library(tidyverse)
    geno <- read.csv("https://raw.githubusercontent.com/mss-genomics/first-meeting/main/APOE_LOAD.csv")
    geno

    ##         SNP_ID Allele   MAF LOAD_MM LOAD_Mm LOAD_mm Control_MM Control_Mm
    ## 1     rs419010    A/g 0.493     112     278     150        206        348
    ## 2     rs394221    C/t 0.487     149     269      91        153        325
    ## 3    rs4803766    G/a 0.434     136     273     130        265        328
    ## 4     rs395908    G/a 0.280     228     240      70        414        261
    ## 5     rs519113    C/g 0.273     237     226      73        423        258
    ## 6     rs412776    G/a 0.257     245     230      65        440        237
    ## 7    rs3865427    C/a 0.209     299     198      43        481        206
    ## 8    rs3852860    T/c 0.321     191     268      77        359        292
    ## 9    rs3852861    T/g 0.318     196     261      80        375        294
    ## 10      rs6857    C/t 0.180     316     184      26        504        183
    ## 11    rs157580    A/g 0.467     192     262      85        162        351
    ## 12    rs157581    T/c 0.329     194     251      90        363        281
    ## 13    rs157582    C/t 0.292     212     240      80        417        250
    ## 14    rs157583    G/t 0.043     465      57       7        659         34
    ## 15   rs1160983    G/a 0.048     511      30       0        616         82
    ## 16    rs157587    A/g 0.043     467      58       6        668         36
    ## 17    rs205909    T/g 0.044     468      61       7        673         35
    ## 18    rs417357    C/t 0.038     472      52       7        675         28
    ## 19   rs1160985    C/t 0.266     323     192      28        346        300
    ## 20    rs760136    A/g 0.265     323     191      27        338        294
    ## 21    rs741780    T/c 0.269     314     193      26        340        306
    ## 22    rs394819    G/t 0.043     473      58       7        672         35
    ## 23    rs405697    G/a 0.496      98     276     167        216        348
    ## 24     rs10119    C/t 0.229     249     225      66        509        189
    ## 25    rs446037    G/t 0.044     468      60       7        674         34
    ## 26    rs434132    C/g 0.043     474      59       7        675         34
    ## 27   rs7259620    G/a 0.264     319     189      27        349        301
    ## 28    rs449647    A/t 0.049     457      70       2        658         44
    ## 29    rs769446    T/c 0.036     522      22       0        647         60
    ## 30    rs440446    C/g 0.426     125     270     129        261        319
    ## 31    rs429358    T/c 0.167     298     202      47        590        124
    ## 32   rs7256200    G/t 0.128     348     164      27        608        101
    ## 33    rs483082    G/t 0.208     274     213      51        504        172
    ## 34    rs584007    G/a 0.439     129     279     130        248        358
    ## 35   rs4420638    A/g 0.203     297     199      41        565        135
    ## 36   rs1903833    C/t 0.110     432     108       7        568        138
    ## 37   rs2927479    C/a 0.030     506      40       1        681         34
    ## 38   rs2927478    C/t 0.030     516      31       0        671         43
    ## 39   rs2967671    C/g 0.020     522      25       0        690         25
    ## 40    rs922387    G/a 0.110     438     103       6        561        145
    ## 41   rs2927477    T/c 0.130     424     115       8        532        169
    ## 42   rs7249750    C/t 0.020     529      18       0        683         32
    ## 43    rs936517    G/t 0.190     361     167      19        466        223
    ## 44   rs3810141    C/t 0.020     528      19       0        684         31
    ## 45   rs8101274    G/a 0.110     442      99       6        558        147
    ## 46      rs7026    C/t 0.360     220     254      73        297        327
    ## 47   rs6509172    C/t 0.380     209     259      79        276        336
    ## 48   rs1871045    C/t 0.360     226     251      70        291        330
    ## 49   rs4803759    C/t 0.420     190     264      93        235        350
    ## 50   rs4803760    C/t 0.400     200     262      85        254        344
    ## 51   rs2927481    C/a 0.220     337     185      25        431        248
    ## 52   rs2927480    G/c 0.220     348     176      23        421        255
    ## 53   rs2927482    G/a 0.420     186     266      95        239        348
    ## 54   rs4599021    G/a 0.200     336     186      25        471        219
    ## 55   rs1985096    A/t 0.420     181     268      98        243        348
    ## 56   rs1001611    G/a 0.180     377     154      16        472        218
    ## 57   rs4452060    C/a 0.230     326     192      29        422        255
    ## 58   rs2927472    C/t 0.390     205     259      83        265        341
    ## 59   rs3810143    T/c 0.230     323     195      29        425        252
    ## 60  rs11549721    T/g 0.230     323     195      29        425        252
    ## 61   rs2306149    C/a 0.180     375     156      16        474        216
    ## 62   rs3786502    G/a 0.030     513      33       1        675         39
    ## 63   rs1871047    A/g 0.250     294     214      39        416        259
    ## 64   rs2972569    T/c 0.430     180     267     100        231        350
    ## 65   rs1871046    A/g 0.180     367     162      18        482        210
    ## 66   rs4802240    C/t 0.180     367     162      18        482        210
    ## 67   rs1531516    G/c 0.180     375     156      16        474        216
    ## 68   rs2972566    C/g 0.410     194     263      90        246        346
    ## 69   rs4803765    G/t 0.130     423     116       8        532        170
    ## 70   rs2927466    C/g 0.060     489      56       2        627         85
    ## 71   rs3112438    A/g 0.060     482      63       2        633         80
    ## 72   rs2972557    A/g 0.100     447      95       5        576        131
    ## 73    rs440277    G/a 0.080     469      75       3        599        111
    ## 74   rs2436474    G/t 0.080     462      81       4        606        105
    ## 75    rs377702    G/a 0.080     456      87       4        612         99
    ## 76    rs454050    C/a 0.070     474      70       3        618         93
    ## 77    rs384973    T/g 0.080     463      80       4        606        104
    ## 78    rs521629    C/t 0.080     457      86       4        611        100
    ## 79    rs519825    T/c 0.080     462      81       4        606        105
    ## 80   rs3112439    C/g 0.060     486      59       2        630         82
    ## 81    rs520283    G/t 0.070     491      54       2        601        109
    ## 82    rs564724    C/t 0.070     472      72       3        619         93
    ## 83    rs510297    A/c 0.070     464      80       3        627         85
    ## 84    rs416041    T/c 0.070     475      69       3        617         94
    ## 85   rs8104483    T/g 0.140     418     120       9        516        183
    ## 86    rs387465    A/g 0.070     477      68       2        614         97
    ## 87   rs4803767    C/t 0.140     399     136      12        535        167
    ## 88   rs2075642    G/a 0.140     398     137      12        536        166
    ## 89   rs3852859    T/c 0.140     408     129      10        526        174
    ## 90    rs369599    T/c 0.200     350     175      22        458        228
    ## 91   rs3837923    T/g 0.200     358     169      20        450        234
    ## 92    rs370705    T/c 0.200     351     174      22        457        229
    ## 93    rs385982    C/a 0.200     352     174      21        455        231
    ## 94    rs419925    C/g 0.210     336     185      26        452        233
    ## 95    rs421812    T/g 0.210     356     170      21        432        248
    ## 96   rs3729640    C/t 0.150     389     144      14        523        177
    ## 97      rs6859    G/a 0.400     188     266      93        266        340
    ## 98   rs7507450    G/c 0.210     335     186      26        453        232
    ## 99    rs283809    A/g 0.100     440     101       6        583        125
    ## 100   rs283813    T/a 0.090     449      93       5        596        114
    ## 101  rs7254892    G/a 0.040     494      52       1        669         45
    ## 102  rs2075649    A/g 0.240     316     200      31        412        262
    ## 103  rs2075650    A/g 0.190     371     159      17        457        229
    ## 104   rs157584    T/c 0.300     263     232      52        356        297
    ## 105   rs157585    A/c 0.310     256     236      55        345        304
    ## 106   rs157588    C/t 0.310     260     234      53        341        306
    ## 107   rs157590    A/c 0.310     267     231      49        334        309
    ## 108  rs1038025    T/c 0.270     296     213      38        377        284
    ## 109  rs1038026    A/g 0.260     304     208      35        387        278
    ## 110  rs1305062    G/c 0.210     364     164      19        425        252
    ## 111  rs7256173    C/t 0.010     531      16       0        706          9
    ## 112   rs405509    T/g 0.270     301     210      36        372        287
    ## 113   rs769450    G/a 0.210     357     170      20        431        248
    ## 114     rs7412    C/t 0.040     500      46       1        663         51
    ## 115   rs445925    G/a 0.080     467      77       3        601        109
    ## 116  rs4803770    C/g 0.220     318     198      31        450        235
    ## 117  rs7259004    G/c 0.220     327     192      28        441        241
    ## 118  rs4263041    G/a 0.220     322     195      30        446        238
    ## 119     rs5157    C/t 0.320     256     236      55        328        312
    ## 120     rs5158    C/t 0.070     476      68       3        616         95
    ## 121  rs1132899    C/t 0.320     252     238      57        332        310
    ## 122     rs5167    T/g 0.480     146     274     127        195        356
    ## 123  rs2288912    G/c 0.360     213     256      78        304        325
    ## 124  rs2288911    C/a 0.350     230     250      67        303        325
    ## 125  rs4803774    A/g 0.490     139     273     135        189        358
    ## 126  rs7256684    A/g 0.490     145     273     129        183        358
    ## 127     rs5120    A/t 0.370     229     250      68        272        338
    ## 128  rs7257468    C/t 0.480     139     274     134        202        356
    ## 129  rs7258345    T/g 0.490     130     274     143        198        357
    ## 130  rs7246900    G/a 0.490     147     273     127        181        358
    ## 131  rs7248162    T/c 0.490     143     274     130        185        357
    ## 132  rs7247227    A/g 0.480     137     273     137        205        355
    ## 133  rs7247551    A/g 0.360     206     259      82        312        320
    ## 134   rs892101    G/a 0.490     140     273     134        188        358
    ## 135  rs7251501    C/t 0.480     145     273     129        196        357
    ## 136  rs7251503    C/g 0.490     148     274     125        180        357
    ## 137  rs4803779    T/c 0.490     139     274     134        189        357
    ## 138  rs4803780    C/t 0.480     129     274     144        213        354
    ## 139  rs3760625    G/a 0.490     148     274     125        180        357
    ## 140  rs3760627    T/c 0.480     143     273     131        198        357
    ## 141  rs3760629    A/c 0.490     132     273     142        197        356
    ## 142  rs4803781    G/a 0.490     139     273     135        189        358
    ## 143  rs2239375    T/c 0.490     148     273     126        180        358
    ## 144   rs204905    T/c 0.360     225     251      71        292        330
    ## 145  rs1882752    G/c 0.430     182     267      98        228        352
    ## 146   rs204907    T/c 0.150     397     138      12        514        185
    ## 147   rs204911    T/a 0.150     387     146      14        525        175
    ## 148   rs760114    T/c 0.050     490      55       2        650         63
    ## 149  rs8100236    T/c 0.490     141     274     132        187        357
    ## 150  rs4803783    G/c 0.420     177     268     102        248        346
    ## 151   rs204481    C/t 0.150     400     136      11        511        187
    ## 152  rs2293755    C/g 0.200     340     182      25        468        221
    ## 153   rs204479    C/t 0.150     400     136      11        511        187
    ## 154   rs204478    A/t 0.060     491      55       1        624         88
    ## 155  rs2075620    A/g 0.430     179     267     101        232        350
    ## 156   rs204477    G/a 0.150     392     142      13        520        179
    ## 157  rs7257916    T/c 0.360     222     253      72        295        328
    ## 158   rs204476    C/a 0.150     393     141      13        519        180
    ## 159  rs8111069    A/c 0.440     176     268     103        220        353
    ## 160   rs204472    G/a 0.150     383     149      15        529        172
    ## 161   rs204471    C/t 0.150     396     139      12        515        184
    ## 162   rs204470    G/a 0.150     400     136      11        511        187
    ## 163   rs204469    G/a 0.150     409     128      10        503        193
    ## 164  rs3786505    A/g 0.440     169     270     108        227        351
    ## 165   rs204467    C/t 0.410     193     263      91        247        346
    ## 166   rs204465    T/c 0.150     397     138      12        514        185
    ## 167   rs909134    T/g 0.440     164     271     112        232        350
    ## 168  rs3859419    C/g 0.050     496      50       1        643         70
    ## 169   rs875255    C/t 0.380     218     254      75        268        339
    ## 170  rs2075618    G/c 0.430     171     270     106        239        349
    ## 171     rs9193    C/t 0.050     492      54       1        647         66
    ##     Control_mm
    ## 1          150
    ## 2          180
    ## 3          107
    ## 4           26
    ## 5           23
    ## 6           19
    ## 7           14
    ## 8           36
    ## 9           39
    ## 10          11
    ## 11         187
    ## 12          47
    ## 13          36
    ## 14           0
    ## 15           3
    ## 16           0
    ## 17           0
    ## 18           0
    ## 19          57
    ## 20          57
    ## 21          57
    ## 22           0
    ## 23         137
    ## 24          13
    ## 25           1
    ## 26           0
    ## 27          56
    ## 28           1
    ## 29           4
    ## 30          81
    ## 31           1
    ## 32           0
    ## 33          12
    ## 34          95
    ## 35           1
    ## 36           9
    ## 37           0
    ## 38           1
    ## 39           0
    ## 40           9
    ## 41          14
    ## 42           0
    ## 43          26
    ## 44           0
    ## 45          10
    ## 46          91
    ## 47         103
    ## 48          94
    ## 49         130
    ## 50         117
    ## 51          36
    ## 52          39
    ## 53         128
    ## 54          25
    ## 55         124
    ## 56          25
    ## 57          38
    ## 58         109
    ## 59          38
    ## 60          38
    ## 61          25
    ## 62           1
    ## 63          40
    ## 64         134
    ## 65          23
    ## 66          23
    ## 67          25
    ## 68         123
    ## 69          13
    ## 70           3
    ## 71           2
    ## 72           8
    ## 73           5
    ## 74           4
    ## 75           4
    ## 76           4
    ## 77           5
    ## 78           4
    ## 79           4
    ## 80           3
    ## 81           5
    ## 82           3
    ## 83           3
    ## 84           4
    ## 85          16
    ## 86           4
    ## 87          13
    ## 88          13
    ## 89          15
    ## 90          29
    ## 91          31
    ## 92          29
    ## 93          29
    ## 94          30
    ## 95          35
    ## 96          15
    ## 97         109
    ## 98          30
    ## 99           7
    ## 100          5
    ## 101          1
    ## 102         41
    ## 103         29
    ## 104         62
    ## 105         66
    ## 106         68
    ## 107         72
    ## 108         54
    ## 109         50
    ## 110         38
    ## 111          0
    ## 112         56
    ## 113         36
    ## 114          1
    ## 115          5
    ## 116         30
    ## 117         33
    ## 118         31
    ## 119         75
    ## 120          4
    ## 121         73
    ## 122        164
    ## 123         86
    ## 124         87
    ## 125        168
    ## 126        174
    ## 127        105
    ## 128        157
    ## 129        160
    ## 130        176
    ## 131        173
    ## 132        155
    ## 133         83
    ## 134        169
    ## 135        162
    ## 136        178
    ## 137        169
    ## 138        148
    ## 139        178
    ## 140        160
    ## 141        162
    ## 142        168
    ## 143        177
    ## 144         93
    ## 145        135
    ## 146         16
    ## 147         15
    ## 148          2
    ## 149        171
    ## 150        121
    ## 151         17
    ## 152         26
    ## 153         17
    ## 154          3
    ## 155        133
    ## 156         16
    ## 157         92
    ## 158         16
    ## 159        142
    ## 160         14
    ## 161         16
    ## 162         17
    ## 163         19
    ## 164        137
    ## 165        122
    ## 166         16
    ## 167        133
    ## 168          2
    ## 169        108
    ## 170        127
    ## 171          2

## Statistics

First, calculate the allele counts from the genotype counts.

    geno1 <- geno %>% rowwise() %>%
      mutate(LOAD_M=2*LOAD_MM+LOAD_Mm) %>% 
      mutate(LOAD_m=2*LOAD_mm+LOAD_Mm) %>% 
      mutate(Control_M=2*Control_MM+Control_Mm) %>%
      mutate(Control_m=2*Control_mm+Control_Mm)
    geno1

    ## # A tibble: 171 × 13
    ## # Rowwise: 
    ##    SNP_ID    Allele   MAF LOAD_MM LOAD_Mm LOAD_mm Contr…¹ Contr…² Contr…³ LOAD_M
    ##    <chr>     <chr>  <dbl>   <int>   <int>   <int>   <int>   <int>   <int>  <dbl>
    ##  1 rs419010  A/g    0.493     112     278     150     206     348     150    502
    ##  2 rs394221  C/t    0.487     149     269      91     153     325     180    567
    ##  3 rs4803766 G/a    0.434     136     273     130     265     328     107    545
    ##  4 rs395908  G/a    0.28      228     240      70     414     261      26    696
    ##  5 rs519113  C/g    0.273     237     226      73     423     258      23    700
    ##  6 rs412776  G/a    0.257     245     230      65     440     237      19    720
    ##  7 rs3865427 C/a    0.209     299     198      43     481     206      14    796
    ##  8 rs3852860 T/c    0.321     191     268      77     359     292      36    650
    ##  9 rs3852861 T/g    0.318     196     261      80     375     294      39    653
    ## 10 rs6857    C/t    0.18      316     184      26     504     183      11    816
    ## # … with 161 more rows, 3 more variables: LOAD_m <dbl>, Control_M <dbl>,
    ## #   Control_m <dbl>, and abbreviated variable names ¹​Control_MM, ²​Control_Mm,
    ## #   ³​Control_mm

Association (i.e. lack of independence) between the genotypes at a site
and the disease can be tested by a chi-square test with 2 d.f. for the
2x3 contingency table of genotype counts.

Here is an example for the E4 allele of APOE:

    E4 <- "rs429358"
    E4_genotype_table <- rbind(c(geno1[geno1$SNP_ID==E4,]$Control_MM, geno1[geno1$SNP_ID==E4,]$LOAD_MM), c(geno1[geno1$SNP_ID==E4,]$Control_Mm,geno1[geno1$SNP_ID==E4,]$LOAD_Mm), c(geno1[geno1$SNP_ID==E4,]$Control_mm,geno1[geno1$SNP_ID==E4,]$LOAD_mm))
    chisq.test(E4_genotype_table)$p.value

    ## [1] 7.02883e-31

Calculate the odds ratios and their 95% confidence interval for the
E4/E4 and E3/E4 genotypes compared to the E3/E3 genotype.

    library(epitools)
    oddsratio(E4_genotype_table)$measure

    ##           odds ratio with 95% C.I.
    ## Predictor  estimate     lower      upper
    ##   Exposed1  1.00000        NA         NA
    ##   Exposed2  3.22048  2.478019    4.20017
    ##   Exposed3 81.26147 17.910623 1899.72514

The Cochran-Armitage trend test requires a specific genetic model. For
example, test whether the disease risk increases linearly with the
number of risk alleles, i.e., the additive model. Also test for a
recessive model or a dominant model.

    trend_add <- prop.trend.test(E4_genotype_table[,1], E4_genotype_table[,1]+E4_genotype_table[,2], c(0,0.5,1))
    trend_dom <- prop.trend.test(E4_genotype_table[,1], E4_genotype_table[,1]+E4_genotype_table[,2], c(0,1,1))
    trend_rec <- prop.trend.test(E4_genotype_table[,1], E4_genotype_table[,1]+E4_genotype_table[,2], c(0,0,1))
    c(trend_add$p.value, trend_dom$p.value, trend_rec$p.value)

    ## [1] 6.648448e-32 3.117625e-27 7.303970e-15

A commonly used significance test compares the allele frequencies
between cases and controls using a chi-square test with 1 d.f. for the
2x2 contingency table of allele counts.

    E4_allele_table <- rbind(c(geno1[geno1$SNP_ID==E4,]$Control_M, geno1[geno1$SNP_ID==E4,]$LOAD_M),c(geno1[geno1$SNP_ID==E4,]$Control_m,geno1[geno1$SNP_ID==E4,]$LOAD_m))
    oddsratio(E4_allele_table)

    ## $data
    ##           Outcome
    ## Predictor  Disease1 Disease2 Total
    ##   Exposed1     1304      798  2102
    ##   Exposed2      126      296   422
    ##   Total        1430     1094  2524
    ## 
    ## $measure
    ##           odds ratio with 95% C.I.
    ## Predictor  estimate    lower    upper
    ##   Exposed1 1.000000       NA       NA
    ##   Exposed2 3.834175 3.064376 4.821686
    ## 
    ## $p.value
    ##           two-sided
    ## Predictor  midp.exact fisher.exact   chi.square
    ##   Exposed1         NA           NA           NA
    ##   Exposed2          0 5.211636e-34 4.319038e-34
    ## 
    ## $correction
    ## [1] FALSE
    ## 
    ## attr(,"method")
    ## [1] "median-unbiased estimate & mid-p exact CI"

In what follows, calculate the allele-based chi-square test and odds
ratio with 95% confidence intervals for each SNP.

    geno1 <- geno1 %>% rowwise() %>%
      mutate(stats = paste(unlist(oddsratio(rbind(c(Control_M,LOAD_M),c(Control_m,LOAD_m))))[c("p.value6","measure2","measure4","measure6")], collapse=" ")) %>%
      separate(stats, c("p_value", "OR", "95_CI_inf", "95_CI_sup"), sep = " ", convert=TRUE)
    geno1[,c(1:2,10:17)]

    ## # A tibble: 171 × 10
    ##    SNP_ID    Allele LOAD_M LOAD_m Contr…¹ Contr…²  p_value    OR 95_CI…³ 95_CI…⁴
    ##    <chr>     <chr>   <dbl>  <dbl>   <dbl>   <dbl>    <dbl> <dbl>   <dbl>   <dbl>
    ##  1 rs419010  A/g       502    578     760     648 2.10e- 4 1.35    1.15    1.58 
    ##  2 rs394221  C/t       567    451     631     685 2.04e- 4 0.733   0.622   0.864
    ##  3 rs4803766 G/a       545    533     858     542 9.16e- 8 1.55    1.32    1.82 
    ##  4 rs395908  G/a       696    380    1089     313 9.24e-13 1.90    1.59    2.27 
    ##  5 rs519113  C/g       700    372    1104     304 3.77e-13 1.93    1.61    2.31 
    ##  6 rs412776  G/a       720    360    1117     275 1.81e-14 2.03    1.69    2.44 
    ##  7 rs3865427 C/a       796    284    1168     234 5.27e- 9 1.78    1.47    2.16 
    ##  8 rs3852860 T/c       650    422    1010     364 1.33e-11 1.80    1.52    2.14 
    ##  9 rs3852861 T/g       653    421    1044     372 6.99e-12 1.81    1.53    2.15 
    ## 10 rs6857    C/t       816    236    1191     205 7.88e- 7 1.68    1.37    2.07 
    ## # … with 161 more rows, and abbreviated variable names ¹​Control_M, ²​Control_m,
    ## #   ³​`95_CI_inf`, ⁴​`95_CI_sup`

In order to adjust for multiple testing, apply the Bonferonni
correction. Divide the desired genome-wide significance level by the
number of tests performed: 0.05/171=0.0003. Consider an SNP to be
statistically significant if its p-value&lt;0.0003. In a GWAS involving
100K to 1M SNPs, the significance level is typically set to 5x10^-8.

## Ensembl

Each rsID denotes a unique SNP site. Query the Ensembl database to
obtain more information about an SNP site, such as its position on the
chromosome and its genetic context.

    library(biomaRt)
    marts <- listEnsembl()
    ensembl <- useEnsembl(biomart = "snps")
    datasets <- searchDatasets(mart = ensembl, pattern = "Human")
    ensembl <- useDataset(dataset = "hsapiens_snp", mart = ensembl)
    filters <- listFilters(ensembl)
    attributes <- listAttributes(ensembl)
    rsid <- getBM(attributes = c('refsnp_id', 'chr_name', 'chrom_start', 'ensembl_gene_name', "cds_start"),
      filters = 'snp_filter',
      values = geno1$SNP_ID, 
      mart = ensembl
    )
    ensembl2 <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")
    symbols <- getBM(attributes = c('ensembl_gene_id', 'external_gene_name'),
      filters = 'ensembl_gene_id',
      values = unique(rsid$ensembl_gene_name),
      mart = ensembl2
    )
    geno2 <- rsid %>% 
      left_join(symbols, by = join_by(ensembl_gene_name == ensembl_gene_id)) %>%
      left_join(geno1, by = join_by(refsnp_id == SNP_ID))
    geno2[,c(1:3,5:7,19:20)]

    ##      refsnp_id chr_name chrom_start cds_start external_gene_name Allele
    ## 1       rs5120       19    44948363        NA              APOC2    A/t
    ## 2       rs5157       19    44943904        NA              APOC4    C/t
    ## 3       rs5158       19    44943921        NA              APOC4    C/t
    ## 4       rs5167       19    44945208       287              APOC4    T/g
    ## 5       rs6857       19    44888997        NA            NECTIN2    C/t
    ## 6       rs6859       19    44878777        NA            NECTIN2    G/a
    ## 7       rs7026       19    44821259        NA               BCAM    C/t
    ## 8       rs7412       19    44908822       526               APOE    C/t
    ## 9       rs9193       19    44993045        NA             CLPTM1    C/t
    ## 10     rs10119       19    44903416        NA             TOMM40    C/t
    ## 11    rs157580       19    44892009        NA             TOMM40    A/g
    ## 12    rs157581       19    44892457       339             TOMM40    T/c
    ## 13    rs157582       19    44892962        NA             TOMM40    C/t
    ## 14    rs157583       19    44893416        NA             TOMM40    G/t
    ## 15    rs157584       19    44893642        NA             TOMM40    T/c
    ## 16    rs157585       19    44894255        NA             TOMM40    A/c
    ## 17    rs157587       19    44894949        NA             TOMM40    A/g
    ## 18    rs157588       19    44895007        NA             TOMM40    C/t
    ## 19    rs157590       19    44895459        NA             TOMM40    A/c
    ## 20    rs204465       19    44989053        NA             CLPTM1    T/c
    ## 21    rs204467       19    44987916        NA             CLPTM1    C/t
    ## 22    rs204469       19    44987027        NA             CLPTM1    G/a
    ## 23    rs204470       19    44985727        NA             CLPTM1    G/a
    ## 24    rs204471       19    44985309        NA             CLPTM1    C/t
    ## 25    rs204472       19    44985176        NA             CLPTM1    G/a
    ## 26    rs204476       19    44979708        NA             CLPTM1    C/a
    ## 27    rs204477       19    44978944        NA             CLPTM1    G/a
    ## 28    rs204478       19    44976194        NA             CLPTM1    A/t
    ## 29    rs204479       19    44974694        NA             CLPTM1    C/t
    ## 30    rs204481       19    44973165       264             CLPTM1    C/t
    ## 31    rs204905       19    44957507        NA             CLPTM1    T/c
    ## 32    rs204907       19    44958739        NA             CLPTM1    T/c
    ## 33    rs204911       19    44960283        NA             CLPTM1    T/a
    ## 34    rs205909       19    44897518        NA             TOMM40    T/g
    ## 35    rs741780       19    44901174        NA             TOMM40    T/c
    ## 36    rs760114       19    44961706        NA             CLPTM1    T/c
    ## 37    rs760136       19    44900601        NA             TOMM40    A/g
    ## 38    rs769446       19    44905371        NA               <NA>    T/c
    ## 39    rs769450       19    44907187        NA               APOE    G/a
    ## 40    rs875255       19    44990377        NA             CLPTM1    C/t
    ## 41    rs892101       19    44952201        NA               <NA>    G/a
    ## 42    rs909134       19    44989803        NA             CLPTM1    T/g
    ## 43    rs922387       19    44808857        NA               <NA>    G/a
    ## 44    rs936517       19    44813151        NA               BCAM    G/t
    ## 45   rs1001611       19    44843511        NA               <NA>    G/a
    ## 46   rs1038025       19    44901715        NA             TOMM40    T/c
    ## 47   rs1038026       19    44901805        NA             TOMM40    A/g
    ## 48   rs1132899       19    44944779       107              APOC4    C/t
    ## 49   rs1160983       19    44893972       549             TOMM40    G/a
    ## 50   rs1160985       19    44900155        NA             TOMM40    C/t
    ## 51   rs1305062       19    44902264        NA             TOMM40    G/c
    ## 52   rs1531516       19    44850004        NA            NECTIN2    G/c
    ## 53   rs3760625       19    44953684        NA               <NA>    G/a
    ## 54   rs3760627       19    44953923        NA               <NA>    T/c
    ## 55   rs3760629       19    44954889        NA               <NA>    A/c
    ## 56   rs3786502       19    44847570        NA            NECTIN2    G/a
    ## 57   rs3786505       19    44987312       927             CLPTM1    A/g
    ## 58   rs3810141       19    44813547       711               BCAM    C/t
    ## 59   rs3810143       19    44846145        NA               <NA>    T/c
    ## 60   rs3837923       19    44876310        NA            NECTIN2    T/g
    ## 61   rs3852859       19    44876052        NA            NECTIN2    T/c
    ## 62   rs3852860       19    44879709        NA            NECTIN2    T/c
    ## 63   rs3852861       19    44879804        NA            NECTIN2    T/g
    ## 64   rs3859419       19    44989875        NA             CLPTM1    C/g
    ## 65   rs3865427       19    44877704        NA            NECTIN2    C/a
    ## 66   rs4263041       19    44935386        NA               <NA>    G/a
    ## 67   rs2927466       19    44855891        NA            NECTIN2    C/g
    ## 68   rs2927472       19    44846112        NA               <NA>    C/t
    ## 69   rs2927477       19    44810458        NA               BCAM    T/c
    ## 70   rs2927478       19    44808266        NA               <NA>    C/t
    ## 71   rs2927479       19    44806629        NA               <NA>    C/a
    ## 72   rs2927480       19    44834128        NA               <NA>    G/c
    ## 73   rs2927481       19    44833992        NA               <NA>    C/a
    ## 74   rs2927482       19    44836881        NA               <NA>    G/a
    ## 75   rs2967671       19    44808779        NA               <NA>    C/g
    ## 76   rs2972557       19    44857316        NA            NECTIN2    A/g
    ## 77   rs2972566       19    44850981        NA            NECTIN2    C/g
    ## 78   rs2972569       19    44848634        NA            NECTIN2    T/c
    ## 79   rs3112438       19    44856313        NA            NECTIN2    A/g
    ## 80   rs3112439       19    44864715        NA            NECTIN2    C/g
    ## 81   rs3729640       19    44878660        NA            NECTIN2    C/t
    ## 82   rs1871045       19    44823511        NA               <NA>    C/t
    ## 83   rs1871046       19    44848680        NA            NECTIN2    A/g
    ## 84   rs1871047       19    44848489        NA            NECTIN2    A/g
    ## 85   rs1882752       19    44958085        NA             CLPTM1    G/c
    ## 86   rs1903833       19    44792828        NA               CBLC    C/t
    ## 87   rs1985096       19    44843294        NA               <NA>    A/t
    ## 88   rs2075618       19    44992410        NA             CLPTM1    G/c
    ## 89   rs2075620       19    44976780        NA             CLPTM1    A/g
    ## 90   rs2075642       19    44874210        NA            NECTIN2    G/a
    ## 91   rs2075649       19    44892073        NA             TOMM40    A/g
    ## 92   rs2075650       19    44892362        NA             TOMM40    A/g
    ## 93   rs2239375       19    44956594        NA             CLPTM1    T/c
    ## 94   rs2288911       19    44946027        NA               <NA>    C/a
    ## 95   rs2288912       19    44945942        NA               <NA>    G/c
    ## 96   rs2293755       19    44973400        NA             CLPTM1    C/g
    ## 97   rs2306149       19    44846706        NA            NECTIN2    C/a
    ## 98   rs8100236       19    44962887        NA             CLPTM1    T/c
    ## 99   rs8101274       19    44813933        NA               BCAM    G/a
    ## 100  rs8104483       19    44869097        NA            NECTIN2    T/g
    ## 101  rs8111069       19    44980181        NA             CLPTM1    A/c
    ## 102  rs2436474       19    44859012        NA            NECTIN2    G/t
    ## 103  rs6509172       19    44822134        NA               <NA>    C/t
    ## 104 rs11549721       19    44846542        17            NECTIN2    T/g
    ## 105  rs7254892       19    44886339        NA            NECTIN2    G/a
    ## 106  rs7256173       19    44904398        NA               <NA>    C/t
    ## 107  rs7256200       19    44912678        NA               <NA>    G/t
    ## 108  rs7256684       19    44948185        NA              APOC2    A/g
    ## 109  rs7257468       19    44949887        NA               <NA>    C/t
    ## 110  rs7257916       19    44979627        NA             CLPTM1    T/c
    ## 111  rs7258345       19    44949894        NA               <NA>    T/g
    ## 112  rs7259004       19    44929300        NA               <NA>    G/c
    ## 113  rs7259620       19    44904531        NA               <NA>    G/a
    ## 114  rs7507450       19    44880647        NA            NECTIN2    G/c
    ## 115   rs283809       19    44883800        NA            NECTIN2    A/g
    ## 116   rs283813       19    44885917        NA            NECTIN2    T/a
    ## 117   rs369599       19    44876079        NA            NECTIN2    T/c
    ## 118   rs370705       19    44876381        NA            NECTIN2    T/c
    ## 119   rs377702       19    44859410        NA            NECTIN2    G/a
    ## 120  rs4420638       19    44919689        NA               <NA>    A/g
    ## 121  rs4452060       19    44844654        NA               <NA>    C/a
    ## 122  rs4599021       19    44839051        NA               <NA>    G/a
    ## 123  rs4802240       19    44849547        NA            NECTIN2    C/t
    ## 124  rs4803759       19    44824202        NA               <NA>    C/t
    ## 125  rs4803760       19    44830577        NA               <NA>    C/t
    ## 126  rs4803765       19    44855191        NA            NECTIN2    G/t
    ## 127  rs4803766       19    44867911        NA            NECTIN2    G/a
    ## 128  rs4803767       19    44869702        NA            NECTIN2    C/t
    ## 129  rs4803770       19    44924096        NA               <NA>    C/g
    ## 130  rs4803774       19    44947615        NA              APOC2    A/g
    ## 131  rs4803779       19    44953240        NA               <NA>    T/c
    ## 132  rs4803780       19    44953371        NA               <NA>    C/t
    ## 133  rs4803781       19    44956414        NA             CLPTM1    G/a
    ## 134  rs4803783       19    44967201        NA             CLPTM1    G/c
    ## 135   rs384973       19    44860534        NA            NECTIN2    T/g
    ## 136   rs385982       19    44876425        NA            NECTIN2    C/a
    ## 137   rs387465       19    44869610        NA            NECTIN2    A/g
    ## 138   rs394221       19    44865167        NA            NECTIN2    C/t
    ## 139   rs394819       19    44901322        NA             TOMM40    G/t
    ## 140   rs395908       19    44870308        NA            NECTIN2    G/a
    ## 141   rs405509       19    44905579        NA               <NA>    T/g
    ## 142   rs405697       19    44901434        NA             TOMM40    G/a
    ## 143   rs412776       19    44876259        NA            NECTIN2    G/a
    ## 144   rs416041       19    44867597        NA            NECTIN2    T/c
    ## 145   rs417357       19    44899862        NA             TOMM40    C/t
    ## 146   rs419010       19    44865063        NA            NECTIN2    A/g
    ## 147   rs419925       19    44876869        NA            NECTIN2    C/g
    ## 148   rs421812       19    44877288        NA            NECTIN2    T/g
    ## 149   rs429358       19    44908684       388               APOE    T/c
    ## 150   rs434132       19    44904463        NA               <NA>    C/g
    ## 151   rs440277       19    44857967        NA            NECTIN2    G/a
    ## 152   rs440446       19    44905910        NA               APOE    C/g
    ## 153   rs445925       19    44912383        NA               <NA>    G/a
    ## 154   rs446037       19    44904180        NA               <NA>    G/t
    ## 155   rs449647       19    44905307        NA               <NA>    A/t
    ## 156   rs454050       19    44859552        NA            NECTIN2    C/a
    ## 157   rs483082       19    44912921        NA               <NA>    G/t
    ## 158   rs510297       19    44867416        NA            NECTIN2    A/c
    ## 159   rs519113       19    44873027        NA            NECTIN2    C/g
    ## 160   rs519825       19    44863522        NA            NECTIN2    T/c
    ## 161   rs520283       19    44864825        NA            NECTIN2    G/t
    ## 162   rs521629       19    44863346        NA            NECTIN2    C/t
    ## 163   rs564724       19    44867392        NA            NECTIN2    C/t
    ## 164   rs584007       19    44913221        NA               <NA>    G/a
    ## 165  rs7246900       19    44950979        NA               <NA>    G/a
    ## 166  rs7247227       19    44951502        NA               <NA>    A/g
    ## 167  rs7247551       19    44951509        NA               <NA>    A/g
    ## 168  rs7248162       19    44951429        NA               <NA>    T/c
    ## 169  rs7249750       19    44811510        NA               BCAM    C/t
    ## 170  rs7251501       19    44952449        NA               <NA>    C/t
    ## 171  rs7251503       19    44952458        NA               <NA>    C/g
    ##          p_value        OR
    ## 1   1.171880e-01 0.8775920
    ## 2   7.164393e-01 0.9692655
    ## 3   6.689152e-01 0.9352566
    ## 4   8.299105e-01 1.0173966
    ## 5   7.875293e-07 1.6797133
    ## 6   2.434657e-01 1.1002107
    ## 7   6.154045e-01 1.0429190
    ## 8   3.868308e-01 1.1925409
    ## 9   7.981391e-01 1.0487364
    ## 10  3.624230e-26 2.7701417
    ## 11  6.905743e-09 0.6227585
    ## 12  6.311771e-12 1.8106623
    ## 13  1.867751e-15 2.0271814
    ## 14  2.700273e-07 2.8523166
    ## 15  4.893578e-01 1.0624101
    ## 16  5.402473e-01 1.0545994
    ## 17  9.677055e-07 2.6824645
    ## 18  9.272804e-01 1.0080151
    ## 19  3.874697e-01 0.9276397
    ## 20  7.982441e-01 0.9718698
    ## 21  7.681771e-01 0.9762479
    ## 22  6.728104e-02 0.8123920
    ## 23  4.805715e-01 0.9237218
    ## 24  8.861485e-01 0.9842280
    ## 25  9.774733e-02 1.2031043
    ## 26  7.591601e-01 1.0351824
    ## 27  6.751980e-01 1.0483026
    ## 28  1.524298e-01 0.7821386
    ## 29  4.805715e-01 0.9237218
    ## 30  4.805715e-01 0.9237218
    ## 31  9.335794e-01 0.9931162
    ## 32  7.982441e-01 0.9718698
    ## 33  2.740998e-01 1.1302457
    ## 34  5.431905e-08 2.9597302
    ## 35  1.306707e-04 0.7008097
    ## 36  4.184769e-01 1.1599770
    ## 37  1.031147e-04 0.6961468
    ## 38  2.284433e-04 0.4131072
    ## 39  5.177349e-02 0.8242311
    ## 40  3.342560e-01 0.9231743
    ## 41  6.975956e-01 1.0316988
    ## 42  2.764850e-01 1.0919656
    ## 43  4.807186e-01 0.9134453
    ## 44  7.548532e-01 0.9686710
    ## 45  2.595324e-01 0.8884101
    ## 46  5.764852e-01 0.9507467
    ## 47  5.617323e-01 0.9482732
    ## 48  8.781094e-01 1.0133353
    ## 49  4.682875e-05 0.4274581
    ## 50  2.122194e-04 0.7093648
    ## 51  6.257811e-03 0.7611005
    ## 52  3.584414e-01 0.9082417
    ## 53  3.283843e-01 0.9244990
    ## 54  4.368082e-01 1.0644768
    ## 55  9.409910e-02 1.1439429
    ## 56  6.284813e-01 1.1203703
    ## 57  7.188365e-01 1.0295542
    ## 58  4.411842e-01 0.8003143
    ## 59  9.109616e-01 1.0108242
    ## 60  3.208826e-01 0.9049394
    ## 61  6.428681e-01 0.9478384
    ## 62  1.334744e-11 1.8008679
    ## 63  6.989228e-12 1.8088092
    ## 64  6.298125e-01 0.9153125
    ## 65  5.273304e-09 1.7802466
    ## 66  1.613510e-01 1.1448293
    ## 67  3.560538e-01 0.8546337
    ## 68  9.014249e-01 0.9898989
    ## 69  1.821804e-01 0.8517856
    ## 70  6.481734e-01 0.8990129
    ## 71  3.324127e-02 1.6374365
    ## 72  7.188579e-02 0.8389251
    ## 73  5.898290e-01 0.9491105
    ## 74  7.791775e-01 0.9774738
    ## 75  3.373987e-01 1.3141676
    ## 76  5.711899e-01 0.9270292
    ## 77  6.468866e-01 0.9632869
    ## 78  7.900616e-01 0.9786318
    ## 79  7.928324e-01 1.0458409
    ## 80  6.782737e-01 0.9325415
    ## 81  3.849630e-01 1.1022857
    ## 82  8.020540e-01 0.9792881
    ## 83  8.985839e-01 1.0135545
    ## 84  8.614627e-02 1.1717263
    ## 85  5.546722e-01 0.9532188
    ## 86  8.469904e-01 1.0252898
    ## 87  7.108809e-01 1.0306239
    ## 88  3.417033e-01 1.0801094
    ## 89  9.172018e-01 0.9916412
    ## 90  3.544416e-01 1.1127682
    ## 91  9.502103e-01 0.9942665
    ## 92  1.234457e-01 0.8533459
    ## 93  3.697061e-01 0.9304864
    ## 94  9.145942e-01 1.0091113
    ## 95  1.319495e-01 1.1340350
    ## 96  1.879707e-01 1.1406755
    ## 97  3.584414e-01 0.9082417
    ## 98  8.827219e-01 1.0119118
    ## 99  2.230905e-01 0.8544308
    ## 100 8.228398e-02 0.8161262
    ## 101 5.412219e-01 0.9517812
    ## 102 8.305846e-01 1.0324819
    ## 103 9.122271e-01 1.0091906
    ## 104 9.109616e-01 1.0108242
    ## 105 3.617102e-02 1.5269379
    ## 106 3.621022e-02 2.3245675
    ## 107 2.736456e-22 3.3011799
    ## 108 6.781954e-01 0.9672372
    ## 109 1.801243e-01 1.1137236
    ## 110 8.015414e-01 1.0212586
    ## 111 5.546588e-02 1.1663230
    ## 112 4.704955e-01 1.0723820
    ## 113 2.535552e-04 0.7109950
    ## 114 4.143310e-01 1.0836489
    ## 115 6.131572e-01 1.0700816
    ## 116 5.175361e-01 1.0949171
    ## 117 9.909228e-01 1.0012483
    ## 118 9.290617e-01 0.9912472
    ## 119 2.704036e-01 1.1759164
    ## 120 3.781974e-27 3.2685311
    ## 121 8.615276e-01 0.9836045
    ## 122 8.575736e-02 1.1871363
    ## 123 8.985839e-01 1.0135545
    ## 124 4.420778e-01 0.9393683
    ## 125 6.359781e-01 0.9619628
    ## 126 2.245123e-01 0.8642467
    ## 127 9.160570e-08 1.5478217
    ## 128 4.178252e-01 1.0980774
    ## 129 5.936929e-02 1.1994172
    ## 130 5.828221e-01 1.0450994
    ## 131 6.391285e-01 1.0383774
    ## 132 3.195167e-03 1.2675114
    ## 133 5.828221e-01 1.0450994
    ## 134 3.069051e-01 1.0866176
    ## 135 9.474403e-01 1.0101664
    ## 136 7.719463e-01 0.9714320
    ## 137 4.579500e-01 0.8896562
    ## 138 2.036983e-04 0.7328463
    ## 139 2.758668e-07 2.8177679
    ## 140 9.243542e-13 1.8989034
    ## 141 2.332667e-01 0.8975279
    ## 142 2.902822e-09 1.6202317
    ## 143 1.806923e-14 2.0300482
    ## 144 7.868968e-01 0.9587980
    ## 145 5.727898e-08 3.2489713
    ## 146 2.100232e-04 1.3501829
    ## 147 4.729561e-01 1.0732224
    ## 148 8.050280e-02 0.8407601
    ## 149 4.319038e-34 3.8341749
    ## 150 9.640473e-08 2.9422478
    ## 151 3.319018e-01 0.8656346
    ## 152 7.672697e-12 1.7747814
    ## 153 5.001652e-01 0.9049876
    ## 154 1.454495e-07 2.8445559
    ## 155 2.142559e-05 2.2197856
    ## 156 9.099927e-01 0.9828553
    ## 157 9.578138e-20 2.4903902
    ## 158 1.443177e-01 1.2553936
    ## 159 3.767796e-13 1.9292401
    ## 160 8.305846e-01 1.0324819
    ## 161 3.236307e-03 0.6177597
    ## 162 3.400314e-01 1.1508304
    ## 163 8.402751e-01 1.0325690
    ## 164 4.439527e-08 1.5638358
    ## 165 4.615330e-01 0.9425480
    ## 166 8.144603e-02 1.1502984
    ## 167 1.522972e-02 1.2243947
    ## 168 8.619610e-01 0.9861405
    ## 169 2.898516e-01 0.7337796
    ## 170 6.483850e-01 1.0373248
    ## 171 3.283843e-01 0.9244990

## Plot

Plot the odds ratios and p-values in a volcano plot. Notice that common
alleles cluster towards the pit: common polymorphisms tend to be
neutral. Notice that rare alleles barely reach statistical significance.
GWAS of unrelated individuals do not have the power to detect very rare
alleles with large effect. These very rare alleles may collectively
explain an important part of the Alzheimer ‘missing heritability’.

    ggplot(geno1, aes(x=log2(OR), y=-log10(p_value), colour=MAF)) + 
      geom_point(alpha=0.4, size=3.5) +
      scale_colour_gradient(low = "red", high = "yellow") +
      scale_x_continuous(limits=c(-2,2)) +
      scale_y_continuous(limits=c(0, 40), expand = c(0, 0)) +
      theme_bw() +
      geom_hline(yintercept=-log10(0.0003), linetype="dashed")

![](load_assoc_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Export a table of p-values ordered by chromosomal position.

    zoom <- geno2 %>% dplyr::select(chr_name,chrom_start,p_value) %>% dplyr::arrange(chrom_start)
    write_tsv(zoom, "zoom2.txt")
    zoom

    ##     chr_name chrom_start      p_value
    ## 1         19    44792828 8.469904e-01
    ## 2         19    44806629 3.324127e-02
    ## 3         19    44808266 6.481734e-01
    ## 4         19    44808779 3.373987e-01
    ## 5         19    44808857 4.807186e-01
    ## 6         19    44810458 1.821804e-01
    ## 7         19    44811510 2.898516e-01
    ## 8         19    44813151 7.548532e-01
    ## 9         19    44813547 4.411842e-01
    ## 10        19    44813933 2.230905e-01
    ## 11        19    44821259 6.154045e-01
    ## 12        19    44822134 9.122271e-01
    ## 13        19    44823511 8.020540e-01
    ## 14        19    44824202 4.420778e-01
    ## 15        19    44830577 6.359781e-01
    ## 16        19    44833992 5.898290e-01
    ## 17        19    44834128 7.188579e-02
    ## 18        19    44836881 7.791775e-01
    ## 19        19    44839051 8.575736e-02
    ## 20        19    44843294 7.108809e-01
    ## 21        19    44843511 2.595324e-01
    ## 22        19    44844654 8.615276e-01
    ## 23        19    44846112 9.014249e-01
    ## 24        19    44846145 9.109616e-01
    ## 25        19    44846542 9.109616e-01
    ## 26        19    44846706 3.584414e-01
    ## 27        19    44847570 6.284813e-01
    ## 28        19    44848489 8.614627e-02
    ## 29        19    44848634 7.900616e-01
    ## 30        19    44848680 8.985839e-01
    ## 31        19    44849547 8.985839e-01
    ## 32        19    44850004 3.584414e-01
    ## 33        19    44850981 6.468866e-01
    ## 34        19    44855191 2.245123e-01
    ## 35        19    44855891 3.560538e-01
    ## 36        19    44856313 7.928324e-01
    ## 37        19    44857316 5.711899e-01
    ## 38        19    44857967 3.319018e-01
    ## 39        19    44859012 8.305846e-01
    ## 40        19    44859410 2.704036e-01
    ## 41        19    44859552 9.099927e-01
    ## 42        19    44860534 9.474403e-01
    ## 43        19    44863346 3.400314e-01
    ## 44        19    44863522 8.305846e-01
    ## 45        19    44864715 6.782737e-01
    ## 46        19    44864825 3.236307e-03
    ## 47        19    44865063 2.100232e-04
    ## 48        19    44865167 2.036983e-04
    ## 49        19    44867392 8.402751e-01
    ## 50        19    44867416 1.443177e-01
    ## 51        19    44867597 7.868968e-01
    ## 52        19    44867911 9.160570e-08
    ## 53        19    44869097 8.228398e-02
    ## 54        19    44869610 4.579500e-01
    ## 55        19    44869702 4.178252e-01
    ## 56        19    44870308 9.243542e-13
    ## 57        19    44873027 3.767796e-13
    ## 58        19    44874210 3.544416e-01
    ## 59        19    44876052 6.428681e-01
    ## 60        19    44876079 9.909228e-01
    ## 61        19    44876259 1.806923e-14
    ## 62        19    44876310 3.208826e-01
    ## 63        19    44876381 9.290617e-01
    ## 64        19    44876425 7.719463e-01
    ## 65        19    44876869 4.729561e-01
    ## 66        19    44877288 8.050280e-02
    ## 67        19    44877704 5.273304e-09
    ## 68        19    44878660 3.849630e-01
    ## 69        19    44878777 2.434657e-01
    ## 70        19    44879709 1.334744e-11
    ## 71        19    44879804 6.989228e-12
    ## 72        19    44880647 4.143310e-01
    ## 73        19    44883800 6.131572e-01
    ## 74        19    44885917 5.175361e-01
    ## 75        19    44886339 3.617102e-02
    ## 76        19    44888997 7.875293e-07
    ## 77        19    44892009 6.905743e-09
    ## 78        19    44892073 9.502103e-01
    ## 79        19    44892362 1.234457e-01
    ## 80        19    44892457 6.311771e-12
    ## 81        19    44892962 1.867751e-15
    ## 82        19    44893416 2.700273e-07
    ## 83        19    44893642 4.893578e-01
    ## 84        19    44893972 4.682875e-05
    ## 85        19    44894255 5.402473e-01
    ## 86        19    44894949 9.677055e-07
    ## 87        19    44895007 9.272804e-01
    ## 88        19    44895459 3.874697e-01
    ## 89        19    44897518 5.431905e-08
    ## 90        19    44899862 5.727898e-08
    ## 91        19    44900155 2.122194e-04
    ## 92        19    44900601 1.031147e-04
    ## 93        19    44901174 1.306707e-04
    ## 94        19    44901322 2.758668e-07
    ## 95        19    44901434 2.902822e-09
    ## 96        19    44901715 5.764852e-01
    ## 97        19    44901805 5.617323e-01
    ## 98        19    44902264 6.257811e-03
    ## 99        19    44903416 3.624230e-26
    ## 100       19    44904180 1.454495e-07
    ## 101       19    44904398 3.621022e-02
    ## 102       19    44904463 9.640473e-08
    ## 103       19    44904531 2.535552e-04
    ## 104       19    44905307 2.142559e-05
    ## 105       19    44905371 2.284433e-04
    ## 106       19    44905579 2.332667e-01
    ## 107       19    44905910 7.672697e-12
    ## 108       19    44907187 5.177349e-02
    ## 109       19    44908684 4.319038e-34
    ## 110       19    44908822 3.868308e-01
    ## 111       19    44912383 5.001652e-01
    ## 112       19    44912678 2.736456e-22
    ## 113       19    44912921 9.578138e-20
    ## 114       19    44913221 4.439527e-08
    ## 115       19    44919689 3.781974e-27
    ## 116       19    44924096 5.936929e-02
    ## 117       19    44929300 4.704955e-01
    ## 118       19    44935386 1.613510e-01
    ## 119       19    44943904 7.164393e-01
    ## 120       19    44943921 6.689152e-01
    ## 121       19    44944779 8.781094e-01
    ## 122       19    44945208 8.299105e-01
    ## 123       19    44945942 1.319495e-01
    ## 124       19    44946027 9.145942e-01
    ## 125       19    44947615 5.828221e-01
    ## 126       19    44948185 6.781954e-01
    ## 127       19    44948363 1.171880e-01
    ## 128       19    44949887 1.801243e-01
    ## 129       19    44949894 5.546588e-02
    ## 130       19    44950979 4.615330e-01
    ## 131       19    44951429 8.619610e-01
    ## 132       19    44951502 8.144603e-02
    ## 133       19    44951509 1.522972e-02
    ## 134       19    44952201 6.975956e-01
    ## 135       19    44952449 6.483850e-01
    ## 136       19    44952458 3.283843e-01
    ## 137       19    44953240 6.391285e-01
    ## 138       19    44953371 3.195167e-03
    ## 139       19    44953684 3.283843e-01
    ## 140       19    44953923 4.368082e-01
    ## 141       19    44954889 9.409910e-02
    ## 142       19    44956414 5.828221e-01
    ## 143       19    44956594 3.697061e-01
    ## 144       19    44957507 9.335794e-01
    ## 145       19    44958085 5.546722e-01
    ## 146       19    44958739 7.982441e-01
    ## 147       19    44960283 2.740998e-01
    ## 148       19    44961706 4.184769e-01
    ## 149       19    44962887 8.827219e-01
    ## 150       19    44967201 3.069051e-01
    ## 151       19    44973165 4.805715e-01
    ## 152       19    44973400 1.879707e-01
    ## 153       19    44974694 4.805715e-01
    ## 154       19    44976194 1.524298e-01
    ## 155       19    44976780 9.172018e-01
    ## 156       19    44978944 6.751980e-01
    ## 157       19    44979627 8.015414e-01
    ## 158       19    44979708 7.591601e-01
    ## 159       19    44980181 5.412219e-01
    ## 160       19    44985176 9.774733e-02
    ## 161       19    44985309 8.861485e-01
    ## 162       19    44985727 4.805715e-01
    ## 163       19    44987027 6.728104e-02
    ## 164       19    44987312 7.188365e-01
    ## 165       19    44987916 7.681771e-01
    ## 166       19    44989053 7.982441e-01
    ## 167       19    44989803 2.764850e-01
    ## 168       19    44989875 6.298125e-01
    ## 169       19    44990377 3.342560e-01
    ## 170       19    44992410 3.417033e-01
    ## 171       19    44993045 7.981391e-01

By uploading the table to [LocusZoom](http://locuszoom.org/), create a
regional Manhattan plot. Note that the statistically significant
associations around the E4 allele fall between two recombination
hotspots.

![](locuszoom.png)
