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
xtset Codigo Ano, delta(5)
gen Productionlag = Production - Production[_n-1]
gen OccupiedPeoplelag = OccupiedPeople - OccupiedPeople[_n-1]
gen TotalTillagelag = TotalTillage - TotalTillage[_n-1]
gen lProductionlag =ln( Productionlag)
gen lOccupiedPeoplelag = ln( OccupiedPeoplelag)
gen lTotalTillagelag = ln( TotalTillagelag)
gen lTFP = ln(TFP)

// No restrictions
xtivreg lProduction  (lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006), re vce(robust)
predict yhatsr, xb
gen yhatsrcontrole = yhatsr*2006
reg lProduction yhatsrcontrole, robust
predict ressr, residuals
gen ressrsq = ressr^2
sum ressrsq

//Excluding 2006
drop if Ano>1995
xtivreg lProduction ( lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995), re vce(robust)
predict yhat95, xb
gen yhat95controle = yhat95*2006
reg lProduction yhat95controle, robust
predict res95, residuals
gen res95sq = res95^2
sum res95sq

//Only 2006
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
xtset Codigo Ano, delta(5)
gen Productionlag = Production - Production[_n-1]
gen OccupiedPeoplelag = OccupiedPeople - OccupiedPeople[_n-1]
gen TotalTillagelag = TotalTillage - TotalTillage[_n-1]
gen lProductionlag =ln( Productionlag)
gen lOccupiedPeoplelag = ln( OccupiedPeoplelag)
gen lTotalTillagelag = ln( TotalTillagelag)
gen lTFP = ln(TFP)

drop if Ano<2006
ivreg lProduction ( lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara), robust
predict yhat2006, xb
gen yhat2006controle = yhat2006*2006
reg lProduction  yhat2006controle, robust
predict res2006, residuals
gen res2006sq = res2006^2
sum res2006sq
