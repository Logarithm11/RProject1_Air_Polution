corr = function(directory, threshold = 0){
        allfiles = list.files(directory, pattern = ".csv")
        c = complete(directory)
        rval = 0
        
        for(i in 1:332){
                if(c[i, 2] > threshold){
                        path = paste(directory, allfiles[i], sep = "/", collapse = "")
                        tempfile = read.csv(path)
                        tempfile = tempfile[complete.cases(tempfile), ]
                        
                        rval = c(rval, cor(tempfile[["sulfate"]], tempfile[["nitrate"]]))
                }
        }
        
        rval[-1]
}