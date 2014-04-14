complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  df <- data.frame()
  
  for (i in id) {
    filename <- paste(directory,'/',sprintf("%03d",i),'.csv',sep="")
    df <- rbind(df,c(i,sum(complete.cases(read.csv(filename)))))
  }
  names(df) <- c("id","nobs")
  df
  
}