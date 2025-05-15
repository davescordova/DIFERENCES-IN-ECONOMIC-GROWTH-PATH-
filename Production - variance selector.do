clear all
cd "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução"
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Regressão\Base de dados - Regressão.xlsx", sheet("Base de dados") firstrow
gen lProduction = ln( Production)
gen lProductivity =ln( Productivity)
gen lOccupiedPeople = ln( OccupiedPeople)
gen lTotalTillage = ln( TotalTillage)
gen lAnnualInvestment =ln( AnnualInvestment)
gen lCapitalStock = ln( CapitalStock)
gen lPlantedPastages= ln( PlantedPastages)
gen lNaturalPastages = ln(NaturalPastages)
gen lTotalPastages = ln( TotalPastages)
gen lPIA = ln(PIA)
xtset Codigo Ano, delta(5)
gen Productionlag = Production - Production[_n-1]
gen OccupiedPeoplelag = OccupiedPeople - OccupiedPeople[_n-1]
gen TotalTillagelag = TotalTillage - TotalTillage[_n-1]
gen lProductionlag =ln( Productionlag)
gen lOccupiedPeoplelag = ln( OccupiedPeoplelag)
gen lTotalTillagelag = ln( TotalTillagelag)
gen lTFP=ln(TFP)

//Heterokedasticity test
xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re
predict resid, e
gen resid2 = resid^2
reg resid2 lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006

//Autocorrelation test
sort Codigo Ano
by Codigo: gen resid_lag = resid[_n-1] 
bysort Codigo: corr resid resid_lag 

//Comparing models
// Run the models and store results
xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re
estimates store Model1

xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re vce(robust)
estimates store Model2

xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re vce(cluster Codigo)
estimates store Model3

xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re vce(robust) nosa
estimates store Model4

// Generate a table with coefficients, p-values, and test statistics
esttab Model1 Model2 Model3 Model4 using "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\Results.rtf", ///
    b(%9.4f) se(%9.4f) ///
    star(* 0.10 ** 0.05 *** 0.01) ///
    stats(N chi2, fmt(%9.0g %9.2f) ///
    labels("Observations" "Wald chi2")) ///
    mtitles("Model 1 (Swany-Amora)" "Model 2 (Huber-White)" "Model 3 (Cluster)" "Model 4 (Robust, Baltagi–Chang)") ///
    compress replace