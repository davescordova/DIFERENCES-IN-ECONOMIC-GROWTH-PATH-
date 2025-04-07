import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\PIB Municipal\PIB Mesorregional.xlsx", sheet("Planilha1") firstrow
gen VABAgro = (ValoradicionadobrutodaAgrope / Valoradicionadobrutototala) * 100
gen VABInd = (ValoradicionadobrutodaIndúst / Valoradicionadobrutototala) * 100
gen VABServ = (ValoradicionadobrutodosServi / Valoradicionadobrutototala) * 100
gen VABAdmP = (ValoradicionadobrutodaAdmini / Valoradicionadobrutototala) * 100

format VABAgro %9.2f
format VABInd %9.2f
format VABServ %9.2f
format VABAdmP %9.2f


graph bar (mean) VABAgro VABInd VABServ VABAdmP, over(NomedaRegiãoGeográficaInterm) legend(order(1 "GVA Agriculture" 2 "GVA Industry" 3 "GVA Services" 4 "GVA Public Administration")) title("Valores Agrupados por Região Intermediária") ytitle("") blabel(bar)
//exportar para jpg
graph export "C:/Users/daves/OneDrive/Pessoal/Acadêmico/Mestrado/Dissertação - Execução/Dissertação/Quadros e gráficos/Graph1.jpg", as(jpg) replace width(4000) height(3000)