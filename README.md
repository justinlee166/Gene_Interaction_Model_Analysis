# AMS 315 Project 2: Gene Interaction Modeling  
**Author:** Justin Lee  
**Course:** AMS 315 - Data Analysis, Spring 2024  
**Instructor:** Professor Yan Yu  

---

## 📌 Overview  
This repository contains my solutions and analysis for AMS 315 Project 2, focused on identifying gene-gene interactions and environmental effects in a synthetic dataset. The analysis was conducted using multiple regression techniques, transformations, and variable selection methods in R.

---

## 📄 Project Description  
**Objective:** Estimate the underlying model used to generate synthetic data with 1 dependent variable (Y), 4 environmental variables (E1--E4), and 20 gene variables (G1--G20).

### Part A: Exploratory and Correlation Analysis  
- Calculated correlation coefficients between Y and all independent variables.  
- Identified E4 as having a moderately strong positive linear relationship with Y.

### Part B: Transformation and Regression Modeling  
- Applied Box-Cox transformation; selected lambda = 0.35 for transforming Y.  
- Performed stepwise regression using the `leaps` and `knitr` R libraries.  
- Chose a model based on the highest adjusted R² gain with interaction terms.  
- Applied Bonferroni correction to control for multiple testing.

### Final Model:  
\[
Y^{0.35} = 24.8394 + 14.5468\,E_4 + 16.6106\,(G_5:G_{13}) + \epsilon
\]  
- Residual Standard Error: 32.97  
- F-statistic: 449.1

---

## ⚙️ Tools & Libraries  
- **Programming Language:** R  
- **Libraries:** `leaps`, `knitr`, `MASS`  
- **Documentation:** LaTeX for formal reporting  

---

## 📊 Key Results  
- Significant predictors: E4 and G5:G13 (gene-gene interaction).  
- No significant standalone genetic or gene-environment interactions.  
- Adjusted R²: 0.453  
- P-values for all included predictors: ~0 (statistically significant).  

---

## 📧 Contact  
**Justin Lee**  
Double Major in Computer Science and Applied Mathematics  
[JustinYuilLee@gmail.com](mailto:JustinYuilLee@gmail.com)  
[LinkedIn](https://www.linkedin.com/in/justinyuillee/)

---
