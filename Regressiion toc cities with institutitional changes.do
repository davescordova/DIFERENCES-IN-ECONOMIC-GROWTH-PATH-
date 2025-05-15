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
gen lTFP =ln(TFP)
drop TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara AG IntBarradoGarças IntCáceres IntRondonópolis IntSinop 

///Only cities with institutional changes
keep if Município == "Porto dos Gaúchos" | Município == "Canarana" | Município == "Água Boa" | Município == "Nova Monte Verde" | Município == "Vera" | Município == "Colíder" | Município == "Alta Floresta" | Município == "Apiacás" | Município == "São José do Rio Claro" | Município == "Vila Rica" | Município == "Paranaíta" | Município == "Marcelândia" | Município == "Juara" | Município == "Nova Bandeirantes" | Município == "Sorriso" | Município == "Terra Nova do Norte" | Município == "Nova Mutum" | Município == "Matupá" | Município == "Tapurah" | Município == "Juruena" | Município == "Brasnorte" | Município == "Cotriguaçu" | Município == "Rondonópolis" | Município == "Primavera do Leste"

//TotalTillage to independent variables
//PIA
xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock year1980 year1985 year1995 year2006, re vce(robust)

//Production function
xtivreg lProduction ( lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock year1980 year1985 year1995 year2006), re vce(robust)

