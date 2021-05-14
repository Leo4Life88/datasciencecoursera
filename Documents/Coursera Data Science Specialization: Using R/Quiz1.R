# NOTE: If you don't set the working directory, you won't be able to read the csv file!

# setwd("/home/bani/Documents/Coursera Data Science Specialization: Using R/Data Sets)

data <- read.csv("hw1_data.csv", sep = ",", header = TRUE)

# Print the FIRST 2 rows of the dataset:

head(data,2)

# OR:

data[1:2, ]

# Print the LAST 2 rows of the dataset:

tail(data,2)

# OR:

data[152:153, ]
        
# Print missing values and non-missing values in Ozone column

sum(is.na(data$Ozone))

sum(!is.na(data$Ozone))

# What is the mean of the Ozone column? Exclude missing values (coded as NA) from this calculation.  

mean(na.omit(data$Ozone))

#   Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are 
#   above 90. What is the mean of Solar.R in this subset?

OT <- na.omit(subset(data, Ozone > 31 & Temp > 90))

mean(OT$Solar.R)