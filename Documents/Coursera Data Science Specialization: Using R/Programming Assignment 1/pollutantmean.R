# PART 1 - Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or 
#          nitrate) across a specified list of monitors. The function 'pollutantmean' takes three 
#          arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
#          'pollutantmean' reads that monitors' particulate matter data from the directory specified in 
#          the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
#          ignoring any missing values coded as NA. 

pollutantmean <- function(directory, pollutant, id = 1:332){
        
        # full.names = TRUE is needed to ensure that the "specdata" directory is 
        # prepended to each .csv filename
        datafiles <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
                
        df <- data.frame()
        
        # Loop across each monitor in the "id" vector and bind the corresponding dataframes into one
        for(i in id){
              each_spec <- read.csv(datafiles[i]) # Reads each csv file into a dataframe
              df <- rbind(df, each_spec)          # Inserts/binds together each dataframe as looped  
        }
        
        mean(df[ ,pollutant], na.rm = TRUE)       # Takes mean from the pollutant column called from fxn
       
}