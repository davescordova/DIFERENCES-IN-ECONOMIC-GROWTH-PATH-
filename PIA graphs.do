clear all
//PIA percentual
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\Table 14.xlsx", sheet("Planilha2") firstrow
xtset Code Year

///Gráficos
twoway (lfit Percentagechange Year if Region == "Água Boa", lcolor(green) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Alta Floresta", lcolor(green) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Barra do Garças", lcolor(blue) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Cáceres", lcolor(blue) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Confresa - Vila Rica", lcolor(red) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Cuiabá", lcolor(red) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Diamantino", lcolor(black) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Jaciara", lcolor(black) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Juara", lcolor(yellow) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Juína", lcolor(yellow) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Mirassol D'oeste", lcolor(orange) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Peixoto de Azevedo - Guarantã do Norte", lcolor(orange) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Ponteslç e Lacerda - Comodoro", lcolor(purple) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Primavera do Leste", lcolor(purple) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Rondonópolis", lcolor(gs10) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Sinop", lcolor(gs10) lpattern(longdash) lwidth(thick)) (lfit Percentagechange Year if Region == "Sorriso", lcolor(brown) lpattern(line) lwidth(thick)) (lfit Percentagechange Year if Region == "Tangará da Serra", lcolor(brown) lpattern(longdash) lwidth(thick)) , legend(order(1 "Água Boa" 2 "Alta Floresta" 3 "Barra Garças" 4 "Cáceres" 5 "Confresa" 6 "Cuiabá" 7 "Diamantino" 8 "Jaciara" 9 "Juara" 10 "Juína" 11 "Mirassol" 12 "Peixoto de Azevedo" 13 "Pontes e Lacerda" 14 "Primavera do Leste" 15 "Rondonópolis" 16 "Sinop" 17 "Sorriso" 18 "Tangará da Serra")) legend(size(*0.4)) legend(cols(6)) ylabel(#10, angle(45))

clear all

//PIA total
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\Table 14.xlsx", sheet("Planilha3") firstrow
xtset Code Year

twoway (lfit Totalammount Year if Region == "Água Boa", lcolor(green) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Alta Floresta", lcolor(green) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Barra do Garças", lcolor(blue) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Cáceres", lcolor(blue) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Confresa - Vila Rica", lcolor(red) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Cuiabá", lcolor(red) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Diamantino", lcolor(black) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Jaciara", lcolor(black) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Juara", lcolor(yellow) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Juína", lcolor(yellow) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Mirassol D'oeste", lcolor(orange) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Peixoto de Azevedo - Guarantã do Norte", lcolor(orange) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Ponteslç e Lacerda - Comodoro", lcolor(purple) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Primavera do Leste", lcolor(purple) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Rondonópolis", lcolor(gs10) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Sinop", lcolor(gs10) lpattern(longdash) lwidth(thick)) (lfit Totalammount  Year if Region == "Sorriso", lcolor(brown) lpattern(line) lwidth(thick)) (lfit Totalammount  Year if Region == "Tangará da Serra", lcolor(brown) lpattern(longdash) lwidth(thick)) , legend(order(1 "Água Boa" 2 "Alta Floresta" 3 "Barra Garças" 4 "Cáceres" 5 "Confresa" 6 "Cuiabá" 7 "Diamantino" 8 "Jaciara" 9 "Juara" 10 "Juína" 11 "Mirassol" 12 "Peixoto de Azevedo" 13 "Pontes e Lacerda" 14 "Primavera do Leste" 15 "Rondonópolis" 16 "Sinop" 17 "Sorriso" 18 "Tangará da Serra")) legend(size(*0.4)) legend(cols(6)) ylabel(#10, angle(45)) ytitle("")
//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph6.jpg", as(jpg) replace width(4000) height(3000)

clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\Table 14.xlsx", sheet("Planilha3") firstrow
xtset Code Year
//PIA Total exponencial
// Água Boa
gen log_Totalammount = log(Totalammount)
regress log_Totalammount Year if Region == "Água Boa"
predict prov_AguaBoa, xb
gen expfit_AguaBoa = exp(prov_AguaBoa)

// Alta Floresta
regress log_Totalammount Year if Region == "Alta Floresta"
predict prov_AltaFloresta, xb
gen expfit_AltaFloresta = exp(prov_AltaFloresta)

// Barra do Garças
regress log_Totalammount Year if Region == "Barra do Garças"
predict prov_BarraGarcas, xb
gen expfit_BarraGarcas = exp(prov_BarraGarcas)

// Cáceres
regress log_Totalammount Year if Region == "Cáceres"
predict prov_Caceres, xb
gen expfit_Caceres = exp(prov_Caceres)

// Confresa - Vila Rica no observations

// Cuiabá
regress log_Totalammount Year if Region == "Cuiabá"
predict prov_Cuiaba, xb
gen expfit_Cuiaba = exp(prov_Cuiaba)

// Diamantino
regress log_Totalammount Year if Region == "Diamantino"
predict prov_Diamantino, xb
gen expfit_Diamantino = exp(prov_Diamantino)

// Jaciara
regress log_Totalammount Year if Region == "Jaciara"
predict prov_Jaciara, xb
gen expfit_Jaciara = exp(prov_Jaciara)

// Juara
regress log_Totalammount Year if Region == "Juara"
predict prov_Juara, xb
gen expfit_Juara = exp(prov_Juara)

// Juína
regress log_Totalammount Year if Region == "Juína"
predict prov_Juina, xb
gen expfit_Juina = exp(prov_Juina)

// Mirassol D'oeste
regress log_Totalammount Year if Region == "Mirassol D'oeste"
predict prov_Mirassol, xb
gen expfit_Mirassol = exp(prov_Mirassol)

// Peixoto de Azevedo - Guarantã do Norte no observations

// Pontes e Lacerda - Comodoro no observations


// Primavera do Leste
regress log_Totalammount Year if Region == "Primavera do Leste"
predict prov_Primavera, xb
gen expfit_Primavera = exp(prov_Primavera)

// Rondonópolis
regress log_Totalammount Year if Region == "Rondonópolis"
predict prov_Rondonopolis, xb
gen expfit_Rondonopolis = exp(prov_Rondonopolis)

// Sinop
regress log_Totalammount Year if Region == "Sinop"
predict prov_Sinop, xb
gen expfit_Sinop = exp(prov_Sinop)

// Sorriso
regress log_Totalammount Year if Region == "Sorriso"
predict prov_Sorriso, xb
gen expfit_Sorriso = exp(prov_Sorriso)

// Tangará da Serra
regress log_Totalammount Year if Region == "Tangará da Serra"
predict prov_Tangara, xb
gen expfit_Tangara = exp(prov_Tangara)

twoway (line expfit_AguaBoa Year if Region == "Água Boa", lcolor(green) lpattern(longdash) lwidth(thick)) (line expfit_AltaFloresta Year if Region == "Alta Floresta", lcolor(green) lpattern(line) lwidth(thick)) (line expfit_BarraGarcas Year if Region == "Barra do Garças", lcolor(blue) lpattern(longdash) lwidth(thick)) (line expfit_Caceres Year if Region == "Cáceres", lcolor(blue) lpattern(line) lwidth(thick)) (line expfit_Diamantino Year if Region == "Diamantino", lcolor(black) lpattern(line) lwidth(thick)) (line expfit_Jaciara Year if Region == "Jaciara", lcolor(black) lpattern(longdash) lwidth(thick)) (line expfit_Juara Year if Region == "Juara", lcolor(yellow) lpattern(line) lwidth(thick)) (line expfit_Juina Year if Region == "Juína", lcolor(yellow) lpattern(longdash) lwidth(thick)) (line expfit_Mirassol Year if Region == "Mirassol D'oeste", lcolor(orange) lpattern(line) lwidth(thick)) (line expfit_Primavera Year if Region == "Primavera do Leste", lcolor(purple) lpattern(longdash) lwidth(thick)) (line expfit_Rondonopolis Year if Region == "Rondonópolis", lcolor(gs10) lpattern(line) lwidth(thick)) (line expfit_Sinop Year if Region == "Sinop", lcolor(gs10) lpattern(longdash) lwidth(thick)) (line expfit_Sorriso Year if Region == "Sorriso", lcolor(brown) lpattern(line) lwidth(thick)) (line expfit_Tangara Year if Region == "Tangará da Serra", lcolor(brown) lpattern(longdash) lwidth(thick)), legend(order(1 "Água Boa" 2 "Alta Floresta" 3 "Barra Garças" 4 "Cáceres" 5 "Diamantino" 6 "Jaciara" 7 "Juara" 8 "Juína" 9 "Mirassol" 10 "Primavera do Leste" 11 "Rondonópolis" 12 "Sinop" 13 "Sorriso" 14 "Tangará da Serra")) legend(size(*0.4)) legend(cols(6)) ylabel(#10, angle(45))

//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph7.jpg", as(jpg) replace width(4000) height(3000)











