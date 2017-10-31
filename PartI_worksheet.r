####################################################
# Finding Help within R
####################################################
help.start()  					# any help function requires internet connection
help(<functionName>)			# replace <functionName> by any R function, e.g., hist
?<functionName>
example(<functionName>)
help.search("scatterplot") 	# general search function
								# can also be used with key word, e.g., "scatterplot"
demo()
demo(grapics)
####################################################
# Setting Directory
####################################################
getwd()
setwd("C:/ <TAB>")
getwd()
####################################################
# Vectors and simple manipulation
x = c(5, 64, 7, 3)
y = 4:7
z = seq(4,7)
u = seq(1, 11, by=2)
v = seq(1, 11, by=3)
w = rep(7, 4)							
k = sample(1:100, 20, replace=TRUE)  

new1 = cbind(x,y)
new2 = rbind(z,v)
x+y
x^2
x
x[3]
x[10]= 4
x

length(k)
sum(k)
sum(k)/length(k)
mean(k)
####################################################
# R has build in dataset
# some packages also come with build in data which are used in tutorials
data()
# women is one of them
women
# dimension of a dataset
dim(women)
nrow(women)
ncol(women)
rownames(women)
colnames(women)
# indexing - matrix[rowIndex, columnIndex]
# data entry of first row and first column
women[1,1]
# first entire row 
women[1,]
# second entire column
women[,2]
# rows 1 through 4, column 1 through 2
women[1:4,1:2]
# instead of index, the column name can be used as well
women$height
# easy stats functions
meanh  = mean(women[,1])
meanw  = mean(women[,2])
hmin   = min(women[,1])
hmax   = max(women[,1])
stDevW = sd(women[,2])
# summarizes data entries
table(women)
# histogram
hist(women[,1])
hist(women[,1], breaks = seq(57, 73, by=1))
# ending an R session (closing the R window)
q()
####################################################
# Reading files
####################################################
# conventional function for .csv files
read.csv("myFile.csv", header = TRUE)
# also works for text files
dat = read.csv("Data_AA.txt", header = TRUE, sep="\t")
# header is TRUE or FALSE specifying if the file has a column header
# sep indicates how the .txt file is separated, e.g., "," or " "

# this function does the same
# there is never just one way to do a task
dat1 = read.table("Data_AA.txt", header=TRUE, sep="\t")

# reads files line by line
# what - indicates the type of data to be scanned - I leave "" for everything
# nline - number of lines to read
# skip - number of lines to skip
scan("Data_AA.txt", what="", sep="\t", nline=1, skip=1)
scan("Data_AA.txt", what="", sep="\t", nline=3, skip=1)
####################################################
# Data Exploration
####################################################
# after the data are read in, check if the format looks right
head(dat)
tail(dat)
typeof(dat)
typeof(dat1)

unique(dat$YEAR)
unique(dat$MONTH)
unique(dat$DAY)
dim(dat)

# taking the last 4 columns and formatting them into a numeric matrix
AA_delays = dat[,-(1:9)]
head(AA_delays)
is.numeric(AA_delays)
typeof(AA_delays)

AA_delaysM = as.matrix(AA_delays)
head(AA_delaysM)
is.numeric(AA_delaysM)
typeof(AA_delaysM)

range(dat)
range(AA_delaysM)
range(AA_delaysM, na.rm=TRUE)
range(AA_delaysM, na.rm=TRUE)
range(AA_delaysM[,3], na.rm=TRUE)

# returns index ids for flight that did not arrive late or early
index = as.vector(which(AA_delaysM[,3] == 0))
# number of flight arriving at exact time
length(index)
AA_delaysM[index[1:4],]

sort(AA_delaysM[,3])
table(AA_delaysM[,3])

hist(AA_delaysM[,3])
abline(v = 60, col="red", lwd = 2)

cor(AA_delaysM[,2:3], method="spearman", use="pairwise.complete.obs")
cor(AA_delaysM[,2:3], method="pearson", use="pairwise.complete.obs")
cor(AA_delaysM[,2:3], method="kendall", use="pairwise.complete.obs")

plot(AA_delaysM[,2], AA_delaysM[,3])
plot(AA_delaysM[,2], AA_delaysM[,3], xlab = "DEPARTURE_DELAY", ylab=" ARRIVAL_DELAY")

barplot(AA_delaysM[,3])
barplot(AA_delaysM[1:100,3])
boxplot(AA_delaysM[,3])

# simple statistics
mn_AD = mean(AA_delaysM[,3], na.rm=TRUE)
md_AD = median(AA_delaysM[,3], na.rm=TRUE)
vr_AD = var(AA_delaysM[,3], na.rm=TRUE)
st_AD = sd(AA_delaysM[,3], na.rm=TRUE)

mn_DD = mean(AA_delaysM[,2], na.rm=TRUE)
st_DD = sd(AA_delaysM[,2], na.rm=TRUE)

new_AA_delaysM = rbind(c(NA, mn_DD, mn_AD, NA), c(NA, st_DD, st_AD, NA), AA_delaysM)
head(new_AA_delaysM)
rownames(new_AA_delaysM) = c("Mean", "StaDev", seq(1:nrow(AA_delaysM)))

write.table(new_AA_delaysM, "modFlightDat.csv", quote=FALSE, row.names=TRUE, col.names=FALSE, sep=",")
write.table(new_AA_delaysM, "modFlightDat.txt", quote=FALSE, row.names=TRUE, col.names=TRUE, sep="\t", append=FALSE)

# an easy way to save R objects is by saving them as .RData files
save(new_AA_delaysM, file="new_AA_delaysM.RData")
q()
load("new_AA_delaysM.RData")
objects()

# can save more than one object 
# good coding tip: give the objects meaningful names, not x and y
save(x, y, file=”dataObjects.RData”)
####################################################
# Hitogram 
####################################################
myData = sample(1:200, 30, replace=TRUE)  

hist(myData)
# Minimum 
min(myData)
# Maximum
max(myData)
# setting custom subintervals 
hist(myData, breaks=seq(0,200,by=10))
hist(myData, breaks=seq(0,200,by=10), col="pink")

# barplot() versus hist()
barplot(myData, col="blue")
####################################################
# plotting two histograms side by side in one window
myData2 = sample(13:253, 40, replace=TRUE)  

par(mfrow = c(2, 1))
hist(myData, breaks=seq(0, 260, by = 20), col="green", xlab="Random Set 1", main="Values")

hist(myData2, breaks=seq(0, 260, by = 20), col="red", xlab="Random Set 2")
q()
####################################################
# scatter plot and graphical parameters
####################################################
myData = read.table("Data_controltreatment.txt", header=TRUE, sep="\t")

plot(myData[,2], myData[,3])
plot(myData[,2], myData[,3], ylab="Treatment", xlab="Control", main="Drug1")

# Changing circles to dots, pch= has a number of different plotting symbol options
plot(myData[,2], myData[,3], ylab="Treatment", xlab="Control", main="Drug1", pch=19)
# Making dots smaller by setting cex=
plot(myData[,2], myData[,3], ylab="Treatment", xlab="Control", main="Drug1", pch=19, cex=0.5)
plot(myData[,2], myData[,3], ylab="Treatment", xlab="Control", main="Drug1", pch=19, cex=0.3)
plot(myData[,2], myData[,3], ylab="Treatment", xlab="Control", main="Drug1", pch=19, cex=0.3, col="purple")

# Adding a regression line lm(y~x)
# lm - linear models
abline(lm(myData[,3]~myData[,2]), col="blue")

# Changing thickness and color  of regression line
abline(lm(myData[,3]~myData[,2]), col="red", lwd=2)
abline(lm(myData[,3]~myData[,2]), col="red", lwd=4)

#Adding some more lines just for fun
#v= for vertical line
#h= for horizontal line

abline(v=8, col="SpringGreen2", lwd=2)
abline(h=12, col="DeepSkyBlue", lwd=6)
abline(h=6, col="firebrick1", lwd=6, lty=4)

####################################################
# histogram script
####################################################
fileName = 
TITLE    = 
xAXIS    = 
COLOR    = 
vec      = 
numBins  =                     # number of histogram’s subintervals

# MIN and MAX will always be integers
MIN = round(min(vec)-0.5, digits=0)
MAX = round(max(vec)+0.5, digits=0)

png(filename = paste(fileName, ".png", sep=""), width=7, height=8.5, units="in", pointsize=12, bg="white",res=600)
h = hist(vec, breaks=seq(MIN, MAX, by=(MAX-MIN)/numBins), col=COLOR, xlab=xAXIS, main=TITLE)
dev.off()

####################################################
# read in numeric data file script
####################################################
fileName = ""

# make sure the file is in table format
# line 1 should have the same length as line 2

line1  = scan(fileName, sep = "\t", what = "", nlines = 1)
tmpM   = matrix(scan(fileName, what="", sep="\t", skip=1), ncol=length(line1), byrow = TRUE)
myData = matrix(as.numeric(tmpM[,-1]), ncol=length(line1) -1, byrow=FALSE)
colnames(myData) = line1[-1]
rownames(myData) = tmpM[,1]

# remove variables (objects) you no longer need
rm(fileName, tmpM, line1)

# check if the file was read in correctly
dim(myData)
head(myData)

# myData is a numeric matrix object
