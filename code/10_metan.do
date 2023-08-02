********************************************************************************
**# Table 1: Summary of treatment effects and prevalence of worms in included studies
********************************************************************************
{
	
	use "${data}/main/mda_tt.dta", clear
	
	keep if ((TMSDGsampleweight | TMSDGsamplemuac | TMSDGsampleheight | TMSDGsamplehemob) & mda == 1) | ///
	        ((moreweight | moremuac | moreheight | morehemob) & mda == 1) | ///
		    (infected == 1 & trial != "Stephenson 1993 1d (I)")

	local vars peweight seweight peheight seheight pemuac semuac pehemob sehemob

	foreach var of local vars {
		replace `var' = `var'_c if !missing(`var'_c)
		replace `var' = `var'2 	if mda == 0
	}

	keep 	mda trial `vars' prevalence_exact
	reshape long @weight @height @muac @hemob, i(trial) j(stat) string
	encode stat, gen(order)

	replace trial = subinstr(trial, " (I)", "", .)

	replace mda = 1 - mda
	sort 	mda trial order

	replace prevalence_exact = . 	if order == 2
	replace trial = "" 				if order == 2
	drop mda order stat

	export delimited using "${output_tables}/table1.csv", replace
	export excel 	 using "${output_tables}/table1.xls", replace
}
********************************************************************************
**# Table 2: Random-effects and fixed-effect estimates
********************************************************************************
{
	use "${data}/main/mda_tt.dta", clear

	matrix R=J(36, 11, .)

	local j 1
	foreach var in weight muac height hemob {
		foreach effect in random fixed {
			local i 1
			foreach condition in "(TMSDGsample`var' == 1 | more`var' == 1) & mda == 1" ///
								 "(TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & Prevalence2 == 1" ///
								 "(TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & Prevalence2 == 2" ///
								 "(TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & Prevalence  == 3" ///
								 `"(infected == 1 & trial != "Stephenson 1993 1d (I)")"' ///
								 `"((TMSDGsample`var' == 1 | more`var' == 1) & mda == 1) | (infected == 1 & trial != "Stephenson 1993 1d (I)")"' {

				metan pe`var'2 se`var'2 if `condition', `effect' nograph

				matrix R[`i',`j']=r(ES)
				local ++i
				matrix R[`i',`j']=r(seES)
				local ++i
				matrix R[`i',`j']=r(p_z) /*disp normal(-abs(r(ES)/r(seES)))*2*/
				local ++i
				matrix R[`i',`j']=1-normal(r(ES)/r(seES))
				local ++i
				matrix R[`i',`j']=r(df)+1
				local ++i
				local ++i
			}

			local ++j
		}
		
		local ++j
	}

	estout matrix(R) using "${output_tables}/table2.csv", replace delimiter(",")
	estout matrix(R) using "${output_tables}/table2.xls", replace
}

* Data for figure 5
{
	use "${data}/main/mda_tt.dta", clear

	matrix 			R = J(2, 4, .)
	matrix colnames R = weight_pe weight_se	height_pe height_se	

	local i 1
	foreach var in weight height {
		metan pe`var'2 se`var'2 if (TMSDGsample`var' == 1 | more`var' == 1) & mda == 1, random nograph
		
		matrix R[1, `i'] = r(ES)
		matrix R[1, `=`i' + 1'] = r(seES)
		
		metan pe`var'2 se`var'2 if (TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & Prevalence2 == 2, random nograph
		
		matrix R[2, `i'] = r(ES)
		matrix R[2, `=`i' + 1'] = r(seES)
		local i = `i' + 2
	}

	clear
	svmat R, names(matcol)
	rename R* *
	gen 	study = "This paper (full sample)" in 1
	replace study = "This paper (>20% Prev.)"  in 2
	
	tempfile thisstudy
	save 	`thisstudy', replace
	
	import delimited "${data}/raw/metaanalysis_data.csv", clear 
	append using  `thisstudy' 
	
	export delimited using "${data}/main/metaanalysis_data.csv", replace 
}
********************************************************************************
**# Table 3: Cost-effectiveness analysis
********************************************************************************
{
	use "${data}/main/mda_tt.dta", clear
	
	local save replace
	foreach condition in "Prevalence2 == 2"  "Prevalence == 3" {
		
		matrix R = J(6,4,.)
		local col = 1

 		foreach var in weight muac height hemob {
			*avg effect
			metan pe`var'2 se`var'2 if (TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & `condition', random nograph
			matrix R[1,`col'] = r(ES)
			
			*avg number of doses
			sum doses if (TMSDGsample`var' == 1 | more`var' == 1) & mda == 1 & `condition'
			matrix R[2,`col'] = r(mean)
			
			*effect per 2 doses
			matrix R[3,`col'] = 2*R[1,`col']/R[2,`col']
			
			*gain per $1000 (medium cost)
			matrix R[4,`col'] = R[3,`col']*1000/(0.34*2)
			
			*gain per $1000 (low cost)
			matrix R[5,`col'] = R[3,`col']*1000/(0.19*2)
			
			*gain per $1000 (high cost)
			matrix R[6,`col'] = R[3,`col']*1000/(0.77*2)
			
			local col = `col'+1
		}
		
		estout matrix(R) using "${output_tables}/table3.csv", delimiter(",") `save'
		local save append
	}
	
	import delimited 	"${output_tables}/table3.csv", clear
	export excel using 	"${output_tables}/table3.xls", replace

}
********************************************************************************
**# Table S2: Statistical power to detect effects that render deworming MDA cost-effective relative to alternative policies
********************************************************************************
{

	cap program drop mde
		program 	 mde, rclass
	
		syntax, alpha(numlist) sebeta(numlist)
		
		local z = invnormal(1 - `alpha'/2)
		
		matrix M = J(1000, 2, .)
		forvalues b = 1/1000 {
			local beta = `b'/1000 
			matrix M[`b', 1] =`beta'
			matrix M[`b', 2] = 1 - normal(`z'-(`beta'/`sebeta')) + normal(-`z'-(`beta'/`sebeta'))
		}

		preserve
		
			clear
			svmat M
			
			qui sum M2 if M2 >= 0.8
			qui sum M1 if M2 == r(min)
			local mde = r(mean)
			mat list M
			mat drop M
			
		restore
	
		return local mde `mde'
		
	end

	use "${data}/main/mda_tt.dta", clear

	matrix A = J(4, 12, .)
	matrix B = J(1, 12, .)
	local i = 1
	
		
	* Panel A	
	foreach outcome of global outcomes {
		
		if 	 ("`outcome'" == "height") 	local effect fixed
		else							local effect random
		
		metan pe`outcome'_c se`outcome'_c if TMSDGsample`outcome' == 1, `effect' nograph lcols(trial)

		local sebeta = r(seES)
	
		matrix A[1, `i'] = r(ES)
		matrix A[2, `i'] = `sebeta'
		matrix A[3, `i'] = r(p_z)
		
		mde, alpha(0.05) sebeta(`sebeta')
		matrix B[1, `i'] = `r(mde)'
	
		sum doses if TMSDGsample`outcome' == 1
		matrix A[4, `i'] = r(mean)
		
		local ++i
	}
	
	foreach condition in "peweight_c2 != ." "peweight_c2 != . & pre2000 == 1" "peweight_c2 != . & pre2000 == 0" {
		
		metan peweight_c2 seweight_c2 if `condition', `effect' nograph lcols(trial)

		local sebeta = r(seES)
	
		matrix A[1, `i'] = r(ES)
		matrix A[2, `i'] = `sebeta'
		matrix A[3, `i'] = r(p_z)
		
		mde, alpha(0.05) sebeta(`sebeta')
		matrix B[1, `i'] = `r(mde)'
		
		sum doses if `condition'
		matrix A[4, `i'] = r(mean)
		
		local ++i
	}
	
	foreach outcome in muac height hemob {
		
		if 	 inlist("`outcome'", "height", "hemob") 	local effect fixed
		else											local effect random
		
		metan pe`outcome'_c2 se`outcome'_c2, `effect' nograph lcols(trial)

		local sebeta = r(seES)
	
		matrix A[1, `i'] = r(ES)
		matrix A[2, `i'] = `sebeta'
		matrix A[3, `i'] = r(p_z)
		
		mde, alpha(0.05) sebeta(`sebeta')
		matrix B[1, `i'] = `r(mde)'
		
		sum doses if pe`outcome'_c2 != .
		matrix A[4, `i'] = r(mean)
		
		local ++i
	}
	
	use "${data}/main/campbell.dta", clear 
	
	foreach outcome in weight height {
		
		metan spe`outcome'C sse`outcome'C if ts3_group1 == 1, random lcols(study_name) nograph
		
		local sebeta = r(seES)
	
		matrix A[1, `i'] = r(ES)
		matrix A[2, `i'] = `sebeta'
		matrix A[3, `i'] = r(p_z)
		
		mde, alpha(0.05) sebeta(`sebeta')
		matrix B[1, `i'] = `r(mde)'
		
		local ++i
	}
		
	mat full = A \ B
	estout matrix(full) using "${output_tables}/tableS2.csv", replace delimiter(",")
	estout matrix(full) using "${output_tables}/tableS2.xls", replace
		
	* For Campbell power calculations, refer to code under Table S3.
}
********************************************************************************
**# Table S3: Relaxing the main category of analysis in Welch et al. (2016)
********************************************************************************
{

	use "${data}/main/campbell.dta", clear 
	
	matrix R=J(9,6,.)

	foreach outcome in weight height {
		local j 1
		forvalues group = 1/6 {
			if ("`outcome'" == "weight") local i 1
			else						 local i 6
			
			metan spe`outcome'C sse`outcome'C if ts3_group`group' == 1, random lcols(study_name) nograph
			matrix R[`i',`j']=r(ES)
			local ++i
			matrix R[`i',`j']=r(seES)
			local ++i
			matrix R[`i',`j']=r(p_z)
			local ++i
			matrix R[`i',`j']=r(df)+1
			local ++i		
			local ++j
			
		}
	}

	estout matrix(R) using "${output_tables}/tableS3.csv", replace delimiter(",")
	estout matrix(R) using "${output_tables}/tableS3.xls", replace

}
********************************************************************************
**# Table S4: Results of the meta-analysis of effects of deworming on infected children
********************************************************************************
{
	use "${data}/main/mda_tt.dta", clear

	matrix R=J(18,7,.)
		
	local j 1
	foreach var in weight muac height hemob { /**/
		local i 1
		foreach condition in "(TMSDGsample`var'==1 | more`var'==1) & prevalence_exact>=0" /// MDA
							 `"(infected==1 & trial!="Stephenson 1993 1d (I)") & prevalence_exact>=0"' /// TT
							 `"((TMSDGsample`var'==1 | more`var'==1) | (infected==1 & trial!="Stephenson 1993 1d (I)")) & prevalence_exact>=0"' { // All
			
			metan pe`var'2_inf se`var'2_inf if `condition', random nograph lcols(trial)
			
			matrix R[`i',`j']=r(ES)
			local ++i
			matrix R[`i',`j']=r(seES)
			local ++i
			matrix R[`i',`j']=r(p_z)
			local ++i
			matrix R[`i',`j']=r(df)+1
			local ++i
			local ++i
		}
		
		* test of difference
		metareg pe`var'2_inf mda if ((TMSDGsample`var'==1 | more`var'==1) | (infected==1 & trial!="Stephenson 1993 1d (I)")) & prevalence_exact>=0, wsse(se`var'2_inf) mm z
		
		matrix R[`i',`j']=_b[mda]
		local ++i
		matrix R[`i',`j']=_se[mda]
		local ++i
		matrix R[`i',`j']=normal(-abs(_b[mda]/_se[mda]))*2
		local ++i
			
		local ++j
		local ++j
	}

	estout matrix(R) using "${output_tables}/tableS4.csv", replace delimiter(",")
	estout matrix(R) using "${output_tables}/tableS4.xls", replace
}

********************************************************************************
**# Table S5: Cost-effectiveness analysis
********************************************************************************
{
	use "${data}/main/mda_tt.dta", clear

	matrix R=J(6,4,.)
	local col=1
	foreach var in weight muac height hemob {
		*avg effect
		metan pe`var'2 se`var'2 if (TMSDGsample`var'==1 | more`var'==1) & mda==1, random nograph
		matrix R[1,`col'] = r(ES)
		
		*avg number of doses
		sum doses if (TMSDGsample`var'==1 | more`var'==1) & mda==1 
		matrix R[2,`col'] = r(mean)
		
		*effect per 2 doses
		matrix R[3,`col'] = 2*R[1,`col']/R[2,`col']
		
		*gain per $1000 (medium cost)
		matrix R[4,`col'] = R[3,`col']*1000/(0.34*2)
		
		*gain per $1000 (low cost)
		matrix R[5,`col'] = R[3,`col']*1000/(0.19*2)
		
		*gain per $1000 (high cost)
		matrix R[6,`col'] = R[3,`col']*1000/(0.77*2)
		
		local col = `col'+1
	}	

	matrix R = R'
	estout matrix(R) using "${output_tables}/tableS5.csv", replace delimiter(",")
	estout matrix(R) using "${output_tables}/tableS5.xls", replace

}
********************************************************************************
**# Table S6: Robustness to exclusion of additional studies
********************************************************************************
{
	use "${data}/main/mda_tt.dta", clear
	
	keep if mda==1
	matrix R=J(24,7,.)
	
	local j 1
	foreach var in weight muac height hemob {
		local i 1
		foreach condition in ///
			"" /// *RE >20% Prevalence
			`"& trial!="Joseph 2015" & trial!="Carmona-Fonseca 2015a" & trial!="Carmona-Fonseca 2015b" & trial!="Liu 2017" & trial!="Ostwald 1984" & trial!="Gateff 1972""' /// "Studies not mentioned in TMSDG"
			`"& trial!="Wiria 2013" & trial !="Stephenson 1993""' /// Misclassified (mentioned) studies
			`"& trial!="Willett 1979" & trial!="Stoltzfus 1997a" & trial!="Stoltzfus 1997b""' /// Mentioned studies not included likely either because s.e. not reported or adjusted estimate only
			`"& trial !="Miguel 2004" & trial!="Ndibazza 2012""' { // Mentioned studies not included likely because report estimate on related measure
				
			metan pe`var'2 se`var'2 if (TMSDGsample`var'==1 | more`var'==1) & Prevalence2==2 `condition', random nograph
			
			matrix R[`i',`j']=r(ES)
			local ++i
			matrix R[`i',`j']=r(seES)
			local ++i
			matrix R[`i',`j']=r(p_z) /*disp normal(-abs(r(ES)/r(seES)))*2*/
			local ++i
			matrix R[`i',`j']=r(df)+1
			local ++i
			local ++i			
		}
		local ++j
		local ++j
	}	
	
	estout matrix(R) using "${output_tables}/tableS6.csv", replace delimiter(",")
	estout matrix(R) using "${output_tables}/tableS6.xls", replace

}
********************************************************************************