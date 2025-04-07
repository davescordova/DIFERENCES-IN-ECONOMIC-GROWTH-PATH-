clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Dados do Censo - não usar na regressão\PIA individuais.xlsx", sheet("Cuiabá") firstrow
xtset Code Year
// Acorizal
gen log_Totalammount = log(Totalammount)
regress log_Totalammount Year if Municipios == "Acorizal"
predict prov_Acorizal, xb
gen expfit_Acorizal = exp(prov_Acorizal)

// Barão de Melgaço
regress log_Totalammount Year if Municipios == "Barão de Melgaço"
predict prov_BaraoMelgaco, xb
gen expfit_BaraoMelgaco = exp(prov_BaraoMelgaco)

// Campo Verde
regress log_Totalammount Year if Municipios == "Campo Verde"
predict prov_CampoVerde, xb
gen expfit_CampoVerde = exp(prov_CampoVerde)

// Chapada dos Guimarães
regress log_Totalammount Year if Municipios == "Chapada dos Guimarães"
predict prov_ChapadaGuimaraes, xb
gen expfit_ChapadaGuimaraes = exp(prov_ChapadaGuimaraes)

// Cuiabá
regress log_Totalammount Year if Municipios == "Cuiabá"
predict prov_Cuiaba, xb
gen expfit_Cuiaba = exp(prov_Cuiaba)

// Jangada
regress log_Totalammount Year if Municipios == "Jangada"
predict prov_Jangada, xb
gen expfit_Jangada = exp(prov_Jangada)

// Nobres
regress log_Totalammount Year if Municipios == "Nobres"
predict prov_Nobres, xb
gen expfit_Nobres = exp(prov_Nobres)

// Nossa Senhora do Livramento
regress log_Totalammount Year if Municipios == "Nossa Senhora do Livramento"
predict prov_Livramento, xb
gen expfit_Livramento = exp(prov_Livramento)

// Nova Brasilândia
regress log_Totalammount Year if Municipios == "Nova Brasilândia"
predict prov_NovaBrasil, xb
gen expfit_NovaBrasil = exp(prov_NovaBrasil)

// Planalto da Serra
regress log_Totalammount Year if Municipios == "Planalto da Serra"
predict prov_PlanaltoSerra, xb
gen expfit_PlanaltoSerra = exp(prov_PlanaltoSerra)

// Poconé
regress log_Totalammount Year if Municipios == "Poconé"
predict prov_Pocone, xb
gen expfit_Pocone = exp(prov_Pocone)

// Rosário Oeste
regress log_Totalammount Year if Municipios == "Rosário Oeste"
predict prov_RosarioOeste, xb
gen expfit_RosarioOeste = exp(prov_RosarioOeste)

// Santo Antônio do Leverger
regress log_Totalammount Year if Municipios == "Santo Antônio do Leverger"
predict prov_Leverger, xb
gen expfit_Leverger = exp(prov_Leverger)

// Várzea Grande
regress log_Totalammount Year if Municipios == "Várzea Grande"
predict prov_VarzeaGrande, xb
gen expfit_VarzeaGrande = exp(prov_VarzeaGrande)

twoway (line expfit_Acorizal Year if Municipios == "Acorizal", lcolor(green) lpattern(longdash) lwidth(thick)) (line expfit_BaraoMelgaco Year if Municipios == "Barão de Melgaço", lcolor(green) lpattern(line) lwidth(thick)) (line expfit_CampoVerde Year if Municipios == "Campo Verde", lcolor(blue) lpattern(longdash) lwidth(thick)) (line expfit_ChapadaGuimaraes Year if Municipios == "Chapada dos Guimarães", lcolor(blue) lpattern(line) lwidth(thick)) (line expfit_Cuiaba Year if Municipios == "Cuiabá", lcolor(red) lpattern(longdash) lwidth(thick)) (line expfit_Jangada Year if Municipios == "Jangada", lcolor(black) lpattern(line) lwidth(thick)) (line expfit_Nobres Year if Municipios == "Nobres", lcolor(black) lpattern(longdash) lwidth(thick)) (line expfit_Livramento Year if Municipios == "Nossa Senhora do Livramento", lcolor(yellow) lpattern(line) lwidth(thick)) (line expfit_NovaBrasil Year if Municipios == "Nova Brasilândia", lcolor(yellow) lpattern(longdash) lwidth(thick)) (line expfit_PlanaltoSerra Year if Municipios == "Planalto da Serra", lcolor(orange) lpattern(line) lwidth(thick)) (line expfit_Pocone Year if Municipios == "Poconé", lcolor(purple) lpattern(longdash) lwidth(thick)) (line expfit_RosarioOeste Year if Municipios == "Rosário Oeste", lcolor(gs10) lpattern(line) lwidth(thick)) (line expfit_Leverger Year if Municipios == "Santo Antônio do Leverger", lcolor(gs10) lpattern(longdash) lwidth(thick)) (line expfit_VarzeaGrande Year if Municipios == "Várzea Grande", lcolor(brown) lpattern(line) lwidth(thick)), legend(order(1 "Acorizal" 2 "Barão de Melgaço" 3 "Campo Verde" 4 "Chapada dos Guimarães" 5 "Cuiabá" 6 "Jangada" 7 "Nobres" 8 "Nossa Senhora do Livramento" 9 "Nova Brasilândia" 10 "Planalto da Serra" 11 "Poconé" 12 "Rosário Oeste" 13 "Santo Antônio do Leverger" 14 "Várzea Grande")) legend(size(*0.4)) legend(cols(6)) ylabel(#10, angle(45))
//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph8.jpg", as(jpg) replace width(4000) height(3000)
