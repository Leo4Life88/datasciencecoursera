# PART 2 - Write a function that reads a directory full of files and reports the number of completely 
#          observed cases in each data file. The function should return a data frame where the first 
#          column is the name of the file and the second column is the number of complete cases. 

complete <- function(directory, id = 1:332){
        
            datafiles <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
        
            df <- data.frame(matrix(nrow = 0, ncol = 2)) # We initialized 0 rows and need 2 columns
            colnames(df) <- c("id", "nobs")              # Assign column names of our empty dataframe
        
        # Loop across each monitor in the "id" vector and bind the corresponding dataframes into one
            for(i in id){
                    each_spec <- na.omit(read.csv(datafiles[i])) # Dataframe of each .csv file, omitting NA
                    # number of non-missing rows (complete cases)
                    ncomplete <- nrow(each_spec)
                    # Assign ncomplete to df which increments the row number(id) by 1 and outputs 
                    # all columns 
                    df[nrow(df)+1, ]  <- c(i, ncomplete) 
        }
        
        df          # returns df with each id and their number of complete cases 
} 