* ----------------------------------------------------------
* IMPROVED CORRELATION MATRIX EXPORT
* Author: Daves A. Cordova
* Purpose: Export formatted correlation matrix to Excel
* ----------------------------------------------------------

// Import data
clear all
import excel "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Análises\Regressão\Base de dados - Regressão.xlsx", sheet("Base de dados") firstrow

// Create log-transformed variables
foreach var in Production Productivity OccupiedPeople TotalTillage AnnualInvestment CapitalStock PlantedPastages NaturalPastages TotalPastages PIA {
    gen l`var' = ln(`var')
    replace l`var' = 0 if missing(l`var') // Handle missing values
}

// Panel setup and lagged variables
xtset Codigo Ano, delta(5)
foreach var in Production OccupiedPeople TotalTillage {
    gen `var'lag = `var' - L.`var'
    gen l`var'lag = ln(`var'lag)
    replace l`var'lag = 0 if missing(l`var'lag)
}

gen lTFP = ln(TFP)
replace lTFP = 0 if missing(lTFP)

// Step 1: Run correlation analysis
correlate lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA lPlantedPastages lNaturalPastages

// Step 2: Store results in matrix
matrix CorrMatrix = r(C)
matrix list CorrMatrix

// Step 3: Create formatted table with significance stars
estpost correlate lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA, matrix listwise
esttab . using "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\correlation_matrix.rtf", replace ///
    not noobs compress label ///
    title("Correlation Matrix of Key Variables") ///
    addnotes("*** p<0.01, ** p<0.05, * p<0.1" "Variables prefixed with 'l' are log-transformed")

// Step 4: Export full matrix to Excel with formatting
putexcel set "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\correlation_matrix.xlsx", replace

// Write headers
putexcel A1 = "Variable"
local col = 2
foreach var in lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA lPlantedPastages lNaturalPastages {
    putexcel `=char(64+`col')'1 = "`var'"
    local ++col
}

// Write data with conditional formatting
local row = 2
foreach rowvar in lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA lPlantedPastages lNaturalPastages {
    putexcel A`row' = "`rowvar'"
    local col = 2
    foreach colvar in lProduction lTFP lOccupiedPeople lTotalTillage lAnnualInvestment lCapitalStock lPIA lPlantedPastages lNaturalPastages {
        matrix val = CorrMatrix["`rowvar'","`colvar'"]
        putexcel `=char(64+`col')'`row' = `=val[1,1]', nformat(0.000)  // 3 decimal places
        
        // Add conditional formatting - CORRECTED
        if abs(val[1,1]) > 0.7 {
            putexcel `=char(64+`col')'`row', bold border(bottom, medium, black) font("Arial", 10, red)
        }
        else if abs(val[1,1]) > 0.5 {
            putexcel `=char(64+`col')'`row', italic font("Arial", 10, blue)
        }
        local ++col
    }
    local ++row
}

// Add title and formatting
putexcel A1:`=char(64+`col')'1, bold border(bottom, double, black) hcenter fpattern(solid, lightgray)
putexcel A`=`row'+1' = "Notes:", bold
putexcel A`=`row'+2' = "1. *** p<0.01, ** p<0.05, * p<0.1"
putexcel A`=`row'+3' = "2. Variables prefixed with 'l' are log-transformed"
putexcel A`=`row'+4' = "3. Bold values indicate correlations > |0.7|"
putexcel A`=`row'+5' = "4. Italic values indicate correlations > |0.5|"

// Final formatting
putexcel A1:Z100, font("Arial", 9) hcenter
putexcel save
display as text "Correlation matrix successfully exported to: " as result "C:\Users\daves\OneDrive\Pessoal\Acadêmico\Mestrado\Dissertação - Execução\Dissertação\Quadros e gráficos\correlation_matrix.xlsx"