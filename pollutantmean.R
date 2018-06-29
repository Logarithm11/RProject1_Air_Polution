pollutantmean = function(directory, pollutant, id = 1:332){
        allfiles = list.files(directory, pattern = ".csv")
        path = paste(directory, allfiles[id[1]], sep = "/", collapse = "")
        idfile = read.csv(path)
        # Could also use weighted means using complete.R instead of merging
        #weights = complete(directory)
        #meanvector = weights[id[1], 2] * mean(idfile[[pollutant]], na.rm = TRUE)
        
        if (length(id) != 1){
                for (i in 2:length(id)){
                        path = paste(directory, allfiles[id[i]], sep = "/", collapse = "")
                        tempfile = read.csv(path)
                        idfiles = merge(idfiles, tempfile, all = TRUE)
                        
                        
                        #meanvector = c(meanvector, weights[id[i], 2] * mean(idfile[[pollutant]], na.rm = TRUE))
                }
        }
        mean(idfiles[[pollutant]], na.rm = TRUE)
        #mean(meanvector)
}
