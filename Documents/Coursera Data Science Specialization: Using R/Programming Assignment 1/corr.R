# PART 3 - Write a function that takes a directory of data files and a threshold for complete cases
#          and calculates the correlation between sulfate and nitrate for monitor locations where the 
#          number of completely observed cases (on all variables) is greater than the threshold. 
#          The function should return a vector of correlations for the monitors that meet the threshold 
#          requirement. If no monitors meet the threshold requirement, then the function should return a 
#          numeric vector of length 0. 

corr <- function(directory, threshold = 0){
        
        datafiles <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
        
        correlations <- numeric()       # creates an empty numeric vector of length 0
        
        # Loops through each file (monitor) and calculates the correlation 
        for(file in datafiles){
                df <- na.omit(read.csv(file))   # gives us complete cases
                
                # compares number of complete cases and the threshold set 
                if(nrow(df) > threshold){
                        # calculates correlation between sulfate and nitrate from df
                        cr <- cor(df$sulfate, df$nitrate) 
                        # joins correlations and cr as a numeric vector
                        correlations <- c(correlations, cr)
                }
                 
        }
        correlations   # outputs all the correlations met by our condition  
        
}