**********************************************************************
*** Implied effects on infected children and per unit of worm load ***
**********************************************************************
clear


*** Adding data of effect on infected children: single dose ***
gen infected=0
gen screen=0
gen prevalence_screened=.
gen trial=""
gen peweight2=.
gen seweight2=.
gen peheight2=.
gen seheight2=.
gen pehemob2=.
gen sehemob2=.
gen pemuac2=.
gen semuac2=.
gen prevalence_exact=.
gen country = ""

count
local old_N=r(N)
local new_N=r(N)+7
set obs `new_N'

local count=`old_N'+1
replace trial="Yap 2014 (I)" in `count'
replace peweight2=0.3 in `count'
replace seweight2=((1.2435^2)/99+(1.2435^2)/95)^0.5 in `count'
replace peheight2=3.5-3.3 in `count'
replace seheight2=((0.8881^2)/99+(0.8881^2)/95)^0.5 in `count'
replace pehemob2=-1.3-(-0.9) in `count'
replace sehemob2=((3.01959^2)/99+(3.01959^2)/95)^0.5 in `count'
replace prevalence_exact=(211/213)*((44+48+47+44)/(99+95)) in `count' /* 211/213=99% infected with some worm, of them, (44+48+47+44)/(99+95) with trichuris */
replace prevalence_screened=(44+48+47+44)/(99+95) in `count' /*for Trichuris among infected children */
replace infected=1 in `count'
replace screen=1 in `count'
replace country = "Myanmar, China" in `count'

local count=`count'+1
replace trial="Stephenson 1989 (I)" in `count'
replace peweight2=1.3 in `count'
replace seweight2=((0.79^2)/78+(0.85^2)/72)^0.5 in `count'
replace peheight2=2.8-2.2 in `count'
replace seheight2=((0.79^2)/78+(0.85^2)/72)^0.5 in `count'
replace pemuac2=0.7-0.2 in `count'
replace semuac2=((0.44^2)/78+(0.51^2)/72)^0.5 in `count'
replace prevalence_exact=0.97 in `count' /* No screening, but at baseline 97% infected with trichuris */
replace infected=1 in `count'
replace screen=0 in `count'
replace country = "Kenya" in `count'

local count=`count'+1
replace trial="Sarkar 2002 (I)" in `count'
replace peweight2=0.38 in `count'
replace seweight2=((0.84^2)/40+(0.45^2)/41)^0.5 in `count'
replace peheight2=1.2-1.1 in `count'
replace seheight2=((1.5^2)/40+(0.7^2)/41)^0.5 in `count'
replace prevalence_exact=234/298 in `count' /* "298 children aged 2 to 12 years were identified and of them 234 (78.5%) had roundworm infestation" */
replace prevalence_screened=1 in `count' /* All infected with ascaris */
replace infected=1 in `count'
replace screen=1 in `count'
replace country = "Bangladesh" in `count'

local count=`count'+1
replace trial="Freij 1979a (I)" in `count'
replace peweight2=0.2 in `count'
replace seweight2=((2.91^2)/6+(2.29^2)/7)^0.5 in `count'
replace pemuac2=14.5-14.8 in `count'
replace semuac2=((1.13^2)/6+(1.44^2)/7)^0.5 in `count'
replace prevalence_exact=45/92 in `count' /* As per test */
replace prevalence_screened=1 in `count' /* All infected with ascaris */
replace infected=1 in `count'
replace screen=1 in `count'
replace country = "Ethiopia" in `count'

local count=`count'+1
replace trial="Freij 1979b (I)" in `count'
replace pemuac2=14.6-14.5 in `count'
replace semuac2=((1.2^2)/24+(1.1^2)/20)^0.5 in `count'
replace prevalence_exact=45/92 in `count' /* As per test */
replace prevalence_screened=1 in `count' /* All infected with ascaris */
replace infected=1 in `count'
replace screen=1 in `count'
replace country = "Ethiopia" in `count'

local count=`count'+1
replace trial="Stephenson 1993 1d (I)" in `count'
replace peweight2=1.1 in `count'
replace seweight2=((1.76^2)/96+(1.16^2)/93)^0.5 in `count'
replace peheight2=3.8-3.7 in `count'
replace seheight2=((1.18^2)/96+(1.16^2)/93)^0.5 in `count'
replace pemuac2=0.8-0.3 in `count'
replace semuac2=((0.49^2)/96+(0.39^2)/93)^0.5 in `count'
replace pehemob2=-0.2-(-0.6) in `count'
replace sehemob2=((0.6^2)/27+(0.5^2)/26)^0.5 in `count'
replace prevalence_exact=.88 in `count'	/* No screening. */
replace infected=1 in `count'
replace screen=0 in `count'

local count=`count'+1
replace trial="Tee 2013 (I)" in `count'
replace peheight2=6.2-6.3 in `count'
replace seheight2=((1.2^2)/15+(1.1^2)/18)^0.5 in `count'
replace prevalence_exact=(37/242)*2 in `count' /*Positive with trichuris and negative for other worms. Rate of trichuris to trichuris and something elese is 1:2 (as pointed out by Dr. Tee: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3326951/ */
replace prevalence_screened=1 in `count' /* All infected with ascaris */
replace infected=1 in `count'
replace screen=1 in `count'
replace country = "Malaysia" in `count'

iesave "${data}/raw/tt.dta", replace idvars(trial) version(14) report

********************************************************************************