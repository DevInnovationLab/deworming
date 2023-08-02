	use "${data}/main/mda_tt.dta", clear
	
	
	foreach var of global outcomes {
		foreach estimate in pe se {
			gen 	`estimate'`var'3 = `estimate'`var'_c2
			replace `estimate'`var'3 = `estimate'`var'2 	if missing(`estimate'`var'3)
		}
	}
	
	foreach prevalence in "" "& Prevalence2 == 2" {
		
		if missing("`prevalence'")  local table all
		else						local table highprev
		
		cap mat drop col
		cap mat drop res 
		cap mat drop table
	
		foreach var of global outcomes {
			foreach effect in random fixed {
				
				cap mat drop col
				
				foreach sample in "(TMSDGsample`var' == 1 | more`var' == 1) & mda == 1" /// our sample
								  "(TMSDGsample`var' == 1) & (mda == 1)" { // Taylor-Robinson sample 
								  
					foreach estimates in "pe`var'2 se`var'2" /// our estimates
										 "pe`var'3 se`var'3" { // Taylor-Robinson estimates
							
							* Our estimates on our studies
							metan `estimates' if `sample' `prevalence', `effect' nograph
							
							matrix res = J(5, 1, .)
							
							matrix res[1, 1] = r(ES)
							matrix res[2, 1] = r(seES)
							matrix res[3, 1] = r(p_z) /*disp normal(-abs(r(ES)/r(seES)))*2*/
							matrix res[4, 1] = 1 - normal(r(ES)/r(seES))
							matrix res[5, 1] = r(df)+1
							
							capture confirm matrix col
							if _rc	matrix col = res
							else	matrix col = (col \ res)
							
						}
					}
					
					capture confirm matrix table
					if _rc	matrix table = col
					else	matrix table = (table, col)
				}
			}
			
		estout matrix(table) using "${output_tables}/test_samples_`table'.csv", replace delimiter(",")
			
	}
