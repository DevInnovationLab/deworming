* This programs reads output from Stan and organizes stats in tables
local para  = "theta_new"
local para2 = "alpha"
local para3 = "mean_effect"


		*save all results
local counter = 1
foreach outcome in "weight (kg)" "height (cm)" "Haemoglobin (g per dL)" "mid-upper arm circumference (cm)" {
	
	disp "we're now doing..."
	disp "`outcome'"
	
	if "`outcome'"=="weight (kg)" {
		local AllModels = "`AllWeightModels'"
	}
	else if "`outcome'"=="height (cm)" {
		local AllModels = "`AllHeightModels'"
	}
	else if "`outcome'"=="Haemoglobin (g per dL)" {
		local AllModels = "`AllHemoModels'"
	}
	else if "`outcome'"=="mid-upper arm circumference (cm)" {
		local AllModels = "`AllMuacModels'"
	}
	
	foreach model in 5a_halfnormal_uni 6a_skewnormal_uni {
	
		*get stats of posterior distribution
		********************************************
		import delimited using "${output_stan}/`outcome' - `model' - allstats.csv", clear
		ds
		
		cap rename statname parameter
		keep if parameter=="`para'" | parameter=="`para2'" | parameter=="`para3'"
		
		cap rename x25  p2_5
		cap rename v5   p25
		cap rename x50   p50 
		cap rename x75   p75
		cap rename x975 p97_5
		
		local StatsToKeep mean sd p2_5 p25 p50 p75 p97_5 den_below_zero mean_conditional_on_pos mean_conditional_on_neg
		keep parameter `StatsToKeep'
		foreach s in `StatsToKeep' {
			cap destring `s', replace force
		}
		
		
		*add variables to identify these results
		******************************************
		gen model       = "`model'"
		gen outcome     = "`outcome'"
		
		tempfile R`counter'
		save `R`counter'', replace
		local counter = `counter'+1
	}
}


*aggregate all results that were saved above
********************************************
use `R1', clear
forvalues i=2/`=`counter'-1' {
	disp "we're now on `i'"
	append using `R`i''
}


*add descriptions of each model
*******************************
gen     model_desc = ""
replace model_desc = "Diffuse prior for mu, known tau"          if regexm(model,"info_dl_uni")==1
replace model_desc = "Diffuse priors for mu and tau"            if regexm(model,"non_info_uni")==1
replace model_desc = `""Realistic" prior for mu, diffuse tau"'  if regexm(model,"info_realistic_uni")==1

replace model_desc = "Half-normal distribution; diffuse priors" if regexm(model,"halfnormal_uni")==1
replace model_desc = "Log-normal distribution; diffuse priors"  if regexm(model,"lognorm")==1
replace model_desc = "Skew-normal distribution; diffuse priors"  if regexm(model,"skewnormal")==1

forvalues i1=0/10 {
	local i2 = `i1'/10
	local i3 = subinstr("`i2'", ".", "0.", .)
	replace model_desc = "Known tau; Pr(diffuse mu)=`i3'; Pr(pessimistic mu)=`=1-`i3''"  if model=="2e_pess_dl_`i3'"
	replace model_desc = "Known tau; Pr(diffuse mu)=`i3'; Pr(very pessimistic mu)=`=1-`i3''"  if model=="2e_pess_moresure_`i3'"
}

order outcome model model_desc parameter `StatsToKeep'
foreach v in mean sd p2_5 p25 p50 p75 p97_5 {
	format `v' %8.3f
}

*re-sort and export
gen     pess = regexs(2) if regexm(model, "(pess_dl_)([0-9]*\.*[0-9]*)")==1
replace pess = regexs(2) if regexm(model, "(pess_moresure_)([0-9]*\.*[0-9]*)")==1
destring pess, replace

gen     tmp = -3 if model_desc=="Diffuse prior for mu, known tau"
replace tmp = -2 if model_desc=="Diffuse priors for mu and tau"
replace tmp = -1 if model_desc==`""Realistic" prior for mu, diffuse tau"'
replace tmp = 1-pess  if tmp==. & regexm(model, "(pess_dl_)([0-9]*\.*[0-9]*)")==1
replace tmp = 10-pess if tmp==. & regexm(model, "(pess_moresure_)([0-9]*\.*[0-9]*)")==1

sort outcome tmp
drop tmp pess

gen     tmp = _n   if regexm(model,"halfnormal_uni")!=1 & regexm(model,"lognorm")!=1 & regexm(model,"skewnormal")!=1
replace tmp = 1001 if regexm(model,"lognormal")==1 
replace tmp = 1002 if regexm(model,"halfnormal")==1 
replace tmp = 1003 if regexm(model,"skewnormal")==1 
gsort tmp -outcome
drop tmp 

*format the data to be outputted
order outcome model_desc mean sd p2_5 p25 p50 p75 p97_5
foreach v in mean sd p2_5 p25 p50 p75 p97_5 {
	format `v' %10.5f
	replace `v' = round(`v',0.001)
}

keep outcome model_desc mean sd parameter

replace outcome = "weight" if regex(outcome, "weight")
replace outcome = "height" if regex(outcome, "height")
replace outcome = "hemob" if regex(outcome, "Hae")
replace outcome = "muac" if regex(outcome, "mid-")

reshape wide mean sd, i(model_desc parameter) j(outcome) string
reshape long @height @weight @hemob @muac, i(model_desc parameter) j(stat) string

drop if parameter == "theta_new"
order model_desc weight muac height hemob

gsort -parameter model_desc stat

drop parameter stat

export delimited using "${output_tables}/tableS8.csv",  replace
export excel 	 using "${output}/Formatted tables.xlsx", sheet("ts8_raw") sheetreplace

********************************************************************************