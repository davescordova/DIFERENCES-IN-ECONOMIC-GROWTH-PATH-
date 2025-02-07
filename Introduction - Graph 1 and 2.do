clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\PIB Municipal\PIB Mesorregional.xlsx", sheet("Graph 1") firstrow

///gráfico do PIB
twoway (line GDP Year if IntermediateRegions == "Barra do Garças", lcolor(yellow) lwidth(thick)) (line GDP Year if IntermediateRegions == "Cáceres", lcolor(green) lwidth(thick)) (line GDP Year if IntermediateRegions == "Cuiabá", lcolor(red) lwidth(thick)) (line GDP Year if IntermediateRegions == "Rondonópolis", lcolor(orange) lwidth(thick)) (line GDP Year if IntermediateRegions == "Sinop", lcolor(blue) lwidth(thick)), legend(order(1 "Barra Garças" 2 "Cáceres" 3 "Cuiabá" 4 "Rondonópolis" 5 "Sinop")) legend(size(*0.4)) legend(cols(5)) ylabel(#10, angle(45))

//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph1.jpg", as(jpg) replace width(4000) height(3000)

clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\PIB Municipal\PIB Mesorregional.xlsx", sheet("Graph 2") firstrow
///gráfico do aumento
twoway (line GDPincrease Year if IntermediateRegions == "Barra do Garças", lcolor(yellow) lwidth(thick)) (line GDPincrease Year if IntermediateRegions == "Cáceres", lcolor(green) lwidth(thick)) (line GDPincrease Year if IntermediateRegions == "Cuiabá", lcolor(red) lwidth(thick)) (line GDPincrease Year if IntermediateRegions == "Rondonópolis", lcolor(orange) lwidth(thick)) (line GDPincrease Year if IntermediateRegions == "Sinop", lcolor(blue) lwidth(thick)), legend(order(1 "Barra Garças" 2 "Cáceres" 3 "Cuiabá" 4 "Rondonópolis" 5 "Sinop")) legend(size(*0.4)) legend(cols(5)) ylabel(#10, angle(45)) xlabel(2003 2008 2013 2018 2021)

//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph2.jpg", as(jpg) replace width(4000) height(3000)


///modelo exponencial
* Ajustar o modelo exponencial para cada região
gen log_GDP = log(GDP)

* Barra do Garças
regress log_GDP Year if IntermediateRegions == "Barra do Garças"
predict fitted_Barra, xb
gen exp_fitted_Barra = exp(fitted_Barra)

* Cáceres
regress log_GDP Year if IntermediateRegions == "Cáceres"
predict fitted_Caceres, xb
gen exp_fitted_Caceres = exp(fitted_Caceres)

* Cuiabá
regress log_GDP Year if IntermediateRegions == "Cuiabá"
predict fitted_Cuiaba, xb
gen exp_fitted_Cuiaba = exp(fitted_Cuiaba)

* Rondonópolis
regress log_GDP Year if IntermediateRegions == "Rondonópolis"
predict fitted_Rondonopolis, xb
gen exp_fitted_Rondonopolis = exp(fitted_Rondonopolis)

* Sinop
regress log_GDP Year if IntermediateRegions == "Sinop"
predict fitted_Sinop, xb
gen exp_fitted_Sinop = exp(fitted_Sinop)

*plotar
twoway (line exp_fitted_Barra Year if IntermediateRegions == "Barra do Garças", lcolor(yellow) lwidth(thick)) (line exp_fitted_Caceres Year if IntermediateRegions == "Cáceres", lcolor(green) lwidth(thick)) (line exp_fitted_Cuiaba Year if IntermediateRegions == "Cuiabá", lcolor(red) lwidth(thick)) (line exp_fitted_Rondonopolis Year if IntermediateRegions == "Rondonópolis", lcolor(orange) lwidth(thick)) (line exp_fitted_Sinop Year if IntermediateRegions == "Sinop", lcolor(blue) lwidth(thick)), legend(order(1 "Barra Garças" 2 "Cáceres" 3 "Cuiabá" 4 "Rondonópolis" 5 "Sinop")) legend(size(*0.4)) legend(cols(5)) ylabel(#10, angle(45)) xlabel(2003 2008 2013 2018 2021) yscale(range(0 .))



