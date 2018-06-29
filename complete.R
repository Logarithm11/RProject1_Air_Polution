complete = function(directory, id = 1:332){
        allfiles = list.files(directory, pattern = ".csv")
        
        for (i in 1:length(id)){
                path = paste(directory, allfiles[id[i]], sep = "/", collapse = "")
                tempfile = read.csv(path)
                if(i == 1) {
                        n = id[i]
                        nobs = nrow(tempfile[complete.cases(tempfile), ])
                }
                else{
                        n = c(n, id[i])
                        nobs = c(nobs, nrow(tempfile[complete.cases(tempfile), ]))
                }
        }
        
        id = n
        
        data.frame(id, nobs)
}
