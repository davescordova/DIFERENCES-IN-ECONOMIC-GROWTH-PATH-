clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Dados do Censo - não usar na regressão\População total.xlsx", sheet("Quando as cidades vão acabar") firstrow
gen lnpop = ln( Population)

* Lista de cidades
levelsof City, local(cidades)

* Inicializa a variável para armazenar os coeficientes logaritmicos
gen a = .

* Regressões
foreach cidade in `cidades' {
    regress lnpop Year if City == "`cidade'" & !missing(Population)
    * Armazenar o coeficiente na variável coef
    replace a = _b[Year] if City == "`cidade'"
}

* Calcular delta t
///linear
gen deltat = ((0/(pop2022*a))-(1/a))

*Tempo do fim
gen t = 2022 + deltat


*Gerar Frame
drop if t<2022
drop if Year>1970
drop CDIBGE Mesoregion Population Year pop2022 popfirst lnpop
export excel using "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Dados do Censo - não usar na regressão\Estimação de a.xlsx", sheetmodify firstrow(variables)
