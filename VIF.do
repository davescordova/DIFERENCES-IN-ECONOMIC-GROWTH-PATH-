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

//VIF
regress lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA lPlantedPastages lNaturalPastages TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006
vif
logout, save("VIF_Results") word replace: vif