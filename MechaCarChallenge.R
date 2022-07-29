
library(tidyverse)
library(dplyr)

# Deliverable 1 - ### Linear Regression to Predict MPG
# Read file - MechaCar_mpg.csv
MechaCar_mpg_data<- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Perform Multiple Linear Regression
mecha_data_lm<-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_data) #generate multiple linear regression model
summary(mecha_data_lm) #generate summary statistics


# Deliverable 2 - ###  Create Visualizations for the Trip Analysis
# Read file - Suspension_Coil.csv
Suspension_coil_data<- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Summarizing the entire dataframe to get the mean, median , variance and standard Deviaiton.
total_summary <-Suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep') #create summary table
total_summary


# Summarizing the dataframe based on the lots to get the mean , median, variance and standard deviation.

lot_summary <- Suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
lot_summary




# Deliverable 3 - ### T-Tests on Suspension Coils

#T test on the entire population
t.test(Suspension_coil_data$PSI, mu = 1500)

# T test on the lot1

lot1_data <- Suspension_coil_data %>% filter(Manufacturing_Lot=="Lot1") 
lot1_data

lot1_t_test <- t.test(lot1_data$PSI,mu=1500) #compare the mean difference between two samples#select only data points where the year is 2008
lot1_t_test


# T test on the lot2

lot2_data <- Suspension_coil_data %>% filter(Manufacturing_Lot=="Lot2") 
lot2_data

lot2_t_test <- t.test(lot2_data$PSI,mu=1500) #compare the mean difference between two samples#select only data points where the year is 2008
lot2_t_test

# T test on the lot3

lot3_data <- Suspension_coil_data %>% filter(Manufacturing_Lot=="Lot3") 
lot3_data

lot3_t_test <- t.test(lot3_data$PSI,mu=1500) #compare the mean difference between two samples#select only data points where the year is 2008
lot3_t_test

