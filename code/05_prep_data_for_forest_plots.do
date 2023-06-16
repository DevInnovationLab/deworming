********************************************************************************

	use "${data}/main/mda_tt.dta", clear

	rename trial study

	rename  (pe*2 se*2) (pe*2_tt se*2_tt)
	reshape long peweight2 pemuac2 peheight2 pehemob2 seweight2 semuac2 seheight2 sehemob2, i(study) j(type) string
	reshape long pe@2 se@2 n@t2 n@c2 n@t n@c TMSDGsample more, i(study type) j(outcome) string
	
	local weightlab = "weight (kg)"
	local muaclab =   "mid-upper arm circumference (cm)"
	local heightlab = "height (cm)"
	local hemoblab  = "Haemoglobin (g/dL)"

	foreach outcome in weight muac height hemob {
		replace outcome = "``outcome'lab'" if outcome == "`outcome'"
	}

	rename (pe2 se2) (mean_diff	se_mean_diff)
	
	rename prevalence prevalence_str
	rename prevalence_exact prevalence
	rename lengthfu	followup_length
	gen clustered = (N == "clusters")
	
	drop N
	gen N = nt2 + nc2
	replace N = nt + nc if missing(N)
	
		
	replace mda = (TMSDGsample == 1 | more == 1) & (prevalence >= 0)
	
	gen 	group = "mda" 	 		if (mda == 1) & (type == "_mda")
	replace group = "tt"  	 		if (mda == 0) & (type == "_tt")
	replace group = "tt_pw"  		if (mda == 0) & (type == "_pw")
	replace group = "mda_pw"  		if (mda == 1) & (type == "_pw")
	replace group = "mda_infected"  if (mda == 1) & (type == "_inf")
	
	drop if missing(group)
	drop if missing(mean_diff)
	drop if study == "Stephenson 1993 1d (I)"

	gen 	prevalence_high = (prevalence > .2) & !missing(prevalence)
	
	keep outcome study group mean_diff se_mean_diff country N clustered followup_length prevalence_high prevalence //preschool	
			
	outsheet using "${data}/main/mda_tt_long.csv", comma names replace

********************************************************************************