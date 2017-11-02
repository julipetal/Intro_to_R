####################################################
# reading a numeric tab-separated data file
####################################################

# need to specify the fileName
fileName = ""

# make sure the file is in table format
# line 1 should have the same length as line 2

l1 = scan(fileName, sep = "\t", what = "", nlines = 1)

tmpM   = matrix(scan(fileName, what = "", sep = "\t", skip = 1), ncol = length(l1), byrow = TRUE)
myData = matrix(as.numeric(tmpM[,-1]), ncol = length(l1)-1, byrow = FALSE)
colnames(myData) = l1[-1]
rownames(myData) = tmpM[,1]

# remove unnecessary variables (objects) 
rm(fileName, tmpM, l1)

# check if the file was read in correctly
dim(myData)
head(myData)

# myData is a numeric matrix object
####################################################
