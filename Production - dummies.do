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
gen lTFP=ln(TFP)

gen LandMarket = 0
replace LandMarket = 1 if Município == "Água Boa" | Município == "Canarana" | Município == "Juruena" | Município == "Nova Mutum" | Município == "São José do Rio Claro" | Município == "Terra Nova do Norte" | Município == "Alta Floresta" | Município == "Colíder" | Município == "Marcelândia" | Município == "Novo Horizonte do Norte" | Município == "Sinop" | Município == "Vera" | Município == "Apiacás" | Município == "Cotriguaçú" | Município == "Matupá" | Município == "Paraníta" | Município == "Sorriso" | Município == "Vila Rica" | Município == "Brasnorte" | Município == "Juara" | Município == "Nova Bandeirantes" | Município == "Porto dos Gaúchos" | Município == "Tapurah" | Município == "Nova Monte Verde"

gen BR070 = 0
replace BR070 = 1 if Município == "Campo Verde" | Município == "Cuiabá" | Município == "Cáceres" | Município == "Barra do Garças" | Município == "General Carneiro" | Município == "Primavera do Leste"


gen BR158 = 0
replace BR158 = 1 if Município == "Água Boa" | Município == "Campo Verde" | Município == "Porto Alegre do Norte" | Município == "Ribeirão Cascalheira" | Município == "Nova Xavantina" | Município == "Novo Santo Antônio"

gen BR163 = 0
replace BR163 = 1 if Município == "Sorriso" | Município == "Cuiabá" | Município == "Rondonópolis" | Município == "Jaciara" | Município == "Várzea Grande" | Município == "Sinop" | Município == "Terra Nova do Norte" | Município == "Guarantã do Norte" | Município == "Juscimeira" | Município == "São Pedro da Cipa"


// TotalTillage to indepedent variables
//WAP
xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock LandMarket BR070 TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006, re vce(robust)
estimates store modelo1
esttab modelo1 using modelo1.rtf, replace

//Production function
xtivreg lProduction ( lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock TangarádaSerra Diamantino Cáceres PonteseLacerdaComodoro MirassolDoeste Sinop Sorriso Juína AltaFloresta PeixotodeAzevedoGuarantãdo Juara BarradoGarças ConfresaVilaRica ÁguaBoa Rondonópolis PrimaveradoLeste Jaciara year1980 year1985 year1995 year2006), re vce(robust)
estimates store modelo2
esttab modelo4 using modelo2.rtf, replace




