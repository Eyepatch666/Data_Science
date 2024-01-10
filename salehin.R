install.packages('readxl')

library(readxl)

dataset <- read.csv("D:/booksandstuff/DScience/MidtermProjectFInal/MidtermProjectFInal/Dataset_MIdterm_sectoin(B).csv", header = TRUE, sep = ",")
head(dataset)




names(dataset)




colSums(is.na(dataset))

dataset$smoking_history[dataset$smoking_history == "No Info"] <- NA

most_frequency_value <- table(dataset$smoking_history)
mode_sort_most_frequency_value <- names(sort(most_frequency_value, decreasing = TRUE))[1]
dataset$smoking_history[is.na(dataset$smoking_history)] <- mode_sort_most_frequency_value

columns_to_impute <- c("gender", "hypertension")
for (column in columns_to_impute) {
  most_frequency_value_column <- table(dataset[[column]])
  mode_sort_most_frequency_value_column <- names(sort(most_frequency_value_column, decreasing = TRUE))[1]
  dataset[[column]][is.na(dataset[[column]])] <- mode_sort_most_frequency_value_column
}

dataset$age[is.na(dataset$age)] <- mean(dataset$age, na.rm = TRUE)

dataset$bmi <- abs(dataset$bmi)

summary_statics <- summary(dataset[c('age', 'bmi', 'HbA1c_level', 'blood_glucose_level')])
summary_statics

hist(dataset$age, main = "Age Distribution", xlab = 'Age', col = 'lightblue')
hist(dataset$bmi, main = "BMI Distribution", xlab = 'BMI', col = 'blue')
hist(dataset$HbA1c_level, main = "HbAlc_level Distribution", xlab = 'HbAlc_level', col = 'pink')
hist(dataset$blood_glucose_level, main = "Glucose level Distribution", xlab = 'Glucose_level', col = 'yellow')

columns_to_barplot <- c("heart_disease", "gender", "hypertension", "smoking_history", "diabetes")
for (column in columns_to_barplot) {
  barplot(table(dataset[[column]]), main = paste(column, "Distribution"), xlab = column, ylab = 'count', col = 'lightgreen')
}

boxplot(dataset$age, main = 'Box Plot for AGE')
q1 <- quantile(dataset$age, 0.25)
q3 <- quantile(dataset$age, 0.75)
iqr <- q3 - q1
outliers_age <- dataset$age < (q1 - 1.5 * iqr) | dataset$age > (q3 + 1.5 * iqr)
dataset$age[is.na(dataset$age) | outliers_age] <- mean(dataset$age, na.rm = TRUE)

boxplot(dataset$bmi, main = 'Box Plot for BMI')
q1 <- quantile(dataset$bmi, 0.25)
q3 <- quantile(dataset$bmi, 0.75)
iqr <- q3 - q1
outliers_bmi <- dataset$bmi < (q1 - 1.5 * iqr) | dataset$bmi > (q3 + 1.5 * iqr)
dataset$bmi[is.na(dataset$bmi) | outliers_bmi] <- mean(dataset$bmi, na.rm = TRUE)

boxplot(dataset$HbA1c_level, main = 'Box Plot for HbAlc level')
q1 <- quantile(dataset$HbA1c_level, 0.25)
q3 <- quantile(dataset$HbA1c_level, 0.75)
iqr <- q3 - q1
outliers_HbA1c_level <- dataset$HbA1c_ledvel < (q1 - 1.5 * iqr) | dataset$HbA1c_level > (q3 + 1.5 * iqr)
dataset$HbA1c_level[is.na(dataset$HbA1c_level) | outliers_HbA1c_level] <- mean(dataset$HbA1c_level, na.rm = TRUE)

boxplot(dataset$blood_glucose_level, main = 'Box Plot for Glucose level')
q1 <- quantile(dataset$blood_glucose_level, 0.25)
q3 <- quantile(dataset$blood_glucose_level, 0.75)
iqr <- q3 - q1
outliers_blood_glucose_level <- dataset$blood_glucose_level < (q1 - 1.5 * iqr) | dataset$blood_glucose_level > (q3 + 1.5 * iqr)
dataset$blood_glucose_level[is.na(dataset$blood_glucose_level) | outliers_blood_glucose_level] <- mean(dataset$blood_glucose_level, na.rm = TRUE)
