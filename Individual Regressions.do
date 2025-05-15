///Individual regressions
clear all
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
gen lTFP = ln(TFP)
xtset Codigo Ano, delta(5)

//Regressions
xtreg lProduction lTotalTillage, re vce(robust)
estimates store modelo1
xtreg lProduction lOccupiedPeople, re vce(robust)
estimates store modelo2
xtreg lProduction lAnnualInvestment, re vce(robust)
estimates store modelo3
xtreg lProduction lCapitalStock , re vce(robust)
estimates store modelo4
xtreg lProduction lTotalPastages , re vce(robust)
estimates store modelo5
xtreg lProduction lPlantedPastages , re vce(robust)
estimates store modelo6
xtreg lProduction lNaturalPastages , re vce(robust)
estimates store modelo7
xtreg lProduction lPIA , re vce(robust)
estimates store modelo8
xtreg lProduction lTFP , re vce(robust)
estimates store modelo9
xtreg lProduction TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara , re vce(robust)
estimates store modelo10

esttab modelo1 modelo2 modelo3 modelo4 modelo5 modelo6 modelo7 modelo8 modelo9 using "Model_Comparison.rtf", replace