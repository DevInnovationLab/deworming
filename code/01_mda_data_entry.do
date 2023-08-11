**# Create blank data **********************************************************

clear
set obs 34
gen trial=""
label var trial "Trial name"
gen doses=.
label var doses "Number of doses given prior to endline"
gen drug=""
label var drug "Deworming drug diven at each dosage"
gen lengthfu=.
label var lengthfu "Longest length of follow-up (months)"


gen peweight=.
label var peweight "Point estimate of deworming on child weight (kg)"
gen seweight=.
label var seweight "S.E. of the effect of deworming on child weight (kg)"
gen nweightt=.
label var nweightt "Number of observations in treatment group for weight analysis"
gen nweightc=.
label var nweightc "Number of observations in control group for weight analysis"
gen peheight=.
label var peheight "Point estimate of deworming on child height (cm)"
gen seheight=.
label var seheight "S.E. of the effect of deworming on child height (cm)"
gen nheightt=.
label var nheightt "Number of observations in treatment group for height analysis"
gen nheightc=.
label var nheightc "Number of observations in control group for height analysis"
gen pemuac=.
label var pemuac "Point estimate of deworming on MUAC (cm)"
gen semuac=.
label var semuac "S.E. of the effect of deworming on MUAC (cm)"
gen nmuact=.
label var nmuact "Number of observations in treatment group for MUAC analysis"
gen nmuacc=.
label var nmuacc "Number of observations in control group for MUAC analysis"
gen pehemob=.
label var pehemob "Point estimate of deworming on hemoglobin (g/dl)"
gen sehemob=.
label var sehemob "S.E. of the effect of deworming on hemoglobin (g/dl)"
gen nhemobt=.
label var nhemobt "Number of observations in treatment group for hemoglobin analysis"
gen nhemobc=.
label var nhemobc "Number of observations in control group for hemoglobin analysis"


gen peweight_c=.
label var peweight_c "Point estimate of deworming on child weight (kg) from TMSDG"
gen seweight_c=.
label var seweight_c "S.E. of the effect of deworming on child weight (kg) from TMSDG"
gen nweightt_c=.
label var nweightt_c "Number of observations in treatment group for weight analysis from TMSDG"
gen nweightc_c=.
label var nweightc_c "Number of observations in control group for weight analysis from TMSDG"
gen peheight_c=.
label var peheight_c "Point estimate of deworming on child height (cm) from TMSDG"
gen seheight_c=.
label var seheight_c "S.E. of the effect of deworming on child height (cm) from TMSDG"
gen nheightt_c=.
label var nheightt_c "Number of observations in treatment group for height analysis from TMSDG"
gen nheightc_c=.
label var nheightc_c "Number of observations in control group for height analysis from TMSDG"
gen pemuac_c=.
label var pemuac_c "Point estimate of deworming on MUAC (cm) from TMSDG"
gen semuac_c=.
label var semuac_c "S.E. of the effect of deworming on MUAC (cm) from TMSDG"
gen nmuact_c=.
label var nmuact_c "Number of observations in treatment group for MUAC analysis from TMSDG"
gen nmuacc_c=.
label var nmuacc_c "Number of observations in control group for MUAC analysis from TMSDG"
gen pehemob_c=.
label var pehemob_c "Point estimate of deworming on hemoglobin (g/dl) from TMSDG"
gen sehemob_c=.
label var sehemob_c "S.E. of the effect of deworming on hemoglobin (g/dl) from TMSDG"
gen nhemobt_c=.
label var nhemobt_c "Number of observations in treatment group for hemoglobin analysis from TMSDG"
gen nhemobc_c=.
label var nhemobc_c "Number of observations in control group for hemoglobin analysis from TMSDG"


gen peweight_c2=.
label var peweight_c2 "Point estimate of deworming on child weight (kg) from TMDCG"
gen seweight_c2=.
label var seweight_c2 "S.E. of the effect of deworming on child weight (kg) from TMDCG"
gen nweightt_c2=.
label var nweightt_c2 "Number of observations in treatment group for weight analysis from TMDCG"
gen nweightc_c2=.
label var nweightc_c2 "Number of observations in control group for weight analysis from TMDCG"
gen peheight_c2=.
label var peheight_c2 "Point estimate of deworming on child height (cm) from TMDCG"
gen seheight_c2=.
label var seheight_c2 "S.E. of the effect of deworming on child height (cm) from TMDCG"
gen nheightt_c2=.
label var nheightt_c2 "Number of observations in treatment group for height analysis from TMDCG"
gen nheightc_c2=.
label var nheightc_c2 "Number of observations in control group for height analysis from TMDCG"
gen pemuac_c2=.
label var pemuac_c2 "Point estimate of deworming on MUAC (cm) from TMDCG"
gen semuac_c2=.
label var semuac_c2 "S.E. of the effect of deworming on MUAC (cm) from TMDCG"
gen nmuact_c2=.
label var nmuact_c2 "Number of observations in treatment group for MUAC analysis from TMDCG"
gen nmuacc_c2=.
label var nmuacc_c2 "Number of observations in control group for MUAC analysis from TMDCG"
gen pehemob_c2=.
label var pehemob_c2 "Point estimate of deworming on hemoglobin (g/dl) from TMDCG"
gen sehemob_c2=.
label var sehemob_c2 "S.E. of the effect of deworming on hemoglobin (g/dl) from TMDCG"
gen nhemobt_c2=.
label var nhemobt_c2 "Number of observations in treatment group for hemoglobin analysis from TMDCG"
gen nhemobc_c2=.
label var nhemobc_c2 "Number of observations in control group for hemoglobin analysis from TMDCG"

gen tweight=.
label var tweight "Type of estimate for weight" /*1 diff-in-diff, 2 endline-comparison, 3 ANCOVA*/
gen theight=.
label var theight "Type of estimate for height" /*1 diff-in-diff, 2 endline-comparison, 3 ANCOVA*/
gen tmuac=.
label var tmuac "Type of estimate for MUAC" /*1 diff-in-diff, 2 endline-comparison, 3 ANCOVA*/
gen themob=.
label var themob "Type of estimate for hemoglobin" /*1 diff-in-diff, 2 endline-comparison, 3 ANCOVA*/
gen notes=""
gen prevalence=""
label var prevalence "Worm infection prevalence"
label define estimates 1 "diff-in-diff" 2 "endline comparison" 3 "ANCOVA"
label values tweight estimates
label values theight estimates
label values tmuac estimates
label values themob estimates

gen flag_sd=.
label var flag_sd "Unconditional sd of (at least one) dependent variable cannot be obtained from s.e."
gen name=""
label var name "Study name"
gen N=""
label var N "type of randomized units = n'var't + n'var'c"
gen country=""



**# Data extraction ************************************************************

**## Awasthi 1995/2008 =========================================================

replace trial="Awasthi 1995/2008" in 1 /*Clustered RCT: data was averaged prior to analysis*/
replace name="Awasthi et al. (2008)" in 1
replace N="clusters" in 1
replace country="India" in 1
replace doses=4 in 1 /*A fifth was given at the end, with last measurement.*/
replace drug="Albendazole 400mg" in 1
replace lengthfu=24 in 1

* From paper -------------------------------------------------------------------
replace peweight=3.76-2.78 in 1 /*Article and TMSDG agree 0.98*/
replace seweight=((0.12^2)+(0.09^2))^0.5 in 1 /*Based on article; TMSDG 0.148*/
replace nweightt=25 in 1 /*25 clusters. Based on article.*/
replace nweightc=25 in 1 /*25 clusters. Based on article.*/
replace peheight=0.7 in 1 /*Based on article; TMSDG 1.19 "height data from INCLEN 1995 monograph (references contained in the main reference)"*/
replace seheight=0.4 in 1 /*Based on article; TMSDG do not present s.e., but it can be obtained from s.d. data by group */
replace nheightt=25 in 1 /*25 clusters. Based on article.*/
replace nheightc=25 in 1 /*25 clusters. Based on article.*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.98 in 1 /*TMSDG*/
replace seweight_c=0.148 in 1 /*TMSDG*/
replace nweightt_c=25 in 1 /*TMSDG*/
replace nweightc_c=25 in 1 /*TMSDG*/
replace peheight_c=1.19 in 1 /*TMSDG*/
replace seheight_c=((4^2)/25+(4.5^2)/25)^0.5 in 1 /*TMSDG*/
replace nheightt_c=25 in 1 /*TMSDG*/
replace nheightc_c=25 in 1 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.98 in 1 /*TMDCG*/
replace seweight_c2=0.148 in 1 /*TMDCG*/
replace nweightt_c2=25 in 1 /*TMDCG*/
replace nweightc_c2=25 in 1 /*TMDCG*/
replace peheight_c2=1.19 in 1 /*TMDCG*/
replace seheight_c2=((4^2)/25+(4.5^2)/25)^0.5 in 1 /*TMDCG*/
replace nheightt_c2=25 in 1 /*TMDCG*/
replace nheightc_c2=25 in 1 /*TMDCG*/

replace tweight=1 in 1
replace theight=1 in 1
replace notes="All unadjusted. TMSDG used more data for the height estimate than were reported in study article, we should use their height estimate." in 1
replace prevalence="<20" in 1 /*Study mentioned over 1/3 prevalence*/
replace flag_sd=0 in 1
*No WAZ, no HAZ in article.

**## Awasthi 2000 ==============================================================

replace trial="Awasthi 2000" in 2 /*Individual RCT*/
replace name="Awasthi, Pande and Fletcher (2000)" in 2
replace N="individuals" in 2
replace country="India" in 2
replace doses=4 in 2
replace drug="Albendazole 600mg" in 2
replace lengthfu=24 in 2

* Paper ------------------------------------------------------------------------
replace peweight=2.63-2.68 in 2 /*Based on article*/
replace seweight=((1.34^2)/601+(1.2^2)/444)^0.5 in 2 /*Based on article*/
replace nweightt=601 in 2 /*Based on article*/
replace nweightc=444 in 2 /*Based on article*/
replace peheight=9.94-10.35 in 2 /*Based on article*/
replace seheight=((4.9^2)/601+(5.1^2)/444)^0.5 in 2 /*Based on article*/
replace nheightt=601 in 2 /*Based on article*/
replace nheightc=444 in 2 /*Based on article*/
replace pehemob=9.67-9.67 in 2 /*Based on article*/
replace sehemob=((0.66^2)/601+(0.65^2)/444)^0.5 in 2 /*Based on article*/
replace nhemobt=601 in 2 /*Based on article*/
replace nhemobc=444 in 2 /*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=-0.05 in 2 /*TMSDG*/
replace seweight_c=0.076 in 2 /*TMSDG*/
replace nweightt_c=601 in 2 /*TMSDG*/
replace nweightc_c=444 in 2 /*TMSDG*/
replace peheight_c=-0.41 in 2 /*TMSDG*/
replace seheight_c=((4.9^2)/601+(5.1^2)/444)^0.5 in 2 /*TMSDG reported s.d. by treatment and control. When using this formula, I replicate the s.e. used in the analysis*/
replace nheightt_c=601 in 2 /*TMSDG*/
replace nheightc_c=444 in 2 /*TMSDG*/
replace pehemob_c=0 in 2 /*TMSDG*/
replace sehemob_c=((0.66^2)/444+(0.65^2)/601)^0.5 in 2 /*TMSDG: they have the s.d. wrong!*/
replace nhemobt_c=601 in 2 /*TMSDG*/
replace nhemobc_c=444 in 2 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=-0.05 in 2 /*TMDCG*/
replace seweight_c2=0.076 in 2 /*TMDCG*/
replace nweightt_c2=601 in 2 /*TMDCG*/
replace nweightc_c2=444 in 2 /*TMDCG*/
replace peheight_c2=-0.41 in 2 /*TMDCG*/
replace seheight_c2=((4.9^2)/601+(5.1^2)/444)^0.5 in 2 /*TMDCG reported s.d. by treatment and control. When using this formula, I replicate the s.e. used in the analysis*/
replace nheightt_c2=601 in 2 /*TMDCG*/
replace nheightc_c2=444 in 2 /*TMDCG*/
replace pehemob_c2=0 in 2 /*TMDCG*/
replace sehemob_c2=((0.66^2)/444+(0.65^2)/601)^0.5 in 2 /*TMDCG: they have the s.d. wrong!*/
replace nhemobt_c2=601 in 2 /*TMDCG*/
replace nhemobc_c2=444 in 2 /*TMDCG*/

replace tweight=1 in 2
replace theight=1 in 2
replace themob=2 in 2

replace notes="All unadjusted. s.e. for hemob from TMSDG is wrong." in 2
disp (48+76)/1061
replace prevalence="0.12" in 2
replace flag_sd=0 in 2
*There is data on propotion underweight, sunted, and wasted.


**## Awasthi 2001 ==============================================================
replace trial="Awasthi 2001" in 3 /*CLUSTER-RCT: Data averaged*/
replace name="Awasthi and Pande (2001)" in 3
replace N="clusters" in 3
replace country="India" in 3
replace doses=3 in 3
replace drug="Albendazole 400mg" in 3
replace lengthfu=18 in 3

* Paper ------------------------------------------------------------------------
replace peweight=3.22-3.05 in 3 /*Based on article*/
replace seweight=(3.22-3.05)/abs(invt(122,0.01/2)) in 3 /*Based on p-value from article, assuming that the data was averaged at the cluster level first (this has implications for DoF). TMSDG say that indeed the data was averaged.*/
replace nweightt=63 in 3 /*Based in article*/
replace nweightc=61 in 3 /*Based in article*/
	/*ANCOVA-like estimate
	replace peweight=0.13
	replace seweight=0.06 /*Not sure if this s.e. has been adjusted for clustering.*/
	*/
replace peheight=16.5-16.1 in 3 /*Based on article*/
replace seheight=(16.5-16.1)/abs(invt(122,0.2/2)) in 3 /*Based on p-value from article, assuming that the data was averaged atthe clsutered level first (this has implications for DoF.*/
replace nheightt=63 in 3 /*Based in article*/
replace nheightc=61 in 3 /*Based in article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.17 in 3 /*TMSDG*/
replace seweight_c=0.341 in 3 /*TMSDG*/
replace nweightt_c=63 in 3 /*TMSDG*/
replace nweightc_c=61 in 3 /*TMSDG*/
replace peheight_c=0.4 in 3 /*TMSDG*/
replace seheight_c=((6.51^2)/63+(6.48^2)/61)^0.5 in 3 /*TMSDG*/
replace nheightt_c=63 in 3 /*TMSDG*/
replace nheightc_c=61 in 3 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.17 in 3 /*TMDCG*/
replace seweight_c2=0.3175 in 3 /*TMDCG*/
replace nweightt_c2=63 in 3 /*TMDCG*/
replace nweightc_c2=61 in 3 /*TMDCG*/
replace peheight_c2=0.4 in 3 /*TMDCG*/
replace seheight_c2=((6.51^2)/63+(6.48^2)/61)^0.5 in 3 /*TMDCG*/
replace nheightt_c2=63 in 3 /*TMDCG*/
replace nheightc_c2=61 in 3 /*TMDCG*/

replace tweight=1 in 3
replace theight=1 in 3
replace notes="All unadjusted. I derive s.e. from p-values, to be consistent with authors' interpretation of results." in 3
disp (0.0816*988+0.0932*1022)/(988+1022)
replace prevalence="0.09" in 3
replace flag_sd=0 in 3
*There is data on WAZ and HAZ.


**## Donnen 1998 ===============================================================
replace trial="Donnen 1998" in 4 /*INIDVIDUAL RCT*/
replace name="Donnen et al. (1998)" in 4
replace N="individuals" in 4
replace country="Zaire" in 4
replace doses=4 in 4
replace drug="Mebendazole 500mg" in 4
replace lengthfu=12 in 4

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=-0.45 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace seweight_c=0.1665 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nweightt_c=100 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nweightc_c=98 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace peheight_c=-1.19 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace seheight_c=((3.56^2)/100+(4.18^2)/98)^0.5 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nheightt_c=100 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nheightc_c=98 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace pemuac_c=-0.35 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace semuac_c=((1^2)/100+(1.16^2)/98)^0.5 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nmuact_c=100 in 4 /*TMSDG unadjusted estimates obtained from authors*/
replace nmuacc_c=98 in 4 /*TMSDG unadjusted estimates obtained from authors*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=-0.45 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace seweight_c2=0.1665 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nweightt_c2=100 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nweightc_c2=98 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace peheight_c2=-1.19 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace seheight_c2=((3.56^2)/100+(4.18^2)/98)^0.5 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nheightt_c2=100 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nheightc_c2=98 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace pemuac_c2=-0.35 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace semuac_c2=((1^2)/100+(1.16^2)/98)^0.5 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nmuact_c2=100 in 4 /*TMDCG unadjusted estimates obtained from authors*/
replace nmuacc_c2=98 in 4 /*TMDCG unadjusted estimates obtained from authors*/

replace tweight=1 in 4
replace theight=1 in 4
replace tmuac=1 in 4
replace notes="The article presents adjusted estimates. TMSDG obtained unadjusted estimates from the authors." in 4	
disp (0.096*123+ 0.105*117)/(123+117)
replace prevalence="0.10" in 4
replace flag_sd=0 in 4
*There is no data on WAZ nor HAZ.


**## Dossa 2001a ===============================================================
replace trial="Dossa 2001a" in 5 /*INIDVIDUAL RCT*/
replace name="Dossa et al. (2001)" in 5
replace N="individuals" in 5
replace country="Benin" in 5
replace doses=2 in 5
replace drug="Albendazole 600mg" in 5 /*200mg/day for 3 consecutive dats, repeated 1 month later*/
replace lengthfu=3 in 5
/*a. Albendazole vs. control*/

* Paper ------------------------------------------------------------------------
replace peweight=1.2-1.2 in 5 /*Based on article*/
replace seweight=((1^2)/37+(1.1^2)/28)^0.5 in 5 /*Based on article*/
replace nweightt=37 in 5 /*Based on article*/
replace nweightc=28 in 5 /*Based on article*/
replace peheight=6.5-6 in 5 /*Based on article*/
replace seheight=((2.6^2)/37+(2.5^2)/28)^0.5 in 5 /*Based on article*/
replace nheightt=37 in 5 /*Based on article*/
replace nheightc=28 in 5 /*Based on article*/
replace pemuac=0.1-0.1 in 5 /*Based on article*/
replace semuac=((0.8^2)/37+(0.9^2)/28)^0.5 in 5 /*Based on article*/
replace nmuact=37 in 5 /*Based on article*/
replace nmuacc=28 in 5 /*Based on article*/
replace pehemob=0.8-0.5 in 5 /*Based on article*/
replace sehemob=((1.3^2)/38+(1.2^2)/32)^0.5 in 5 /*Based on article*/
replace nhemobt=38 in 5 /*Based on article*/
replace nhemobc=32 in 5 /*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0 in 5 /*TMSDG*/
replace seweight_c=0.265 in 5 /*TMSDG*/
replace nweightt_c=37 in 5 /*TMSDG*/
replace nweightc_c=28 in 5 /*TMSDG*/
replace peheight_c=0.5 in 5 /*TMSDG*/
replace seheight_c=((2.6^2)/37+(2.5^2)/28)^0.5 in 5 /*TMSDG*/
replace nheightt_c=37 in 5 /*TMSDG*/
replace nheightc_c=28 in 5 /*TMSDG*/
replace pemuac_c=0.1-0.1 in 5 /*TMSDG*/
replace semuac_c=((0.8^2)/37+(0.9^2)/28)^0.5 in 5 /*TMSDG*/
replace nmuact_c=37 in 5 /*TMSDG*/
replace nmuacc_c=28 in 5 /*TMSDG*/
replace pehemob_c=0.8-0.5 in 5 /*TMSDG*/
replace sehemob_c=((1.3^2)/38+(1.2^2)/32)^0.5 in 5 /*TMSDG*/
replace nhemobt_c=38 in 5 /*TMSDG*/
replace nhemobc_c=32 in 5 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0 in 5 /*TMDCG*/
replace seweight_c2=0.265 in 5 /*TMDCG*/
replace nweightt_c2=37 in 5 /*TMDCG*/
replace nweightc_c2=28 in 5 /*TMDCG*/
replace peheight_c2=0.5 in 5 /*TMDCG*/
replace seheight_c2=1.0986 in 5 /*TMDCG*/
replace nheightt_c2=37 in 5 /*TMDCG*/
replace nheightc_c2=28 in 5 /*TMDCG*/
replace pemuac_c2=0.1-0.1 in 5 /*TMDCG*/
replace semuac_c2=((0.8^2)/37+(0.9^2)/28)^0.5 in 5 /*TMDCG*/
replace nmuact_c2=37 in 5 /*TMDCG*/
replace nmuacc_c2=28 in 5 /*TMDCG*/
replace pehemob_c2=0.8-0.5 in 5 /*TMDCG*/
replace sehemob_c2=((1.3^2)/38+(1.2^2)/32)^0.5 in 5 /*TMDCG*/
replace nhemobt_c2=38 in 5 /*TMDCG*/
replace nhemobc_c2=32 in 5 /*TMDCG*/

replace tweight=1 in 5
replace theight=1 in 5
replace tmuac=1 in 5
replace themob=1 in 5

replace notes="All unadjusted." in 5
replace prevalence="0.58" in 5
replace  flag_sd=0 in 5
*There is data on HAZ (and WHZ but not WAZ)


**## Dossa 2001b ===============================================================
replace trial="Dossa 2001b" in 6 /*INIDVIDUAL RCT*/
replace name="Dossa et al. (2001)" in 6
replace N="individuals" in 6
replace country="Benin" in 6
replace doses=2 in 6
replace drug="Albendazole 600mg" in 6 /*200mg/day for 3 consecutive dats, repeated 1 month later*/
replace lengthfu=10 in 6

/*b. Albendazole+iron vs. iron*/
* Paper ------------------------------------------------------------------------
replace peweight=1.2-1.2 in 6 /*Based on article*/
replace seweight=((0.6^2)/31+(0.5^2)/33)^0.5 in 6 /*Based on article*/
replace nweightt=31 in 6 /*Based on article*/
replace nweightc=33 in 6 /*Based on article*/
replace peheight=6.2-6.2 in 6 /*Based on article*/
replace seheight=((1^2)/31+(1.5^2)/33)^0.5 in 6 /*Based on article*/
replace nheightt=31 in 6 /*Based on article*/
replace nheightc=33 in 6 /*Based on article*/
replace pemuac=0.1-0.0 in 6 /*Based on article*/
replace semuac=((0.7^2)/31+(0.8^2)/33)^0.5 in 6 /*Based on article*/
replace nmuact=31 in 6 /*Based on article*/
replace nmuacc=33 in 6 /*Based on article*/
replace pehemob=1.3-1.1 in 6 /*Based on article*/
replace sehemob=((1.5^2)/34+(1.2^2)/34)^0.5 in 6 /*Based on article*/
replace nhemobt=34 in 6 /*Based on article*/
replace nhemobc=34 in 6 /*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0 in 6 /*TMSDG*/
replace seweight_c=0.1385 in 6 /*TMSDG*/
replace nweightt_c=31 in 6 /*TMSDG*/
replace nweightc_c=33 in 6 /*TMSDG*/
replace peheight_c=0 in 6 /*TMSDG*/
replace seheight_c=((1^2)/31+(1.5^2)/33)^0.5 in 6 /*TMSDG*/
replace nheightt_c=31 in 6 /*TMSDG*/
replace nheightc_c=33 in 6 /*TMSDG*/
replace pemuac_c=0.1-0.0 in 6 /*TMSDG*/
replace semuac_c=((0.7^2)/31+(0.8^2)/33)^0.5 in 6 /*TMSDG*/
replace nmuact_c=31 in 6 /*TMSDG*/
replace nmuacc_c=33 in 6 /*TMSDG*/
replace pehemob_c=1.3-1.1 in 6 /*TMSDG*/
replace sehemob_c=((1.5^2)/34+(1.2^2)/34)^0.5 in 6 /*TMSDG*/
replace nhemobt_c=34 in 6 /*TMSDG*/
replace nhemobc_c=34 in 6 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0 in 6 /*TMDCG*/
replace seweight_c2=0.1385 in 6 /*TMDCG*/
replace nweightt_c2=31 in 6 /*TMDCG*/
replace nweightc_c2=33 in 6 /*TMDCG*/
replace peheight_c2=0 in 6 /*TMDCG*/
replace seheight_c2=((1^2)/31+(1.5^2)/33)^0.5 in 6 /*TMDCG*/
replace nheightt_c2=31 in 6 /*TMDCG*/
replace nheightc_c2=33 in 6 /*TMDCG*/
replace pemuac_c2=0.1-0.0 in 6 /*TMDCG*/
replace semuac_c2=((0.7^2)/31+(0.8^2)/33)^0.5 in 6 /*TMDCG*/
replace nmuact_c2=31 in 6 /*TMDCG*/
replace nmuacc_c2=33 in 6 /*TMDCG*/
replace pehemob_c2=1.3-1.1 in 6 /*TMDCG*/
replace sehemob_c2=((1.5^2)/34+(1.2^2)/34)^0.5 in 6 /*TMDCG*/
replace nhemobt_c2=34 in 6 /*TMDCG*/
replace nhemobc_c2=34 in 6 /*TMDCG*/

replace tweight=1 in 6
replace theight=1 in 6
replace tmuac=1 in 6
replace themob=1 in 6
replace notes="All unadjusted." in 6
replace prevalence="0.58" in 6
replace flag_sd=0 in 6
*There is data on HAZ (and WHZ but not WAZ)


**## Kruger 1996a ==============================================================
replace trial="Kruger 1996a" in 7 /*INIDVIDUAL RCT*/
replace name="Kruger et al. (1996)" in 7
replace N="individuals" in 7
replace country="South Africa" in 7
replace doses=2 in 7
replace drug="Albendazole 400mg" in 7
replace lengthfu=11 in 7

* Paper ------------------------------------------------------------------------
/*A + regular soup vs. regular soup*/

*Weight
* Mean and s.e. of regular soup + albendzole
	local n1=15
	local n2=22
	local m1=2.5
	local m2=2.2
	local sd1=0.7
	local sd2=0.6
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of regular soup+ placebo
	local n1=14
	local n2=23
	local m1=2.2
	local m2=3.0
	local sd1=0.6
	local sd2=1.6
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace peweight=`mdweight_t1'-`mdweight_t2' in 7 /*Based on article*/
replace seweight=((`sedweight_t1'^2)+(`sedweight_t2'^2))^0.5 in 7 /*Based on article; TMSDG 0.2478*/
replace nweightt=15+22 in 7 /*Based on article*/
replace nweightc=14+23 in 7 /*Based on article*/

*Height
* Mean and s.e. of regular soup + albendzole
	local n1=15
	local n2=22
	local m1=5.8
	local m2=5.5
	local sd1=0.9
	local sd2=0.9
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of regular soup + placebo
	local n1=14
	local n2=23
	local m1=5.1
	local m2=5.8
	local sd1=1.1
	local sd2=0.8
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace peheight=`mdheight_t1'-`mdheight_t2' in 7 /*Based on article. TMSDG 0.08*/
replace seheight=((`sedheight_t1'^2)+(`sedheight_t2'^2))^0.5 in 7 /*Based on article*/
replace nheightt=15+22 in 7 /*Based on article*/
replace nheightc=14+23 in 7 /*Based on article*/

*Hemoglobin
* Mean and s.e. of regular soup + albendzole
	local n1=15
	local n2=22
	local m1=0.3
	local m2=0.2
	local sd1=0.6
	local sd2=0.6
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedhemob_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdhemob_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of regular soup + placebo
	local n1=14
	local n2=23
	local m1=0.2
	local m2=0.3
	local sd1=0.6
	local sd2=0.8
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedhemob_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdhemob_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace pehemob=`mdhemob_t1'-`mdhemob_t2' in 7 /*Based on article. TMSDG 0.08*/
replace sehemob=((`sedhemob_t1'^2)+(`sedhemob_t2'^2))^0.5 in 7 /*Based on article*/
replace nhemobt=15+22 in 7 /*Based on article*/
replace nhemobc=14+23 in 7 /*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=-0.38 in 7 /*TMSDG*/
replace seweight_c=0.2265 in 7 /*TMSDG*/
replace nweightt_c=37 in 7 /*TMSDG*/
replace nweightc_c=37 in 7 /*TMSDG*/
replace peheight_c=0.08 in 7 /*TMSDG*/
replace seheight_c=((0.9^2)/37+(0.91^2)/37)^0.5 in 7 /*TMSDG*/
replace nheightt_c=37 in 7 /*TMSDG*/
replace nheightc_c=37 in 7 /*TMSDG*/
replace pehemob_c=-0.02 in 7 /*TMSDG*/
replace sehemob_c=((0.6^2)/37+(0.72^2)/37)^0.5 in 7 /*TMSDG*/
replace nhemobt_c=37 in 7 /*TMSDG*/
replace nhemobc_c=37 in 7 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=-0.3757 in 7 /*TMDCG*/
replace seweight_c2=0.2478 in 7 /*TMDCG*/
replace nweightt_c2=37 in 7 /*TMDCG*/
replace nweightc_c2=37 in 7 /*TMDCG*/
replace peheight_c2=0.0865 in 7 /*TMDCG*/
replace seheight_c2=0.2179 in 7 /*TMDCG*/
replace nheightt_c2=37 in 7 /*TMDCG*/
replace nheightc_c2=37 in 7 /*TMDCG*/
replace pehemob_c2=-0.02 in 7 /*TMDCG*/
replace sehemob_c2=((0.5937^2)/37+(0.7236^2)/37)^0.5 in 7 /*TMDCG*/
replace nhemobt_c2=37 in 7 /*TMDCG*/
replace nhemobc_c2=37 in 7 /*TMDCG*/

replace tweight=1 in 7
replace theight=1 in 7
replace themob=1 in 7
replace notes="All unadjusted." in 7
replace prevalence="0.38" in 7
replace flag_sd=0 in 7
*There is data on WAZ and HAZ


**## Kruger 1996b ==============================================================
replace trial="Kruger 1996b" in 8 /*INIDVIDUAL RCT*/
replace name="Kruger et al. (1996)" in 8
replace N="individuals" in 8
replace country="South Africa" in 8
replace doses=2 in 8
replace drug="Albendazole 400mg" in 8
replace lengthfu=11 in 8

* Paper ------------------------------------------------------------------------
/*A + Fe soup vs. Fe soup*/

*Weight
* Mean and s.e. of fortified soup + albendzole
	local n1=20
	local n2=30
	local m1=2.8
	local m2=2.9
	local sd1=1.1
	local sd2=1.1
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of fortified soup + placebo
	local n1=24
	local n2=30
	local m1=2.3
	local m2=2.6
	local sd1=0.7
	local sd2=0.8
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace peweight=`mdweight_t1'-`mdweight_t2' in 8 /*Based on article*/
replace seweight=((`sedweight_t1'^2)+(`sedweight_t2'^2))^0.5 in 8 /*Based on article*/
replace nweightt=20+30 in 8 /*Based on article*/
replace nweightc=24+30 in 8 /*Based on article*/

*Height
* Mean and s.e. of fortified soup + albendzole
	local n1=20
	local n2=30
	local m1=6.1
	local m2=5.8
	local sd1=1.2
	local sd2=0.9
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of fortified soup + placebo
	local n1=24
	local n2=30
	local m1=5.6
	local m2=5.8
	local sd1=1.2
	local sd2=1.0
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace peheight=`mdheight_t1'-`mdheight_t2' in 8 /*Based on article*/
replace seheight=((`sedheight_t1'^2)+(`sedheight_t2'^2))^0.5 in 8 /*Based on article*/
replace nheightt=20+30 in 8 /*Based on article*/
replace nheightc=24+30 in 8 /*Based on article*/

*Hemoglobin
* Mean and s.e. of fortified soup + albendzole
	local n1=20
	local n2=30
	local m1=0.7
	local m2=0.5
	local sd1=0.7
	local sd2=0.7
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedhemob_t1=`sd'*(1/(`n1'+`n2'))^0.5
	local mdhemob_t1= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
* Mean and s.e. of fortified soup + placebo
	local n1=24
	local n2=30
	local m1=0.2
	local m2=0.4
	local sd1=0.6
	local sd2=0.6
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedhemob_t2=`sd'*(1/(`n1'+`n2'))^0.5
	local mdhemob_t2= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')
replace pehemob=`mdhemob_t1'-`mdhemob_t2' in 8 /*Based on article*/
replace sehemob=((`sedhemob_t1'^2)+(`sedhemob_t2'^2))^0.5 in 8 /*Based on article*/
replace nhemobt=20+30 in 8 /*Based on article*/
replace nhemobc=24+30 in 8 /*Based on article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.3933 in 8 /*TMDCG*/
replace seweight_c2=0.186 in 8 /*TMDCG*/
replace nweightt_c2=50 in 8 /*TMDCG*/
replace nweightc_c2=54 in 8 /*TMDCG*/
replace peheight_c2=0.2089 in 8 /*TMDCG*/
replace seheight_c2=0.2076 in 8 /*TMDCG*/
replace nheightt_c2=50 in 8 /*TMDCG*/
replace nheightc_c2=54 in 8 /*TMDCG*/
replace pehemob_c2=0.27 in 8 /*TMDCG*/
replace sehemob_c2=((0.6999^2)/50+(0.6027^2)/54)^0.5 in 8 /*TMDCG*/
replace nhemobt_c2=50 in 8 /*TMDCG*/
replace nhemobc_c2=54 in 8 /*TMDCG*/

replace tweight=1 in 8
replace theight=1 in 8
replace themob=1 in 8
replace notes="All unadjusted." in 8
replace prevalence="0.38" in 8
replace flag_sd=0 in 8
*There is data available on WAZ and HAZ


**## Stephenson 1993 ===========================================================
replace trial="Stephenson 1993" in 9 /*INDIVIDUAL RCT*/
replace name="Stephenson et al. (1993)" in 9
replace N="individuals" in 9
replace country="Kenya" in 9
replace doses=2 in 9
replace drug="Albendazole 600mg" in 9
replace lengthfu=8.2 in 9

* Paper ------------------------------------------------------------------------
replace peweight=0.9 in 9 /*Based on article*/
replace seweight=((0.12^2)+(0.14^2))^0.5 in 9 /*Based on article*/
replace nweightt=95 in 9 /*Based on article*/
replace nweightc=93 in 9 /*Based on article*/
replace peheight=-0.1 in 9 /*Based on article*/
replace seheight=((0.12^2)+(0.11^2))^0.5 in 9 /*Based on article*/
replace nheightt=95 in 9 /*Based on article*/
replace nheightc=93 in 9 /*Based on article*/
replace pemuac=0.4 in 9 /*Based on article*/
replace semuac=((0.05^2)+(0.04^2))^0.5 in 9 /*Based on article*/
replace nmuact=95 in 9 /*Based on article*/
replace nmuacc=93 in 9 /*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.9 in 9 /*TMSDG*/
replace seweight_c=0.1842 in 9 /*TMSDG*/
replace nweightt_c=. in 9 /*TMSDG*/
replace nweightc_c=. in 9 /*TMSDG*/
replace peheight_c=-0.1 in 9 /*TMSDG*/
replace seheight_c=((1.07^2)/95+(1.16^2)/93)^0.5 in 9 /*TMSDG*/
replace nheightt_c=95 in 9 /*TMSDG*/
replace nheightc_c=93 in 9 /*TMSDG*/
replace pemuac_c=0.4 in 9 /*TMSDG*/
replace semuac_c=((0.49^2)/95+(0.39^2)/93)^0.5 in 9 /*TMSDG*/
replace nmuact_c=95 in 9 /*TMSDG*/
replace nmuacc_c=93 in 9 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.9 in 9 /*TMDCG*/
replace seweight_c2=0.1842 in 9 /*TMDCG*/
replace nweightt_c2=95 in 9 /*TMDCG*/
replace nweightc_c2=93 in 9 /*TMDCG*/
replace peheight_c2=-0.1 in 9 /*TMDCG*/
replace seheight_c2=((1.07^2)/95+(1.16^2)/93)^0.5 in 9 /*TMDCG*/
replace nheightt_c2=95 in 9 /*TMDCG*/
replace nheightc_c2=93 in 9 /*TMDCG*/
replace pemuac_c2=0.4 in 9 /*TMDCG*/
replace semuac_c2=((0.49^2)/95+(0.39^2)/93)^0.5 in 9 /*TMDCG*/
replace nmuact_c2=95 in 9 /*TMDCG*/
replace nmuacc_c2=93 in 9 /*TMDCG*/

replace tweight=1 in 9
replace theight=1 in 9
replace tmuac=1 in 9
replace notes="All unadjusted." in 9
disp (0.92*93+0.9*96+0.81*95)/(93+96+95)
replace prevalence="0.88" in 9
replace flag_sd=0 in 9
*There is data on percent WAZ and HAZ (although I am not sure what these mean).


**## Stoltzfus 1997a ===========================================================
replace trial="Stoltzfus 1997a" in 10 /*Cluster-RCT: "All analyses were performed at the individual level and
were adjusted for within-school correlations using the generalized estimating equations approach.*/

replace name="Stoltzfus et al. (1997)" in 10
replace N="clusters" in 10
replace country="Tanzania" in 10
replace doses=2.5 in 10 /*We combine the x2 and x3 arms*/
replace drug="Mebendazole 500mg" in 10
replace lengthfu=12 in 10

* Paper ------------------------------------------------------------------------
/*children under 10*/
*Weight
local sedweight_c=0.08
local mdweight_c=2.11

	local n1=442
	local n2=476
	local m1=2.38
	local m2=2.31
	local sd1=0.08*`n1'^0.5
	local sd2=0.08*`n2'^0.5
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')

replace peweight=`mdweight_t'-`mdweight_c' in 10 /*Based on article*/
replace seweight=((`sedweight_t'^2)+(`sedweight_c'^2))^0.5 in 10 /*Based on article*/
replace nweightt=8 in 10 /*442+476 individuals Based on article*/
replace nweightc=4 in 10 /*473 idividualsBased on article*/

*Height
local sedheight_c=0.07
local mdheight_c=4.29

	local n1=442
	local n2=476
	local m1=4.42
	local m2=4.59
	local sd1=0.07*`n1'^0.5
	local sd2=0.07*`n2'^0.5
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')

replace peheight=`mdheight_t'-`mdheight_c' in 10 /*Based on article*/
replace seheight=((`sedheight_t'^2)+(`sedheight_c'^2))^0.5 in 10 /*Based on article*/
replace nheightt=8 in 10 /*442+476 individuals Based on article*/
replace nheightc=4 in 10 /*473 individualsBased on article*/

replace tweight=1 in 10
replace theight=1 in 10
replace notes="All adjusted. Sample of children under 10." in 10
replace prevalence="0.95" in 10 /*From article*/
replace flag_sd=1 in 10
*There is no data for estimates on WAZ nor HAZ



**## Stoltzfus 1997b ===========================================================
replace trial="Stoltzfus 1997b" in 11 /*See Stoltzfus 1997a*/
replace name="Stoltzfus et al. (1997)" in 11
replace N="clusters" in 11
replace country="Tanzania" in 11
replace doses=2.5 in 11 /*We combine the x2 and x3 arms*/
replace drug="Mebendazole 500mg" in 11
replace lengthfu=12 in 11
/*children over 10*/
*Weight
local sedweight_c=0.11
local mdweight_c=3.01

	local n1=548
	local n2=543
	local m1=3.20
	local m2=3.04
	local sd1=0.12*`n1'^0.5
	local sd2=0.12*`n2'^0.5
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedweight_t=`sd'*(1/(`n1'+`n2'))^0.5
	local mdweight_t= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')

replace peweight=`mdweight_t'-`mdweight_c' in 11 /*Based on article*/
replace seweight=((`sedweight_t'^2)+(`sedweight_c'^2))^0.5 in 11 /*Based on article*/
replace nweightt=8 in 11 /*548+543 i Based on article*/
replace nweightc=4 in 11 /*581 iBased on article*/

*Height
local sedheight_c=0.08
local mdheight_c=4.74

	local n1=548
	local n2=543
	local m1=4.67
	local m2=4.81
	local sd1=0.08*`n1'^0.5
	local sd2=0.08*`n2'^0.5
	local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
	local sd=(`num'/(`n1'+`n2'-1))^0.5
	local sedheight_t=`sd'*(1/(`n1'+`n2'))^0.5
	local mdheight_t= (`m1'*`n1'+`m2'*`n2')/(`n1'+`n2')

replace peheight=`mdheight_t'-`mdheight_c' in 11 /*Based on article*/
replace seheight=((`sedheight_t'^2)+(`sedheight_c'^2))^0.5 in 11 /*Based on article*/
replace nheightt=8 in 11 /*548+543 iBased on article*/
replace nheightc=4 in 11 /*581i Based on article*/

replace tweight=1 in 11
replace theight=1 in 11
replace notes="All adjusted. Sample of children over 10." in 11
replace prevalence="0.95" in 11 /*From article*/
replace flag_sd=1 in 11
*There is no data for estimates on WAZ nor HAZ


**## Watkins 1996 ==============================================================
replace trial="Watkins 1996" in 12 /*Individual RCT*/
replace name="Watkins and Pollitt (1996)" in 12
replace N="individuals" in 12
replace country="Guatemala" in 12
replace doses=2 in 12
replace drug="Albendazole 400mg" in 12
replace lengthfu=6 in 12

* Paper ------------------------------------------------------------------------
replace peweight=1.82-1.69 in 12 /*Based on article*/
replace seweight=((0.08^2)+(0.07^2))^0.5 in 12 /*Based on article; TMSDG 0.1059*/
replace nweightt=116 in 12/*Based on article*/
replace nweightc=110 in 12/*Based on article*/
replace peheight=2.45-2.39 in 12 /*Based on article*/
replace seheight=((0.07^2)+(0.07^2))^0.5 in 12 /*Based on article; TMSDG (excel) 0.0982*/
replace nheightt=116 in 12/*Based on article*/
replace nheightc=111 in 12/*Based on article*/
replace pemuac=0.60-0.52 in 12 /*Based on article*/
replace semuac=((0.05^2)+(0.05^2))^0.5 in 12 /*Based on article; TMSDG (excel) 0.0982*/
replace nmuact=106 in 12/*Based on article*/
replace nmuacc=101 in 12/*Based on article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.13 in 12 /*TMSDG*/
replace seweight_c=0.1059 in 12 /*TMSDG*/
replace nweightt_c=116 in 12 /*TMSDG*/
replace nweightc_c=110 in 12 /*TMSDG*/
replace peheight_c=0.06 in 12 /*TMSDG*/
replace seheight_c=((0.75^2)/116+(0.73^2)/111)^0.5 in 12 /*TMSDG*/
replace nheightt_c=116 in 12 /*TMSDG*/
replace nheightc_c=111 in 12 /*TMSDG*/
replace pemuac_c=0.60-0.52 in 12 /*TMSDG*/
replace semuac_c=((0.51^2)/106+(0.5^2)/101)^0.5 in 12 /*TMSDG*/
replace nmuact_c=106 in 12/*TMSDG*/
replace nmuacc_c=101 in 12/*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.13 in 12 /*TMDCG*/
replace seweight_c2=0.1059 in 12 /*TMDCG*/
replace nweightt_c2=116 in 12 /*TMDCG*/
replace nweightc_c2=110 in 12 /*TMDCG*/
replace peheight_c2=0.06 in 12 /*TMDCG*/
replace seheight_c2=((0.75^2)/116+(0.73^2)/111)^0.5 in 12 /*TMDCG*/
replace nheightt_c2=116 in 12 /*TMDCG*/
replace nheightc_c2=111 in 12 /*TMDCG*/
replace pemuac_c2=0.60-0.52 in 12 /*TMDCG*/
replace semuac_c2=((0.51^2)/106+(0.5^2)/101)^0.5 in 12 /*TMDCG*/
replace nmuact_c2=106 in 12/*TMDCG*/
replace nmuacc_c2=101 in 12/*TMDCG*/

replace tweight=1 in 12
replace theight=1 in 12
replace tmuac=1 in 12
replace notes="All unadjusted." in 12
replace prevalence="0.91" in 12
replace flag_sd=0 in 12
*There is data on WAZ and HAZ.


**## Bhoite 2012 ===============================================================
replace trial="Bhoite 2012" in 13 /*Cluster RCT: NEED TO ADJUST  FEW (3) CLUSTERS*/
replace name="Bhoite and Iyer (2012)" in 13
replace N="clusters" in 13
replace country="India" in 13
replace doses=2 in 13
replace drug="Albendazole 400mg" in 13
replace lengthfu=8 in 13

* Paper ------------------------------------------------------------------------
replace peweight=2.4-3.7 in 13 /*Based on article*/
replace seweight=((3^2)/128+(2.1^2)/153)^0.5 in 13 /*Based on article*/
	replace seweight=seweight*(1+(round((128+153)/2,1)-1)*0.17)^0.5 in 13 /*Weight ICC 0.17 from Awasthi 1995/2008*/
replace nweightt=1 in 13 /*128i Based on article*/
replace nweightc=1 in 13 /*153i Based on article*/
replace peheight=5.2-2.8 in 13 /*Based on article*/
replace seheight=((2.6^2)/128+(1.36^2)/153)^0.5 in 13 /*Based on article*/
	replace seheight=seheight*(1+(round((128+153)/2,1)-1)*0.11)^0.5 in 13 /*Weight ICC 0.11 from Awasthi 1995/2008*/
replace nheightt=1 in 13 /*128i Based on article*/
replace nheightc=1 in 13 /*153i Based on article*/
replace pehemob=11.4-10.4 in 13 /*Based on article*/
replace sehemob=((1.3^2)/161+(1.6^2)/108)^0.5 in 13 /*Based on article*/
replace nhemobt=1 in 13 /*161i Based on article*/
replace nhemobc=1 in 13 /*108i Based on article*/

replace tweight=1 in 13
replace theight=1 in 13
replace themob=2 in 13
replace notes="All unadjusted. S.E. adjusted for clustering (not few clusters) for weight and height. There are baseline imbalances for hemoglobin" in 13
replace prevalence="NA" in 13
replace flag_sd=0 in 13
*There is no data on WAZ nor HAZ.

**## Gupta 1982a ===============================================================
replace trial="Gupta 1982a" in 14 /*Individual RCT*/
replace name="Gupta and Urrutia (1982)" in 14
replace N="individuals" in 14
replace country="Guatemala" in 14
replace doses=6 in 14
replace drug="Piperazine 75mg/kg.day for 2 days" in 14
replace lengthfu=12 in 14

* Paper ------------------------------------------------------------------------
/*Placebo (I) vs. deworming (II)*/
replace peweight=1.6590-1.6324 in 14 /*Based on article*/
replace seweight=((0.7267^2)/39+(0.8180^2)/39)^0.5 in 14 /*Based on article*/
replace nweightt=39 in 14 /*Based on article*/
replace nweightc=39 in 14 /*Based on article*/
replace peheight=6.0738-6.1690 in 14 /*Based on article*/
replace seheight=((2.1159^2)/39+(1.7936^2)/39)^0.5 in 14 /*Based on article*/
replace nheightt=39 in 14 /*Based on article*/
replace nheightc=39 in 14 /*Based on article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=1.6590-1.6324 in 14 /*TMDCG*/
replace seweight_c2=((0.7267^2)/39+(0.8180^2)/39)^0.5 in 14 /*TMDCG*/
replace nweightt_c2=39 in 14 /*TMDCG*/
replace nweightc_c2=39 in 14 /*TMDCG*/
replace peheight_c2=6.0738-6.1690 in 14 /*TMDCG*/
replace seheight_c2=((2.1159^2)/39+(1.7936^2)/39)^0.5 in 14 /*TMDCG*/
replace nheightt_c2=39 in 14 /*TMDCG*/
replace nheightc_c2=39 in 14 /*TMDCG*/

replace tweight=1 in 14
replace theight=1 in 14
replace notes="All unadjusted." in 14
disp 48/78
replace prevalence="0.62" in 14
replace flag_sd=0 in 14
* There is data on HAZ and WAZ

**## Gupta 1982b ===============================================================
replace trial="Gupta 1982b" in 15 /*Individual RCT*/
replace name="Gupta and Urrutia (1982)" in 15
replace N="individuals" in 15
replace country="Guatemala" in 15
replace doses=6 in 15
replace drug="Piperazine 75mg/kg.day for 2 days" in 15
replace lengthfu=12 in 15

* Paper ------------------------------------------------------------------------
/*Deworming + Anti-Giarda (IV) vs. Anti-Giarda (III)*/
replace peweight=1.9809-1.8514 in 15 /*Based on article*/
replace seweight=((0.6713^2)/41+(0.6580^2)/40)^0.5 in 15 /*Based on article*/
replace nweightt=41 in 15 /*Based on article*/
replace nweightc=40 in 15 /*Based on article*/
replace peheight=6.9762-7.0054 in 15 /*Based on article*/
replace seheight=((2.1496^2)/41+(2.1138^2)/40)^0.5 in 15 /*Based on article*/
replace nheightt=41 in 15 /*Based on article*/
replace nheightc=40 in 15 /*Based on article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=1.9809-1.8514 in 15 /*TMDCG*/
replace seweight_c2=((0.6713^2)/41+(0.6580^2)/40)^0.5 in 15 /*TMDCG*/
replace nweightt_c2=41 in 15 /*TMDCG*/
replace nweightc_c2=40 in 15 /*TMDCG*/
replace peheight_c2=6.9762-7.0054 in 15 /*TMDCG*/
replace seheight_c2=((2.1496^2)/41+(2.1138^2)/40)^0.5 in 15 /*TMDCG*/
replace nheightt_c2=41 in 15 /*TMDCG*/
replace nheightc_c2=40 in 15 /*TMDCG*/

replace tweight=1 in 15
replace theight=1 in 15
replace notes="All unadjusted." in 15
disp 47/80
replace prevalence="0.59" in 15
replace flag_sd=0 in 15
* There is data on HAZ and WAZ


**## Joseph 2015 ===============================================================
replace trial="Joseph 2015" in 16 /*Individual RCT*/
replace name="Joseph et al. (2015)" in 16
replace N="individuals" in 16
replace country="Peru" in 16
replace doses=2 in 16
replace drug="Mebendazole 500mg" in 16
replace lengthfu=12 in 16
replace peweight=0.04 in 16 /*Based on article*/
replace seweight=(0.04)/abs(invt(381+396-2,0.418/2)) in 16 /*Based on article*/
replace nweightt=381 in 16 /*Based on article*/
replace nweightc=396 in 16 /*Based on article*/
replace peheight=0.04 in 16 /*Based on article*/
replace seheight=(0.04)/abs(invt(381+396-2,0.753/2)) in 16 /*Based on article*/
replace nheightt=381 in 16 /*Based on article*/
replace nheightc=396 in 16 /*Based on article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.04 in 16 /*TMDCG*/
replace seweight_c2=0.0504 in 16 /*TMDCG*/
replace nweightt_c2=440 in 16 /*TMDCG*/
replace nweightc_c2=440 in 16 /*TMDCG*/
replace peheight_c2=0.06 in 16 /*TMDCG*/
replace seheight_c2=0.1336 in 16 /*TMDCG*/
replace nheightt_c2=440 in 16 /*TMDCG*/
replace nheightc_c2=440 in 16 /*TMDCG*/

replace tweight=1 in 16
replace theight=1 in 16
replace notes="All unadjusted." in 16
replace prevalence="0.11" in 16
replace flag_sd=0 in 16
* There is data on HAZ and WAZ


**## Ostwald 1984 ==============================================================
replace trial="Ostwald 1984" in 17 /*Individual RCT*/
replace name="Ostwald et al. (1984)" in 17
replace N="individuals" in 17
replace country="Papua New Guinea" in 17
replace doses=2 in 17
replace drug="Mebendazole ??mg twice a day for 3 successive days" in 17
replace lengthfu=6 in 17
replace peweight=2.8-2.1 in 17 /*Based on article*/
replace seweight=((2.4^2)/42+(1.7^2)/45)^0.5 in 17 /*Based on article*/
replace nweightt=42 in 17 /*Based on article*/
replace nweightc=45 in 17 /*Based on article*/
replace peheight=5.1-4.8 in 17 /*Based on article*/
replace seheight=((1.3^2)/42+(1.2^2)/44)^0.5 in 17 /*Based on article*/
replace nheightt=42 in 17 /*Based on article*/
replace nheightc=44 in 17 /*Based on article*/
replace pehemob=-0.1-(-0.4) in 17 /*Based on article*/
replace sehemob=((0.7^2)/34+(1.5^2)/36)^0.5 in 17 /*Based on article*/
replace nhemobt=34 in 17 /*Based on article*/
replace nhemobc=36 in 17 /*Based on article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.7 in 17 /*TMDCG*/
replace seweight_c2=((2.4^2)/42+(1.7^2)/45)^0.5 in 17 /*TMDCG*/
replace nweightt_c2=42 in 17 /*TMDCG*/
replace nweightc_c2=45 in 17 /*TMDCG*/
replace peheight_c2=5.1-4.8 in 17 /*TMDCG*/
replace seheight_c2=((1.3^2)/42+(1.2^2)/44)^0.5 in 17 /*TMDCG*/
replace nheightt_c2=42 in 17 /*TMDCG*/
replace nheightc_c2=44 in 17 /*TMDCG*/
replace pehemob_c2=-0.1-(-0.4) in 17 /*TMDCG*/
replace sehemob_c2=((0.7^2)/34+(1.5^2)/36)^0.5 in 17 /*TMDCG*/
replace nhemobt_c2=34 in 17 /*TMDCG*/
replace nhemobc_c2=36 in 17 /*TMDCG*/

replace tweight=1 in 17
replace theight=1 in 17
replace themob=1 in 17
replace notes="All unadjusted." in 17
replace prevalence="0.92" in 17
replace flag_sd=0 in 17
*There is no data on WAZ nor HAZ


**## Liu 2018 ==================================================================
replace trial="Liu 2017" in 18 /*Cluster RCT: Clustering is already taken into account*/
replace name="Liu et al. (2017)" in 18
replace N="clusters" in 18
replace country="China" in 18
replace doses=2 in 18
replace drug="Albendazole 400mg" in 18
replace lengthfu=12 in 18
replace peweight=0.03 in 18 /*Based on data from Campbell*/
replace seweight=(0.03)/abs(invt(2028-2,0.814/2)) in 18 /*Based on data from Campbell*/
replace nweightt=56 in 18 /*1000i Based on Article*/
replace nweightc=56 in 18 /*1028i Based on Article*/
replace peheight=0.08 in 18 /*Based on data from Campbell*/
replace seheight=(0.08)/abs(invt(2028-2,0.821/2)) in 18 /*Based on data from Campbell*/
replace nheightt=56 in 18 /*1000i Based on Article*/
replace nheightc=56 in 18 /*1028i Based on Article*/
replace pehemob=-0.043 in 18 /*Based on data from Campbell*/
replace sehemob=(abs(-0.043))/abs(invt(2028-2,0.690/2)) in 18 /*Based on data from Campbell*/
replace nhemobt=56 in 18 /*1000i Based on Article*/
replace nhemobc=56 in 18 /*1028i Based on Article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.03 in 18 /*TMSDC*/
replace seweight_c2=0.1429 in 18 /*TMSDC*/
replace nweightt_c2=56 in 18 /*TMSDC*/
replace nweightc_c2=56 in 18 /*TMSDC*/
replace peheight_c2=0.08 in 18 /*TMSDC*/
replace seheight_c2=0.352 in 18 /*TMSDC*/
replace nheightt_c2=56 in 18 /*TMSDC*/
replace nheightc_c2=56 in 18 /*TMSDC*/
replace pehemob_c2=-0.04 in 18 /*TMSDC*/
replace sehemob_c2=((1.3591^2)/56+(1.3323^2)/56)^0.5 in 18 /*TMSDC*/
replace nhemobt_c2=56 in 18 /*TMSDC*/
replace nhemobc_c2=56 in 18 /*TMSDC*/

replace tweight=1 in 18
replace theight=1 in 18
replace themob=2 in 18
replace notes="All unadjusted." in 18
replace prevalence="0.31" in 18
replace flag_sd=1 in 18
*There is data on percent stunted and percent underweight.


**## Wiria 2013 ===============================================================
replace trial="Wiria 2013" in 19 /*Randomization is at the household level*/
replace name="Wiria et al. (2013)" in 19
replace N="clusters" in 19
replace country="Indonesia" in 19
replace doses=6 in 19
replace drug="Albendazole 400mg" in 19
replace lengthfu=21 in 19
local weight_corr=0.8861 /*from Hall 2006*/

* From Welch (2016) ------------------------------------------------------------
replace peweight=(27.7375-25.2868) - (29.3190-27.0567) in 19 /*Based on data from Campbell*/
local sdweight_t=(10.18071^2 + 10.11906^2 -2*`weight_corr'*10.18071*10.11906)^0.5
local sdweight_c=(10.76517^2 + 11.89149^2 -2*`weight_corr'*10.76517*11.89149)^0.5
replace seweight=((`sdweight_t'^2)/340+(`sdweight_c'^2)/353)^0.5 in 19/*Based on data from Campbell*/
replace nweightt=473 in 19 /*340i Based on data from Campbell*/
replace nweightc=481 in 19 /*353i Based on data from Campbell*/

local height_corr=0.9114 /*from Hall 2006*/
replace peheight=(133.1126-126.6138) - (133.7825-128.6320) in 19/*Based on data from Campbell*/
local sdheight_t=(15.03380^2 + 16.95116^2 -2*`height_corr'*15.03380*16.95116)^0.5
local sdheight_c=(15.51269^2 + 17.21893^2 -2*`height_corr'*15.51269*17.21893)^0.5
replace seheight=((`sdheight_t'^2)/340+(`sdheight_c'^2)/353)^0.5 in 19/*Based on data from Campbell*/
replace nheightt=473 in 19 /*340i Based on data from Campbell*/
replace nheightc=481 in 19 /*353i Based on data from Campbell*/

replace tweight=1 in 19
replace theight=1 in 19
replace notes="All unadjusted. We lack s.d. of changes. We impute correlation coefficient for weight and height from Hall 2006." in 19
disp (509+486)/(683+629)
replace prevalence="0.76" in 19
replace flag_sd=0 in 19
*There is no data on WAZ nor HAZ.


**## Ndibazza 2021 =============================================================
replace trial="Ndibazza 2012" in 20 /*Individual RCT: At annual visits all infected children were treated (both in T and C)*/
replace name="Ndibazza et al. (2012)" in 20
replace N="individuals" in 20
replace country="Uganda" in 20
replace doses=20 in 20
replace drug="Albendazole 200mg or 400mg depending on age" in 20
replace lengthfu=60 in 20

* Paper ------------------------------------------------------------------------
replace peweight=7.29-7.28 in 20
replace seweight=((1.63^2)/597+(1.55^2)/631)^0.5 in 20
replace nweightt=597 in 20
replace nweightc=631 in 20
replace peheight=30.56-30.79 in 20
replace seheight=((4.92^2)/587+(4.99^2)/623)^0.5 in 20
replace nheightt=587 in 20
replace nheightc=623 in 20
replace pehemob=1.92-1.99 in 20
replace sehemob=((1.55^2)/537+(1.63^2)/572)^0.5 in 20
replace nhemobt=537 in 20
replace nhemobc=572 in 20

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=7.29-7.28 in 20 /*TMDCG*/
replace seweight_c2=((1.63^2)/597+(1.55^2)/631)^0.5 in 20 /*TMDCG*/
replace nweightt_c2=597 in 20 /*TMDCG*/
replace nweightc_c2=631 in 20 /*TMDCG*/
replace peheight_c2=30.56-30.79 in 20 /*TMDCG*/
replace seheight_c2=((4.92^2)/587+(4.99^2)/623)^0.5 in 20 /*TMDCG*/
replace nheightt_c2=587 in 20 /*TMDCG*/
replace nheightc_c2=623 in 20 /*TMDCG*/
replace pehemob_c2=1.92-1.99 in 20 /*TMDCG*/
replace sehemob_c2=((1.55^2)/537+(1.63^2)/572)^0.5 in 20 /*TMDCG*/
replace nhemobt_c2=537 in 20 /*TMDCG*/
replace nhemobc_c2=572 in 20 /*TMDCG*/

replace pehemob_c=-0.07 in 20
replace sehemob_c=((1.19^2)/697+(1.2^2)/726)^0.5 in 20
replace nhemobt_c=697 in 20
replace nhemobc_c=726 in 20

replace tweight=1 in 20
replace theight=1 in 20
replace themob=1 in 20
replace notes="Unadjusted. All infected children were treated during annual visits. We have more data than TMSDG." in 20
replace prevalence="0.03" in 20
replace flag_sd=0 in 20
*There is data on WAZ and HAZ


**## Hall 2006 =================================================================
replace trial="Hall 2006" in 21 /*Cluster RCT: I'm not sure we have coded the clusters correctly*/
replace name="Hall et al. (2006)" in 21
replace N="clusters" in 21
replace country="Vietnam" in 21
replace doses=4 in 21
replace drug="Albendazole 400mg" in 21
replace lengthfu=24 in 21

* Based on microdata -----------------------------------------------------------
*ANCOVA estimates accouting for clustering
replace peweight=.0542335 in 21
replace seweight=.0583449 in 21
replace nweightt=40 in 21 /*1342i, s.d. wt gain full sample 1.509145*/
replace nweightc=40 in 21 /*1318i*/
replace peheight=.0891978 in 21
replace seheight=.0821185 in 21
replace nheightt=40 in 21 /*1342i, s.d. ht gain full sample 2.274199*/
replace nheightc=40 in 21 /*1318*/
replace pemuac=.7942054 in 21
replace semuac=.3142782 in 21
replace nmuact=40 in 21 /*1342i, s.d. muac gain full sample 7.749428*/
replace nmuacc=40 in 21 /*1318i*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c=0 in 21 /*TMSDG*/
replace seweight_c=0.071 in 21 /*TMSDG*/
replace nweightt_c=40 in 21 /*TMSDG*/
replace nweightc_c=40 in 21 /*TMSDG*/

replace peweight_c2=0 in 21 /*TMDCG*/
replace seweight_c2=0.071 in 21 /*TMDCG*/
replace nweightt_c2=40 in 21 /*TMDCG*/
replace nweightc_c2=40 in 21 /*TMDCG*/

replace tweight=3 in 21
replace theight=3 in 21
replace tmuac=3 in 21
replace notes="All unadjusted. I am not sure if clusters/schools were coded/identified correctly." in 21
replace prevalence="0.84" in 21
replace flag_sd=1 in 21

**## Goto 2009 =================================================================
replace trial="Goto 2009" in 22 /*Individual RCT: All these estimates need revision because sample does not match the article. I can't replicate tables.*/

/*We have the microdata. We need to decide if this one should be included or not. Non ITT estimate*/
replace name="Goto, Maschie-Taylor and Lunn (2009)" in 22
replace N="individuals" in 22
replace country="Bangladesh" in 22
replace doses=3 in 22
replace drug="Albendazole 200mg" in 22
replace lengthfu=9 in 22

/*Below ANCOVA estimates*/
replace peweight=-.056984 in 22
replace seweight=.0974042 in 22
replace nweightt=63 in 22	/*s.d. weight gain full sample .5084258*/
replace nweightc=48 in 22
replace peheight=.4477814 in 22
replace seheight=.4020866 in 22
replace nheightt=63 in 22	/*s.d. height gain full sample 2.403308*/
replace nheightc=48 in 22
replace pehemob=-0.2053744 in 22
replace sehemob=0.2627227 in 22
replace nhemobt=63 in 22	/*s.d. hgemob gain full sample 1.456331*/
replace nhemobc=48 in 22

replace pehemob_c=-0.10 in 22
replace sehemob_c=((1.39^2)/134+(1.38^2)/135)^0.5 in 22
replace nhemobt_c=134 in 22	/*s.d. hgemob gain full sample 1.456331*/
replace nhemobc_c=135 in 22

* From Taylor-Robinson (2019) --------------------------------------------------
replace pehemob_c2=-0.10 in 22 /*TMDCG*/
replace sehemob_c2=((1.39^2)/75+(1.38^2)/59)^0.5 in 22 /*TMDCG*/
replace nhemobt_c2=75 in 22 /*TMDCG*/
replace nhemobc_c2=59 in 22 /*TMDCG*/

replace tweight=3 in 22
replace theight=3 in 22
replace themob=3 in 22
replace notes="Unadjusted. Not ITT, only includes children that received full doses. Sample size from microdata does not coincide with article." in 22
replace prevalence="0.01" in 22
replace flag_sd=1 in 22

**## Miguel 2004 ===============================================================

replace trial="Miguel 2004" in 23 /*Cluster RCT: Outlier observations dropped.*/
replace name="Miguel and Kremer (2004)" in 23
replace N="clusters" in 23
replace country="Kenya" in 23
replace doses=2 in 23
replace drug="Albendazole 600mg" in 23
replace lengthfu=12 in 23

* Paper ------------------------------------------------------------------------
replace peweight=-.6626903 in 23
replace seweight=.2971633 in 23
replace nweightt=17 in 23 /*1825i, s.d. weight gain full sample 3.777313*/
replace nweightc=28 in 23 /*2046*/
replace peheight=1.54581 in 23
replace seheight=.5351821 in 23
replace nheightt=16 in 23 /*2358i, s.d. endline height full sample 12.33653*/
replace nheightc=28 in 23 /*2697i*/
replace tweight=3 in 23
replace theight=2 in 23

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=-.66 in 23 /*TMDCG*/
replace seweight_c2=.3 in 23 /*TMDCG*/
replace nweightt_c2=25 in 23 /*TMDCG*/
replace nweightc_c2=25 in 23 /*TMDCG*/

replace notes="All unadjusted. Weight is not balanced at baseline. We have no height data at baseline. Outlier observations dropped." in 23
replace prevalence="0.77" in 23
replace flag_sd=1 in 23


**## Alderman 2006 =============================================================
replace trial="Alderman 2006" in 24 /*Cluster RCT: Unadjusted & corrected for clustering from TMSDG*/
replace name="Alderman et al. (2006)" in 24
replace N="clusters" in 24
replace country="Uganda" in 24
replace doses=4 in 24
replace drug="Albendazole 400mg" in 24
replace lengthfu=26 in 24

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.154 in 24 /*TMSDG*/
replace seweight_c=0.08921 in 24 /*TMSDG*/
replace nweightt_c=24 in 24 /*clusters, TMSDG*/	/*s.d. weight gain full sample 2.508*/
replace nweightc_c=24 in 24 /*clusters, TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.154 in 24 /*TMDCG*/
replace seweight_c2=0.08921 in 24 /*TMDCG*/
replace nweightt_c2=24 in 24 /*TMDCG*/	/*s.d. weight gain full sample 2.508*/
replace nweightc_c2=24 in 24 /*TMDCG*/

replace tweight=1 in 24
replace notes="All unadjusted, accounting for clustering, taken from TMSDG" in 24
replace prevalence=">0.5" in 24 /*I take it from out meta-analysis*/
replace flag_sd=1 in 24



**## Sur 2005 ==================================================================
replace trial="Sur 2005" in 25 /*Individual RCT*/
replace name="Sur et al. (2005)" in 25
replace N="individuals" in 25
replace country="India" in 25
replace doses=2 in 25
replace drug="Albendazole 400mg" in 25
replace lengthfu=9 in 25


replace peweight=0.29 in 25 /*I take it from out meta-analysis*/
replace seweight=0.09 in 25 /*I take it from out meta-analysis*/

* Paper ------------------------------------------------------------------------
replace nweightt=342 in 25 /*From article*/
replace nweightc=340 in 25 /*From article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace peweight_c=0.5 in 25 /*TMSDG*/
replace seweight_c=0.4718 in 25 /*TMSDG*/
replace nweightt_c=342 in 25 /*TMSDG*/
replace nweightc_c=340 in 25 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.5 in 25 /*TMDCG*/
replace seweight_c2=0.4718 in 25 /*TMDCG*/
replace nweightt_c2=342 in 25 /*TMDCG*/
replace nweightc_c2=340 in 25 /*TMDCG*/

replace tweight=1 in 25
replace notes="All unadjusted. Our estimate is diff-in-diff; TMSDG's is endline comparison" in 25
disp (68+71)/(126+137)
replace prevalence="0.53" in 25 /*I take it from our meta-analysis*/
replace flag_sd=0 in 25



**## Willett 1979 ==============================================================
replace trial="Willett 1979" in 26 /*Individual RCT*/
replace name="Willett, Kilama adn Kihamia (1979)" in 26
replace N="individuals" in 26
replace country="Tanzania" in 26
replace doses=4 in 26
replace drug="Levamisole 2.5mg/kg" in 26
replace lengthfu=12 in 26

* Paper ------------------------------------------------------------------------
replace peweight=2.08-1.92 in 26 /*From article*/
replace seweight=(2.08-1.92)/abs(invt(273-2,0.06/2)) in 26 /*From article*/
replace nweightt=132-3 in 26 /*From article: I assume that the 6 children without weight data were equally distirbuted in T and C.*/
replace nweightc=147-3 in 26 /*From article: I assume that the 6 children without weight data were equally distirbuted in T and C.*/
 *replace peheight=7.58-7.73 in 18 /*There is no measure of variance*/

replace tweight=1 in 26
replace notes="All Adjusted." in 26
disp 78/(78+68)
replace prevalence="0.53" in 26 /*I take it from our meta-analysis*/
replace flag_sd=1 in 26


**## Gateff 1972 ===============================================================
replace trial="Gateff 1972" in 27 /*Individual RCT*/
replace name="Gateff, Lemarinier and Labusquiere (1972)" in 27
replace N="individuals" in 27
replace country="Cameroon" in 27
replace doses=3 in 27
replace drug="Thiabendazole 50mg/kg" in 27
replace lengthfu=8 in 27

* Paper ------------------------------------------------------------------------
replace peweight=0.3473 in 27 /*From article*/
replace seweight=0.3473/2.66 in 27 /*From article*/
replace nweightt=140 in 27 /*From article*/
replace nweightc=140 in 27 /*From article*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace peweight_c2=0.3473 in 27 /*TMDCG*/
replace seweight_c2=1.544 in 27 /*TMDCG*/
replace nweightt_c2=140 in 27 /*TMDCG*/
replace nweightc_c2=140 in 27 /*TMDCG*/

replace tweight=1 in 27
replace notes="Unadjusted." in 27
replace prevalence=">0.5" in 27 /*I take it from our meta-analysis*/
replace flag_sd=0 in 27


**## Rousham 1994 ==============================================================
replace trial="Rousham 1994" in 28 /*Cluster RCT: unclear is s.e. were adjusted.*/
replace name="Rousham and Mascie-Taylor (1994)" in 28
replace N="clusters" in 28
replace country="Bangladesh" in 28
replace doses=9 in 28
replace drug="Mebendazole 500mg" in 28
replace lengthfu=18 in 28


replace peweight=0.03-0.12 in 28
replace seweight=(0.03-0.12)/(4.33)^0.5 in 28 /*It is unclear to me whether standard errors where adjusted for clustering. They do something similar for baseline comparisons. Campbell says they did account for clustering.*/
replace nweightt=66 in 28 /*88i, 6 clusters*/
replace nweightc=7 in 28 /*714i, 7 clusters*/
replace peheight=0.25-0.17 in 28
replace seheight=(0.25-0.17)/(1.63)^0.5 in 28 /*It is unclear to me whether standard errors where adjusted for clustering. They do something similar for baseline comparisons. Campbell says they did account for clustering.*/
replace nheightt=6 in 28 /*688i, 6 clusters*/
replace nheightc=7 in 28 /*714i, 7 clusters*/
replace pemuac=0.33-0.23 in 28
replace semuac=(0.33-0.23)/(2.96)^0.5 in 28 /*It is unclear to me whether standard errors where adjusted for clustering. They do something similar for baseline comparisons. Campbell says they did account for clustering.*/
replace nmuact=6 in 28 /*688i, 6 clusters*/
replace nmuacc=7 in 28 /*714i, 7 clusters*/

replace tweight=1 in 28
replace theight=1 in 28
replace tmuac=1 in 28
replace notes="Estimate on HAZ, WAZ. All adjusted. Not sure if clustering has been corrected for; Campbell says yes." in 28
replace prevalence="0.71" in 28 /*From article*/
replace flag_sd=1 in 28



**## Kirwan 2010 ===============================================================
replace trial="Kirwan 2010" in 29 /*Individual RCT*/
replace name="Kirwan et al. (2010)" in 29
replace N="individuals" in 29
replace country="Nigeria" in 29
replace doses=3 in 29
replace drug="Albendazole 200mg or 400mg depending on age" in 29
replace lengthfu=14 in 29

* Paper ------------------------------------------------------------------------
replace pehemob=(9.94-9.54)-(10.11-9.88) in 29 /*Based on Article*/
replace sehemob=(abs((9.94-9.54)-(10.11-9.88)))/abs(invt(320-2,0.16/2)) in 29 /*Based on Article*/
replace nhemobt=158 in 29 /*Based on Article*/
replace nhemobc=162 in 29 /*Based on Article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace pehemob_c=10.04-10.03 in 29 /*TMSDG*/
replace sehemob_c=((1.38^2)/158+(1.4^2)/162)^0.5 in 29 /*TMSDG*/
replace nhemobt_c=158 in 29 /*TMSDG*/
replace nhemobc_c=162 in 29 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace pehemob_c2=10.04-10.03 in 29 /*TMDCG*/
replace sehemob_c2=((1.38^2)/158+(1.4^2)/162)^0.5 in 29 /*TMDCG*/
replace nhemobt_c2=158 in 29 /*TMDCG*/
replace nhemobc_c2=162 in 29 /*TMDCG*/

replace themob=1 in 29
replace notes="All unadjusted. TMSDG's estimate is endline at 12 month, ours id diff-in-diff at 14 months." in 29
replace prevalence="0.46" in 29
replace flag_sd=0 in 29



**## Le Houng 2007a ============================================================
replace trial="Le Huong 2007a" in 30 /*Individual RCT: MEB vs placebo*/
replace name="Le Huong et al. (2007)" in 30
replace N="individuals" in 30
replace country="Vietnam" in 30
replace doses=2 in 30
replace drug="Mebendazole 500mg" in 30
replace lengthfu=6 in 30

* Paper ------------------------------------------------------------------------
replace pehemob=1.46-1.54 in 30 /*Based on Article*/
replace sehemob=((0.1^2)+(0.092^2))^0.5 in 30 /*Based on Article*/
replace nhemobt=79 in 30 /*Based on Article*/
replace nhemobc=82 in 30 /*Based on Article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace pehemob_c=1.46-1.54 in 30 /*TMSDG*/
replace sehemob_c=((0.888^2)/79+(0.833^2)/82)^0.5 in 30 /*TMSDG*/
replace nhemobt_c=79 in 30 /*TMSDG*/
replace nhemobc_c=82 in 30 /*TMSDG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace pehemob_c2=1.46-1.54 in 30 /*TMDCG*/
replace sehemob_c2=((0.888^2)/79+(0.833^2)/82)^0.5 in 30 /*TMDCG*/
replace nhemobt_c2=79 in 30 /*TMDCG*/
replace nhemobc_c2=82 in 30 /*TMDCG*/

replace themob=1 in 30
replace notes="All unadjusted." in 30
disp (86*.767+79*.785+79*.633+82*.732)/(86+79+79+82)
replace prevalence="0.73" in 30
replace flag_sd=0 in 30


**## Le Houng 2007b ============================================================
replace trial="Le Huong 2007b" in 31 /*Individual RCT: MEB vs placebo*/
replace name="Le Huong et al. (2007)" in 31
replace N="individuals" in 31
replace country="Vietnam" in 31
replace doses=2 in 31
replace drug="Mebendazole 500mg" in 31
replace lengthfu=6 in 31

* Paper ------------------------------------------------------------------------
replace pehemob=1.754-1.783 in 31 /*Based on Article*/
replace sehemob=((0.085^2)+(0.097^2))^0.5 in 31 /*Based on Article*/
replace nhemobt=79 in 31 /*Based on Article*/
replace nhemobc=86 in 31 /*Based on Article*/

* From Taylor-Robinson (2015) --------------------------------------------------
replace pehemob_c=1.78-1.75 in 31 /*TMDCG*/
replace sehemob_c=((0.9^2)/86+(0.755^2)/79)^0.5 in 31 /*TMDCG*/
replace nhemobt_c=86 in 31 /*TMDCG*/
replace nhemobc_c=79 in 31 /*TMDCG*/

* From Taylor-Robinson (2019) --------------------------------------------------
replace pehemob_c2=1.78-1.75 in 31 /*TMSDG*/
replace sehemob_c2=((0.9^2)/86+(0.755^2)/79)^0.5 in 31 /*TMSDG*/
replace nhemobt_c2=86 in 31 /*TMSDG*/
replace nhemobc_c2=79 in 31 /*TMSDG*/

replace themob=1 in 31
replace notes="All unadjusted. TMSDG's hemoglobin estimate is wrong." in 31
disp (86*.767+79*.785+79*.633+82*.732)/(86+79+79+82)
replace prevalence="0.73" in 31
replace flag_sd=0 in 31

**## Hadju 1997 ================================================================
replace trial="Hadju 1997" in 32 /*Individual RCT.*/
replace name="Hadju et al. (1997)" in 32
replace N="individuals" in 32
replace country="Indonesia" in 32
replace doses=2 in 32
replace drug="Albendazole 400mg" in 32
replace lengthfu=12 in 32

* From Welch (2016) ------------------------------------------------------------
replace peweight_c=0.01-0.02 in 32 /*Taken form Campbell*/
replace seweight_c=((0.7156^2)/69+(0.7411^2)/74)^0.5 in 32 /*Taken form Campbell*/
replace nweightt_c=69 in 32 /*Taken form Campbell*/
replace nweightc_c=74 in 32 /*Taken form Campbell*/
replace peheight_c=0.01-0.01 in 32 /*Taken form Campbell*/
replace seheight_c=((0.5065^2)/69+(0.5243^2)/74)^0.5 in 32 /*Taken form Campbell*/
replace nheightt_c=69 in 32 /*Taken form Campbell*/
replace nheightc_c=74 in 32 /*Taken form Campbell*/

replace tweight=1 in 32
replace theight=1 in 32
replace notes="Estimate on HAZ, WAZ. Unadjusted. No measure of variance in article, taken from Campbell" in 32
replace prevalence=".97" in 32 /*I take it from article*/
replace flag_sd=0 in 32


**## Carmona-Fonseca 2015a =====================================================
replace trial="Carmona-Fonseca 2015a" in 33 /* RCT at HH level*/
replace name="Carmona-Fonseca and Correa-Botero (2015)" in 33
replace N="individuals" in 33
replace country="Colombia" in 33
replace doses=4 in 33
replace drug="<2 year pyrantel pamoate 10-20mg/kg; >2 year Albendazole 400mg " in 33
replace lengthfu=12 in 33

* Microdata --------------------------------------------------------------------
/*Deworming vs Placebo*/
replace peweight=0.20115585 in 33 /*microdata: ANCOVA, no controls*/
replace seweight=0.13610066 in 33 /*microdata: ANCOVA, no controls*/
replace nweightt=305 in 33 /*microdata: ANCOVA, no controls*/
replace nweightc=298 in 33 /*microdata: ANCOVA, no controls*/
replace peheight=-0.06658137 in 33 /*microdata: ANCOVA, no controls*/
replace seheight=0.19343019 in 33 /*microdata: ANCOVA, no controls*/
replace nheightt=303 in 33 /*microdata: ANCOVA, no controls*/
replace nheightc=298 in 33 /*microdata: ANCOVA, no controls*/
replace pehemob=0.12868392 in 33 /*microdata: ANCOVA, no controls*/
replace sehemob=0.09129135 in 33 /*microdata: ANCOVA, no controls*/
replace nhemobt=293 in 33 /*microdata: ANCOVA, no controls*/
replace nhemobc=293 in 33 /*microdata: ANCOVA, no controls*/

replace tweight=3 in 33
replace theight=3 in 33
replace themob=3 in 33
replace notes="Unadjusted. Randomization at HH, but no cluserting adjustment." in 33
replace prevalence="0.45" in 33 /*I take it from the article*/
replace flag_sd=0 in 33


**## Carmona-Fonseca 2015b =====================================================
replace trial="Carmona-Fonseca 2015b" in 34 /* RCT at HH level*/
replace name="Carmona-Fonseca and Correa-Botero (2015)" in 34
replace N="individuals" in 34
replace country="Colombia" in 34
replace doses=4 in 34
replace drug="<2 year pyrantel pamoate 10-20mg/kg; >2 year Albendazole 400mg " in 34
replace lengthfu=12 in 34

* Microdata --------------------------------------------------------------------
/*Deworming+VitA vs VitA*/
replace peweight=0.0619269 in 34 /*microdata: ANCOVA, no controls*/
replace seweight=0.11827586 in 34 /*microdata: ANCOVA, no controls*/
replace nweightt=352 in 34 /*microdata: ANCOVA, no controls*/
replace nweightc=306 in 34 /*microdata: ANCOVA, no controls*/

replace peheight=-0.06684254 in 34 /*microdata: ANCOVA, no controls*/
replace seheight=0.19349322 in 34 /*microdata: ANCOVA, no controls*/
replace nheightt=351 in 34 /*microdata: ANCOVA, no controls*/
replace nheightc=306 in 34 /*microdata: ANCOVA, no controls*/

replace pehemob=0.00698383 in 34 /*microdata: ANCOVA, no controls*/
replace sehemob=0.08162276 in 34 /*microdata: ANCOVA, no controls*/
replace nhemobt=329 in 34 /*microdata: ANCOVA, no controls*/
replace nhemobc=295 in 34 /*microdata: ANCOVA, no controls*/

replace tweight=3 in 34
replace theight=3 in 34
replace themob=3 in 34
replace notes="Unadjusted. Randomization at HH, but no cluserting adjustment." in 34
replace prevalence="0.45" in 34 /*I take it from the article*/
replace flag_sd=0 in 34

**# Code prevalence and samples ************************************************
/* See Appendix A and documentation/Final data sources.xlsx for documentation on
how the samples were defined */

**## Prevalence Categories =====================================================

gen 	Prevalence = 3
replace Prevalence = . if trial == "Bhoite 2012"
replace Prevalence = 2 if inlist(trial, "Liu 2017", ///
										"Kruger 1996a", ///
										"Kruger 1996b", ///
										"Kirwan 2010", ///
										"Carmona-Fonseca 2015a", ///
										"Carmona-Fonseca 2015b")
replace Prevalence = 1 if inlist(trial, "Awasthi 1995/2008", ///
										"Awasthi 2000", ///
										"Awasthi 2001", ///
										"Donnen 1998", ///
										"Joseph 2015", ///
										"Ndibazza 2012", ///
										"Goto 2009")
										
label define prevlabel 	1 "Worm Prevalence < 20" ///
						2 "20 <= Worm Prevalence < 50" ///
						3 "Worm Prevalence >= 50"
						
label values Prevalence prevlabel
sort  Prevalence trial

label 	define prev2label 1 "Worm Prevalence < 20" ///
						  2 "Worm Prevalence >= 20"

recode 	Prevalence (3 = 2), gen(Prevalence2)
lab val Prevalence2 prev2label


**## Imputing point prevalence =================================================

destring prevalence, gen(prevalence_exact) force
gen 	 prevalence_exact2 = prevalence_exact
replace  prevalence_exact2 = . 					if  inlist(trial, "Carmona-Fonseca 2015a", ///
																  "Kruger 1996a", ///
																  "Dossa 2001a", ///
																  "Gupta 1982a", ///
																  "Le Huong 2007a", ///
																  "Stoltzfus 1997a")

sum 	prevalence_exact2 if prevalence_exact2 <= 0.20
local 	mlt20 = r(mean)

sum 	prevalence_exact2 if prevalence_exact2 >= 0.50
local 	mgt50 = r(mean)

replace prevalence_exact = `mlt20' if trial == "Awasthi 1995/2008"
replace prevalence_exact = `mgt50' if inlist(trial, "Alderman 2006", "Gateff 1972")

	
**## Height Samples ============================================================

/*For replication of TMSDG*/
gen 	TMSDGsampleh = inlist(trial, "Awasthi 1995/2008", ///
									 "Awasthi 2000", ///
									 "Awasthi 2001", ///
									 "Donnen 1998", ///
									 "Dossa 2001a", ///
									 "Dossa 2001b", ///
									 "Kruger 1996a", ///
									 "Watkins 1996")
lab var TMSDGsampleh "TMSDG's height sample"


/*Inlcuding more studies and comparisons (and making some changes)*/
gen 	moreh = inlist(trial, 	"Kruger 1996b", ///
								"Stephenson 1993", ///
								"Stoltzfus 1997a", ///
								"Stoltzfus 1997b", ///
								"Gupta 1982a", ///
								"Gupta 1982b", ///
								"Joseph 2015", ///
								"Ostwald 1984", ///
								"Liu 2017") | ///
				inlist(trial, 	"Wiria 2013", ///
								"Ndibazza 2012", ///
								"Hall 2006", ///
								"Carmona-Fonseca 2015a", ///
								"Carmona-Fonseca 2015b")
lab var moreh "Additional estimates on (raw) height"

* Get final values -------------------------------------------------------------

foreach var in peheight seheight nheightc nheightt {
	
	* Values from Taylor-Robinson (2019)
	gen `var'2 = `var'_c2 if inlist(trial, "Kruger 1996a", "Kruger 1996b", "Liu 2017", "Stephenson 1993")
	
	* Values from original paper
	replace `var'2 = `var' if moreh == 1 & missing(`var'2)
	
	if inlist("`var'", "pheight", "seheight") {
		replace `var'2 = `var' if trial == "Awasthi 2001"
	}
	
	* Values from Taylor-Robinson (2015)
	* Kruger 1996a SE and PE values are different on our data extraction and T-R (2015), likely due to a difference in round on their data extraction
	replace `var'2 = `var'_c if TMSDGsampleh == 1 & missing(`var'2) 
}
 
/*
Missing (with height data):

- Goto 2009 (Not ITT);
- Miguel 2004 (baseline imbalance and only endline comparison is possible);
- Bhoite 2012 (3 treatments 3 clusters)
- Rousham 1994 HAZ
- Hadju 1997 HAZ (no variance)
*/

label var peheight2 "Final point estimate of deworming on child height (cm)"
label var seheight2 "Final S.E. of the effect of deworming on child height (cm)"
label var nheightt2 "Final number of observations in treatment group for height analysis"
label var nheightc2 "Final number of observations control group for height analysis"

**## Weight Samples ============================================================

/*For replication of TMSDG*/
gen 	TMSDGsamplew = inlist(trial, "Awasthi 1995/2008", ///
									 "Awasthi 2000", ///
									 "Awasthi 2001", ///
									 "Donnen 1998", ///
									 "Dossa 2001a", ///
									 "Dossa 2001b", ///
									 "Kruger 1996a", ///
									 "Watkins 1996", ///
									 "Hall 2006") | ///
					   inlist(trial, "Sur 2005", ///
									 "Alderman 2006")
lab var TMSDGsamplew "TMSDG's weight sample"

**## Including more studies and comparisons (and making some changes) ==========
gen 	morew1 = 0
lab var morew1 "Additional estimates on (raw) weight incorporated in NBER paper"

* Not mentioned in TMSDG (Appendix A.2) ----------------------------------------
replace morew1 = 1 if inlist(trial, "Joseph 2015", ///
									"Liu 2017", ///
									"Ostwald 1984", ///
									"Gateff 1972")

* Mentioned in TMSDG, but omitted (Appendix A.3) -------------------------------
replace morew1 = 1 if inlist(trial, "Willett 1979", ///
									"Miguel 2004", ///
									"Ndibazza 2012", ///
									"Wiria 2013", ///
									"Stephenson 1993", ///
									"Gupta 1982a", ///
									"Gupta 1982b")

* Additional studies/comparisons -----------------------------------------------
gen 	morew2 = inlist(trial,  "Kruger 1996b", ///
								"Stoltzfus 1997a", ///
								"Stoltzfus 1997b", ///
								"Carmona-Fonseca 2015a", ///
								"Carmona-Fonseca 2015b")
lab var morew2 "Additional estimates on (raw) weight not in NBER paper"

* Get final values -------------------------------------------------------------

foreach var in peweight seweight nweightc nweightt {
	
	* Values from Taylor-Robinson (2019)
	gen `var'2 = `var'_c2 if inlist(trial, "Kruger 1996a", "Kruger 1996b", "Miguel 2004", "Stephenson 1993")
	
	* Values from original paper
	replace `var'2 = `var' if (inlist(trial, "Awasthi 2001", "Hall 2006", "Sur 2005") | ///
							   morew1 == 1 | morew2 == 1) & ///
							   missing(`var'2)
	

	* Values from Taylor-Robinson (2015)
	* Kruger 1996a SE and PE values are different on our data extraction and T-R (2015), likely due to a difference in round on their data extraction
	replace `var'2 = `var'_c if TMSDGsamplew == 1 & missing(`var'2) 
}

/*
Missing (with height data):
- Goto 2009 (Not ITT);
- Bhoite 2012 (3 treatments 3 clusters)
- Rousham 1994 HAZ
- Hadju 1997 HAZ (no variance)
*/

label var peweight2 "Final point estimate of deworming on child weight (kg)"
label var seweight2 "Final S.E. of the effect of deworming on child weight (kg)"
label var nweightt2 "Final number of observations in treatment group for weight analysis"
label var nweightc2 "Final number of observations control group for weight analysis"

**## MUAC Samples ==============================================================

* For replication of TMSDG -----------------------------------------------------
gen 	TMSDGsamplem = inlist(trial, "Dossa 2001a", ///
									 "Dossa 2001b", ///
									 "Donnen 1998", ///
									 "Watkins 1996")
lab var TMSDGsamplem "TMSDG's MUAC sample"

* Including more studies and comparisons ---------------------------------------
gen 	morem = inlist(trial, "Hall 2006", ///
							  "Rousham 1994", ///
							  "Stephenson 1993")
lab var morem "Additional estimates on MUAC"

* Getting final values ---------------------------------------------------------

foreach var in pemuac semuac nmuact nmuacc {
	
	* Use values from Taylor-Robinson 2015 when available
	gen 	`var'2 = `var'_c if TMSDGsamplem == 1
	
	* Use values from Taylot-Robinson 2019 for Stephenson 1993
	replace `var'2 = `var'_c2 if trial == "Stephenson 1993"
	
	* Use values from paper for all new studies, except Stephenson 1993
	replace `var'2 = `var' if morem == 1 & missing(`var'2)
	
}

/*
Missing (with muac data):
- Hadju 1997, no measure of variance
*/

label var pemuac2 "Final point estimate of deworming on MUAC (cm)"
label var semuac2 "Final S.E. of the effect of deworming on MUAC (cm)"
label var nmuact2 "Final number of observations in treatment group for MUAC analysis"
label var nmuacc2 "Final number of observations control group for MUAC analysis"
	
**## Hemoglobin Samples ========================================================

*For replication of TMSDG ------------------------------------------------------
gen 	TMSDGsamplehem =  inlist(trial, "Dossa 2001a", ///
										"Dossa 2001b", ///
										"Le Huong 2007a", ///
										"Kruger 1996a", ///
										"Awasthi 2000", ///
										"Goto 2009", ///
										"Kirwan 2010", ///
										"Ndibazza 2012")
										
lab var TMSDGsamplehem "TMSDG's hemoglobin sample"

* Including more studies and comparisons (and making some changes) -------------

gen 	morehem = inlist(trial, "Kruger 1996b", ///
								"Liu 2017", ///
								"Le Huong 2007b", ///
								"Ostwald 1984", ///
								"Carmona-Fonseca 2015a", ///
								"Carmona-Fonseca 2015b")
								
lab var morehem "Additional estimates on hemoglobin"

foreach var in pehemob sehemob nhemobc nhemobt {
	
	* Values from Taylor-Robinson (2019)
	gen `var'2 = `var'_c2 if inlist(trial, "Ndibazza 2012", "Kruger 1996b")
	
	* Values from original paper
	replace `var'2 = `var' if (inlist(trial, "Awasthi 2000", "Kirwan 2010") | ///
							   morehem == 1) & ///
							   missing(`var'2)
	

	* Values from Taylor-Robinson (2015)
	* Kruger 1996a SE and PE values are different on our data extraction and T-R (2015), likely due to a difference in round on their data extraction
	replace `var'2 = `var'_c if TMSDGsamplehem == 1 & missing(`var'2) & trial != "Goto 2009"
}

label var pehemob2 "Final point estimate of deworming on hemoglobin (g/dl)"
label var sehemob2 "Final S.E. of the effect of deworming on hemoglobin (g/dl)"
label var nhemobt2 "Final number of observations in treatment group for hemoglobin analysis"
label var nhemobc2 "Final number of observations control group for hemoglobin analysis"

/*
Missing (with hemob data):
- Bhoite 2012, 3 arms 2 clusters
- Stoltzfus 2001 no variance for hemoglobin
*/


***## Final sample vars ========================================================

gen moreweight 		  = morew1 + morew2
gen moremuac   		  = morem
gen moreheight 		  = moreh
gen morehemob  		  = morehem
gen TMSDGsampleweight = TMSDGsamplew
gen TMSDGsamplemuac   = TMSDGsamplem
gen TMSDGsampleheight = TMSDGsampleh
gen TMSDGsamplehemob  = TMSDGsamplehem

**## Up to 1999 ================================================================

gen pre2000 = inlist(trial, "Awasthi 1995/2008", ///
							"Donnen 1998", ///
							"Kruger 1996a", ///
							"Kruger 1996b", ///
							"Gateff 1972", ///
							"Gupta 1982a", ///
							"Gupta 1982b", ///
							"Hadju 1997", ///
							"Ostwald 1984") | ///
			  inlist(trial, "Rousham 1994", ///
							"Stephenson 1993", ///
							"Stoltzfus 1997a", ///
							"Stoltzfus 1997b", ///
							"Watkins 1996", ///
							"Willett 1979")

**# Save data ******************************************************************

iesave "${data}/raw/mda.dta", replace idvars(trial) version(14) report

********************************************************************************