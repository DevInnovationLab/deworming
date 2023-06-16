**********************************************************************
*** Implied effects on infected children and per unit of worm load ***
**********************************************************************

use "${data}/raw/mda.dta", clear

gen infected=0
gen screen=0

append using "${data}/raw/tt.dta"
gen mda = (infected==0) 

*** Average worm loads ***
* Estimating worm load in the study populations
		** Average Anderson: 0.5714; Elkins 1986 0.8; taylor expansion with weight: 0.72 (ERIC--This is the new number, it used to be 0.73). 
local k=0.5714
*local k = 0.72104992
*local k = 0.73

gen worms=((1-prevalence_exact)^(-1/`k')-1)*`k' if prevalence_exact!=1
gen p_s=1-(1-prevalence_exact)^(1/`k')

* Estimating worm load among infected children
gen worms_infected=worms/prevalence_exact
	
*** Going back to prevalence ***
*Probability of 0 successes, before r failures, where prob of success if p
gen s_uninfected=1-ibeta(0+1,`k',p_s)
gen s_infected=ibeta(0+1,`k',p_s)
********************************		

foreach var in peweight2 seweight2 peweight_c seweight_c peheight2 seheight2 peheight_c seheight_c pemuac2 semuac2 pemuac_c semuac_c pehemob2 sehemob2 pehemob_c sehemob_c{

	* Implied effects on infected children	
	gen `var'_inf=`var'/prevalence_exact if infected==0 | (infected==1 & screen==0)
	replace `var'_inf=`var' if infected==1 & screen==1
	
	* Effect per worm in the study population
	gen `var'_pw=`var'/worms if infected==0 | (infected==1 & screen==0)
	replace `var'_pw=(`var'*prevalence_exact)/worms if infected==1 & screen==1 
		*(Need to multiply be prevalence first to get to the average effect on the population)
	
	*Implied MDA effect (for test and treat trials)
	gen `var'_mda=`var' if infected==0 | (infected==1 & screen==0)
	replace `var'_mda=`var'*prevalence_exact if infected==1 & screen==1
}
	

foreach var in weight height muac hemob{	
	* This is just to add data on those infected to the analysis based on TMSDG's original data
	replace pe`var'_c_inf= pe`var'2_inf if infected==1
	replace se`var'_c_inf= se`var'2_inf if infected==1
	replace pe`var'_c_pw= pe`var'2_pw   if infected==1
	replace se`var'_c_pw= se`var'2_pw   if infected==1
}

* remove Goto (2009) from the sample for this meta-analysis
replace mda = . if trial == "Goto 2009"

iesave "${data}/main/mda_tt.dta", replace idvars(trial) version(14) report

********************************************************************************