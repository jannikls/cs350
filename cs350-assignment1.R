# FIRST TIME USE ONLY install.packages("medicaldata")

library("medicaldata")
data("covid_testing")

summary(covid_testing)

# 15524 rows in the dataset
nrow(covid_testing)

# 17 Columns in the datsets
ncol(covid_testing)

# Get column names: [1] "subject_id"      "fake_first_name" "fake_last_name"  "gender"          "pan_day"         "test_id"        
# [7] "clinic_name"     "result"          "demo_group"      "age"             "drive_thru_ind"  "ct_result"      
# [13] "orderset"        "payor_group"     "patient_class"   "col_rec_tat"     "rec_ver_tat" 
colnames(covid_testing)

# Which genders? --> "female" "male" 
unique(covid_testing$gender)

# Two genders --> 2
length(unique(covid_testing$gender))

# How many males? 7692
length(which(covid_testing$gender=="male"))

# How many females? 7832
length(which(covid_testing$gender=="female"))

# Younger than 12 and female? 4394
length(which(covid_testing$gender=="female" & covid_testing$age <12))

# Which patient classes exist? "Outpatient" is among them
unique(covid_testing$patient_class)

# How many patients aged 0-11, and were “outpatient” class, and had positive test results? 38
length(which(covid_testing$age <12 & covid_testing$patient_class == "outpatient" & covid_testing$result == "positive"))

#Use the quantile function to identify the median, 10% quantile, and 90% quantile values ages for males. 
quantile(subset(covid_testing, gender == "male")$age)

         