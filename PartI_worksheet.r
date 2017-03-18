####################################################
# Finding Help in R
####################################################
help.start()
help(<functionName>)
?<functionName>
help.search("<functionName>")
example(<functionName>)
demo()
demo(grapics)
####################################################
#Setting Directory
####################################################
getwd()
setwd("C:/ <TAB>")
getwd()
####################################################
# Let’s start to play
x = c(5, 64, 7, 3)
y = 4:7
z = seq(4,7)
t = seq(1, 11, by=2)
u = seq(1, 11, by=2)
v = c(34, 65, 0, 7)
new1 = cbind(x,v)
new2 = rbind(x,v)
x+v
x^2
x[3]
x[4]= 4
length(x)
sum(x)
sum(x)/length(x)
mean(x)
####################################################
# R has internal dataset
data()
# women is one of them
women
# checking the dimension of the dataset 
dim(women)
rownames(women)
colnames(women)
# indexing, [row, column]
# entry in the first row and first column
women[1,1]
# first entire row 
women[1,]
# second entire column
women[,2]
# rows 1 through 4, column 1 through 2
women[1:4,1:2]
# instead of index, the column name can be used as well
women$height
# easy stat functions
meanh = mean(women[,1])
meanw = mean(women[,2])
hmin = min(women[,1])
hmax = max(women[,1])
# summarizes data entries
table(women)
# histogram
hist(women[,1])
hist(women[,1], breaks = seq(57, 73, by=1))
hist(women[,1], breaks = seq(hmin-1, hmax+1, by=1))
# ending an R session (closing the R window)
q()
####################################################

data()
dim(trees)
colnames(trees)
rownames(trees)
trees[1:4,]
trees[12,]
trees_mod = trees
trees_mod[12,2] = 79
# making a vector of length 31 with 150s
numCherry = rep(150, 31)
new_trees = cbind(trees_mod, numCherry)
colnames(new_trees)
colnames(new_trees[4]) = "Number of Cherries"
dim(new_trees)

# investigating data
# range of data entries of the entire matrix
range(new_trees)    
# range of column 2            
range(new_trees[,2])
colnames(new_trees)
# returns index ids for trees that have a height of 50’’ or higher
index = as.vector(which(new_trees[,3]>=50))
new_trees[index,]
table(new_trees[,3])
# histogram of tree heights, 
hist(new_trees[,3])
abline(v = 50, col="red", lwd = 2)
sort(new_trees[,3])
cor(new_trees[,2:3], method="spearman")
cor(new_trees[,2:3], method="pearson")
corM = cor(new_trees[2:3], method="spearman")
corM[1,2]
plot(new_trees[,2], new_trees[,4])
barplot(new_trees[,3])
mn = mean(new_trees[,3])
md = median(new_trees[,3])
vr = var(new_trees[,3])
st = sd(new_trees[,3])

####################################################

# Reading files
# Conventional function for .csv files
read.csv(data.csv, header = TRUE)
# functions offering a little more flexibility
# header is TRUE or FALSE specifying if the file has a column header
# sep indicates how the .txt file is separated, could also be "," or " "
read.table("Data_OldvsYoung.txt", header=TRUE, sep="\t")

# reads files line by line
# what - what's read - I leave “” for everything
# nline - number of lines to read
# skip - number of lines to skip
scan("mData_OldvsYoung.txt", what="", sep="\t", nline=1, skip=1)
scan("Data__controltreatment.txt", what="", sep="\t", nline=15, skip=1)
####################################################

# Saving
write.table(myData, “myDataM.csv”, quote=FALSE, row.names=TRUE, col.names=FALSE, sep=”,”)
write.table(myData, “myDataM.txt”, quote=FALSE, row.names=FALSE, col.names=TRUE, sep=”\t”, append=FALSE)

# an easy way to save R objects is by saving them as .RData files

save(new_trees, file=”trees.RData”)
q()
load(“trees.RData”)
objects()

# Can save more than one object 
# Good coding tip: give the objects meaningful names, not x and y

save(x, y, file=”dataObjects.RData”)

####################################################
# Histogram versus Barplot
####################################################
# use the readinFile script to read in a test file
# e.g. fileName = "Data_controltreatment.txt"
hist(myData[,1])

# barplot() versus hist()
# hist gives the histogram and gives an 
barplot(myData[,1])

####################################################
# plotting two histograms side by side in one window
# with same axis
# below works for "Data_controltreatment.txt"
min(myData[,1])
max(myData[,1])

min(myData[,2])
max(myData[,2])

# lowest MIN and highest MAX
MIN = 2
MAX = 15

# number of bins for the histogram
# try again and change the number of bins
numBins = 20

par(mfrow = c(2, 1))
hist(myData[,1], breaks=seq(MIN, MAX, by = (MAX-MIN)/numBins), col="green", xlab="Control", main="Values for Control Group")
hist(myData[,2], breaks=seq(MIN, MAX, by = (MAX-MIN)/numBins), col="red", xlab="Treatment", main="Values for Treatment Group")

####################################################
# scatter plot
####################################################
plot(myData[,1], myData[,2])

plot(myData[,1], myData[,2], ylab="Treatment", xlab="Control", main="Drug1")

# Changing circles to dots, pch= has a number of different plotting symbol options
plot(myData[,1], myData[,2], ylab="Treatment", xlab="Control", main="Drug1", pch=19)
# Making dots smaller by setting cex=
plot(myData[,1], myData[,2], ylab="Treatment", xlab="Control", main="Drug", pch=19, cex=0.5)
plot(myData[,1], myData[,2], ylab="Treatment", xlab="Control", main="Drug", pch=19, cex=0.3)

# Adding a regression line lm(y~x)
abline(lm(myData[,2]~myData[,1]), col="blue")

# Changing thickness of regression line
abline(lm(myData[,2]~myData[,1]), col="blue", lwd=2)
abline(lm(myData[,2]~myData[,1]), col="blue", lwd=4)

#Changing color of regression line
abline(lm(myData[,2]~myData[,1]), col="maroon2", lwd=4)

#Adding some more lines just for fun
#v= for vertical line
#h= for horizontal line

abline(v=8, col="SpringGreen2", lwd=2)
abline(h=12, col="DeepSkyBlue", lwd=6)
abline(h=6, col="firebrick1", lwd=6, lty=4)