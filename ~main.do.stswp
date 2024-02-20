/*******************************************************************************
 This file runs all the codes to replicate the analysis reported in the paper.
 To run it, change the globals "github" and "Rterm_path" to reflect the file
 paths to the 'deworming' repository and to the R installation in your computer
********************************************************************************
				PART 1:  PREPARING FOLDER PATH GLOBALS
*******************************************************************************/

	* Users
    * -----
	global github "C:/Users/luizaandrade/Documents/GitHub/deworming" // <---------------------- Replace with the location of the deworming github repo in your computer --------------------
		
	* Project folder globals
	* ---------------------
	global code               "${github}/code"
	global data               "${github}/data"
	global output			  "${github}/output"
	global output_figures     "${output}/figures"
	global output_tables      "${output}/tables"
	global output_stan        "${output}/stan"
   
    * Find community-contributed commands in GitHub
	* ----------------------------------------------
	* These commands will only be downloaded to the root folder of the repository
	* and will only be available in Stata if the sysdir and adopath lines below
	* are run
	sysdir set  PLUS "${code}/ado"

		adopath ++  PLUS
		adopath ++  BASE
	cap adopath - OLDPLACE
   
	* rsource settings
	* ---------------------
	cd "${github}" // this is necessary for rsource
   
	global Rterm_options `"--vanilla"'
	global Rterm_path `"C:\Program Files\R\R-4.2.3\bin\R.exe"' // <---------------------- Replace with the location of Rterm.exe or R.exe in your computer --------------------
   
	global outcomes weight muac height hemob
	
********************************************************************************
*     		 PART 2: RUN DOFILES CALLED BY THIS MASTER DOFILE
********************************************************************************

/*******************************************************************************
* 	Data entry scripts
--------------------------------------------------------------------------------
	These scripts create data sets with the relevant information about each study
	in the sample. 
*******************************************************************************/

	*------------------------------------
	* 1 - Creating dataset of MDA trials
	*------------------------------------
	* CREATES: 	${data}/raw/mda.dta
	do "${code}/01_mda_data_entry.do"
	
	*-----------------------------------------------
	* 2 - Creating dataset of test and treat trials
	*-----------------------------------------------
	* CREATES: 	${data}/raw/tt.dta
	do "${code}/02_tt_data_entry.do"
	
	*-----------------------------------------------
	* 3 - Creating dataset of test and treat trials
	*-----------------------------------------------
	* USES:		${data}/raw/Campbell_weight_extraction_2017Jul9.csv
	*			${data}/raw/Campbell_height_extraction_2017Jul9.csv
	* CREATES:  ${data}/main/campbell.dta
	do "${code}/03_campbell_data_entry.do"
	
/*******************************************************************************
* 	Data processing scripts
--------------------------------------------------------------------------------
	These scripts combine the datasets created above and construct derived 
	indicators
*******************************************************************************/
	
	*------------------------------------
	* 4 - Combine MDA and TT trials
	*------------------------------------
	* USES:		${data}/raw/mda.dta
	*			${data}/raw/tt.dta
	* CREATES: 	${data}/main/mda_tt.dta
	do "${code}/04_combine_mda_tt_data.do"
	
	*-----------------------------------------------
	* 5 - Prepare data for forest plots
	*-----------------------------------------------
	* USES: 	${data}/main/mda_tt.dta
	* CREATES: 	${data}/main/mda_tt_long.csv
	do "${code}/05_prep_data_for_forest_plots.do"
	
/*******************************************************************************
* 	Analysis scripts
*******************************************************************************/	

	*-----------------------------------------------
	* 6 - Create forest plots
	*-----------------------------------------------
	* USES: 	${data}/main/mda_tt_long.csv
	* CREATES:  ${output_figures}/figure1.png
	* 			${output_figures}/figure2.png
	* 			${output_figures}/figure3.png
	* 			${output_figures}/figure4.png
	rsource using "${code}/06_forest_plots.R"

	*-----------------------------------------------
	* 7 - Bayesian hierarchical model with Stan 
	*-----------------------------------------------
	* USES: 	${data}/main/mda_tt_long.csv
	*			${code}/stan/.stan
	* CREATES:  ${output_stan}/
	rsource using "${code}/07_bayesian_hierarchical_model.R"
		
	*--------------------------------------------------------
	* 8 - Organizing stan output 
	*--------------------------------------------------------
	* USES: 	${output_stan}/ - allstats.csv
	* CREATES: 	${output_tables}/tableS8.csv
	do "${code}/08_clean_stan_output.do"
	
	
	*--------------------------------------------------------
	* 9 - Publication bias
	*--------------------------------------------------------
	* USES: 	${data}/main/mda_tt_long.csv
	* CREATES: 	${data}/pub_bias/data_ak_*.csv
	* 			${output_tables}/output/tables/tableF1-A.csv
	* 			${output_tables}/output/tables/tableF2-A.csv
	* 			${output_tables}/pub-bias-AK_mda.csv
	* 			${output_tables}/pub-bias-AK_mda_tt.csv
	* 			${output_figures}/figureF1.png
	rsource using "${code}/09_publication_bias.R"	

	*--------------------------------------------------------
	* 10 - Stata analysis
	*--------------------------------------------------------
	* USES: 	${data}/main/mda_tt.dta
	*			${data}/main/campbell.dta
	*			${data}/raw/metaanalysis_data.csv
	* CREATES: 	${output_tables}/table1.csv
	*			${output_tables}/table2.csv
	*			${output_tables}/table3.csv
	*			${output_tables}/tableS2.csv
	*			${output_tables}/tableS3.csv
	*			${output_tables}/tableS4.csv
	*			${output_tables}/tableS5.csv
	*			${output_tables}/tableS6.csv
	*			${data}/main/metaanalysis_data.csv
	*			${output_tables}/compare_decisions.csv
	do "${code}/10_metan.do"
	
	*--------------------------------------------------------
	* 11 - Roodman graph
	*--------------------------------------------------------
	* USES: 	${data}/raw/metaanalysis_data.csv
	* CREATES: 	${output_figures}/metaforest.png
	rsource using "${code}/11_roodman_graph.R"
	
	*--------------------------------------------------------
	* 12 - Number of significant trials
	*--------------------------------------------------------
	* USES: 	${data}/main/mda_tt_long.csv
	* CREATES: 	${output_tables}/figureS1.png
	rsource using "${code}/12_tableF.R"
	
	*--------------------------------------------------------
	* 13 - Comparison to Taylor-Robinson et al (2019)
	*--------------------------------------------------------
	* USES: 	${output_tables}/compare_decisions.csv
	* CREATES: 	${output_figures}/figureS1.png
	rsource using "${code}/13_compare_to_TMSDG.R"
	
	erase "${github}/Rplots.pdf" // seems to be created when running ggsave from rsource

********************************************************************************