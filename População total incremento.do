clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Dados do Censo - não usar na regressão\População total.xlsx", sheet("Julia") firstrow

//mudar diretório de trabalho para onde está shapefile
cd "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\MT_Municipios_2022"
//usar shapefile
spshape2dta MT_Municipios_2022, replace
//arrumar nome da variável para mergir
rename Cidades NM_MUN
//mergir
merge m:m NM_MUN using "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\MT_Municipios_2022\MT_Municipios_2022.dta"


//deixando somente abaixo de zero
gen Diferença_neg = Diferença if Diferença < 0
gen NM_MUN_label = NM_MUN if Diferença < 0
grmap Diferença, fcolor(red) legend(order(1 "Population Increase" 2 "Population decrease")) name(g1, replace)
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph11.jpg", as(jpg) replace width(4000) height(3000)


///criando rotulos
drop if missing(Diferença_neg)
twoway (scatter _CY _CX, mlabel(NM_MUN) mlabposition(0)), name(g2, replace)






