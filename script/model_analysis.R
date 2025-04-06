library(leaps)
library(MASS)
library(knitr)

data <- read.csv("data/gene_data.csv")  # replace with your actual file name

# Exploratory Data Analysis
summary(data)
cor_matrix <- cor(data)
print(cor_matrix)

# Visualize correlation between Y and independent variables
plot(data$Y, data$E4, main="Y vs E4", xlab="E4", ylab="Y")

# Box-Cox transformation
boxcox_result <- boxcox(lm(Y ~ ., data=data), lambda=seq(-1, 1, 0.01))
lambda_opt <- 0.35  # Chosen from Box-Cox plot
data$Y_trans <- data$Y^lambda_opt

# Stepwise regression
full_model <- regsubsets(Y_trans ~ ., data=data, nvmax=10, method="forward")
model_summary <- summary(full_model)
print(model_summary)

# Select best model (e.g., with highest adj R^2)
# This is a manual step – assume model 2 is selected based on your report
final_model <- lm(Y_trans ~ E4 + I(G5 * G13), data=data)
summary(final_model)

# Apply Bonferroni correction
pvals <- summary(final_model)$coefficients[,4]
pvals_adj <- p.adjust(pvals, method="bonferroni")
print(pvals_adj)

# Residual plot
plot(final_model$residuals, main="Residual Plot for Final Model", ylab="Residuals", xlab="Index")

# Save outputs
write.csv(cor_matrix, "correlation_matrix.csv")
saveRDS(final_model, "final_model.rds")
