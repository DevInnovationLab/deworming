insheet using "${data}/raw/Campbell_weight_extraction_2017Jul9.csv", c clear

	*** Preamble ***

		*Need to combine Hadju 1997a (Albendazole std vs placebo) with Hadju 1997c (pyrantel standard vs placebo)
		set obs 48
		replace study_name="Hadju 1997ac" in 48
		replace mean_treat= (0.01*69 + 0.08*61)/(69+61) in 48
		local n1=69
		local n2=61
		local m1=0.01
		local m2=0.08
		local sd1=0.71560001
		local sd2=0.6728
		local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
		local sd=(`num'/(`n1'+`n2'-1))^0.5
		replace sd_treat=`sd' in 48
		replace n_treat=69+61 in 48
		replace mean_control= 0.02 in 48
		replace n_control=74 in 48
		replace sd_control=.74110001 in 48

	gen peweightC=mean_treat-mean_control
	gen seweightC=((sd_treat^2)/n_treat+(sd_control^2)/n_control)^0.5
	gen sd_total=seweightC/(1/n_treat + 1/n_control)^0.5

	gen speweightC=peweightC/sd_total
	gen sseweightC=seweightC/sd_total
	
	gen outcome = "weight"
	
	tempfile weight
	save 	`weight'
	*** Panel B: Height ***
	insheet using "${data}/raw/Campbell_height_extraction_2017Jul9.csv", c clear

	************
	* Preamble *
		*Need to combine Hadju 1997a (Albendazole std vs placebo) with Hadju 1997c (pyrantel standard vs placebo)
		set obs 38
		replace study_name="Hadju 1997ac" in 38
		replace mean_treat= (0.01*69 + 0.04*61)/(69+61) in 38
		local n1=69
		local n2=61
		local m1=0.01
		local m2=0.04
		local sd1=0.50650001
		local sd2=0.47620001
		local num=(`n1'-1)*`sd1'^2 + (`n2'-1)*`sd2'^2 + ((`n1'*`n2')/(`n1'+`n2'))*(`m1'^2 + `m2'^2 - 2*`m1'*`m2')
		local sd=(`num'/(`n1'+`n2'-1))^0.5
		replace sd_treat=`sd' in 38
		replace n_treat=69+61 in 38
		replace mean_control= 0.01 in 38
		replace n_control=74 in 38
		replace sd_control=0.52429998 in 38

	gen peheightC=mean_treat-mean_control
	gen seheightC=((sd_treat^2)/n_treat+(sd_control^2)/n_control)^0.5
	gen sd_total=seheightC/(1/n_treat + 1/n_control)^0.5

	gen speheightC=peheightC/sd_total
	gen sseheightC=seheightC/sd_total
	gen outcome = "height"
	************
	
	append using `weight'
	
	* Main Comparison
	gen ts3_group1 = ///
		group_welch=="Albendazole std vs placebo" & study_name!="Koroma 1996" & study_name!="Stephenson 1989"
	* Main Comparison + Other deworming drugs std freq. (all drugs, std. freq)//
	* Combines 2 deworming arms in Hadju 1997.
	gen ts3_group2 = ///
		(group_welch=="Albendazole std vs placebo" & study_name!="Koroma 1996" & study_name!="Stephenson 1989" & study_name!="Hadju 1997a") ///
		| study_name=="Hadju 1997ac" | study_name=="Joseph 2015a" | study_name=="Stoltzfus 1997a" | study_name=="Gateff 1972"
	* Main Comparison + Albendazole other freq. (alb all freqs.) //
	* Excludes estimates from low or high frequencies, when a standard frequency for albendazole was available
	gen ts3_group3 = ///	
		(group_welch=="Albendazole std vs placebo" & study_name!="Koroma 1996" & study_name!="Stephenson 1989") ///
		| study_name=="Kruger 1996" | study_name=="Ndibazza 2012" | study_name=="Watkins 1996" | study_name=="Wiria 2013"
	* Main Comparison + Vit A cointervention + Miguel 2004 //
	gen ts3_group4 = ///
		(group_welch=="Albendazole std vs placebo" & study_name!="Koroma 1996" & study_name!="Stephenson 1989") ///
		| group_welch=="Alben std + vitamin A vs vitamin A" | group_welch=="Alben std + hygiene education vs placebo"
	* Main Comparison + Kormoma 1996 + Stephenson 1989 //
	gen ts3_group5 = group_welch=="Albendazole std vs placebo"
	* Main Comparison + All drugs all frequencies  + Kormoma 1996 + Stephenson 1989 + Vit A + MK2004 //
	gen ts3_group6 = ///
		(group_welch=="Albendazole std vs placebo" & study_name!="Hadju 1997a") ///
		| study_name=="Hadju 1997ac" | study_name=="Donnen 1998" | study_name=="Garg 2002" | study_name=="Gateff 1972" ///
		| study_name=="Greenberg 1981" | study_name=="Gupta 1982a" | study_name=="Joseph 2015a" | study_name=="Kruger 1996" ///
		| study_name=="Ndibazza 2012" | study_name=="Ostwald 1984" | study_name=="Rousham 1994" | study_name=="Stoltzfus 1997a" ///
		| study_name=="Watkins 1996" | study_name=="Willett 1979"| study_name=="Wiria 2013" ///
		| group_welch=="Alben std + hygiene education vs placebo"

	iesave "${data}/main/campbell.dta", version(14) idvars(study_name outcome) report replace