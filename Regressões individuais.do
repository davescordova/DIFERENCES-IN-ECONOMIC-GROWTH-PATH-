///Individual regressions

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

//Regressions
xtreg lProduction lTotalTillage, re vce(robust)
xtreg lProduction lOccupiedPeople, re vce(robust)
xtreg lProduction lAnnualInvestment, re vce(robust)
xtreg lProduction lCapitalStock , re vce(robust)
xtreg lProduction lTotalPastages , re vce(robust)
xtreg lProduction lPlantedPastages , re vce(robust)
xtreg lProduction lNaturalPastages , re vce(robust)
xtreg lProduction lPIA , re vce(robust)
xtreg lProduction TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara , re vce(robust)