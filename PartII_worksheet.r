getwd()
setwd("C:/...")
fileName = "Data_OldvsYoung.txt"
 
l1 = scan(fileName, sep = "\t", what = "", nlines = 1)
tmpM = matrix(scan(fileName, what="", sep="\t", skip=1), ncol=length(l1), byrow = TRUE)
myData= matrix(as.numeric(tmpM[,-1]), ncol=length(l1) -1, byrow=FALSE)
colnames(myData) = l1[-1]
rownames(myData) = tmpM[,1]
 
# remove variables (objects) you no longer need
rm(fileName, tmpM, l1)
 
# check if the file was read in correctly
dim(myData)
myData[1:4,1:3]

# for loop
# calculating the average of each row, here gene values
for(i in 1:dim(myData)[1]){
	averageV = mean(myData[i,])
	print(x)
}

averageV = NULL 
for(i in 1:dim(myData)[1]){
	tmpV = mean(myData[i,])
	averageV = c(averageV,tmpV)
	print(averageV) 
}

# calculating the average of each column, here conditions
averageV = NULL 
for(i in 1:dim(myData)[2]){
	tmpV = mean(myData[,i])
	averageV = c(averageV,tmpV)
}

plot(myData[1,], myData[2,])
colnames(myData)

group = c(rep("Old",18), rep("Young",19))
group

qplot(myData[1,], myData[2,], colour=group, xlab="Gene1", ylab="Gene2")
qplot(myData[1,], geom="density", colour=group)
qplot(myData[1,], geom="density", fill=group)
qplot(myData[1,], geom="histogram", fill=group)
qplot(myData[1,], geom="histogram", fill=group, binwidth=100)
qplot(myData[1,], geom="histogram", fill=group, binwidth=100, xlab=rownames(myData)[1])
 
# plotting two histograms side by side
MIN = round(min(as.vector(myData))-0.5,digits=0)
MAX = round(max(as.vector(myData))+0.5,digits=0)
split.screen(c(1,1))
plot(myData[1,], ylim=c(MIN,MAX), xlab="Measurement", ylab="Intensity", type="l", lwd=2, col=1)
for(i in 2:length(myData[,1])){
     screen(1, new=FALSE)
     plot(myData[i,], ylim=c(MIN,MAX), type="l", lwd=2, col="blue", xaxt="n", yaxt="n", ylab="", xlab="", main="", bty="n")
     }
screen(1, new=FALSE)
plot(rep(500, 37), ylim=c(MIN,MAX), type="l", lwd=2, col="red", xaxt="n", yaxt="n", ylab="", xlab="", main="", bty="n")
close.screen(all=TRUE)
 
#############################################################################################
# read in AA Dataset
# working with mixed datasets
# cannot use our script for reading in files because this datafile has numeric and categorical data
 
fileName="Data_AA.txt"
l1 = scan(fileName, sep = "\t", what = "", nlines = 1)
tmpM = matrix(scan(fileName, what="", sep="\t", skip=1), ncol=length(l1), byrow = TRUE)
tmpM[1:3,1:3]
airline = tmpM
colnames(airline) = l1
airline[1:4,1:4]
colnames(airline)
dim(airline)

# How many flights were canceled
x = which(airline[,13]==1)
length(x)
x[1:4]
airline[3,]
mean(airline[,12])
mean(airline[,12],na.rm=TRUE)
mean(as.numeric(airline[,12]))
mean(as.numeric(airline[,12]), na.rm=TRUE)

plot(as.numeric(airline[,11]),as.numeric(airline[,12]))
abline(a=0:1400, b=0:1400, col="red", lwd=2)
abline(a=1:1400, b=1:1400, col="green", lwd=2)
abline(a=-3:1400, b=-3:1400, col="blue", lwd=2)

# number of departure airports
length(unique(airline[,8]))
# number of arrival airports
length(unique(airline[,9]))
x = unique(airline[,9])
x[1:10]
dim(airline)
xx = which("DFW"== airline[,8])
length(xx)
xx[1:3]
DEFsub = airline[xx,]
yy = which("DFW"== airline[,8])
length(yy)
yy = which("MIA"== airline[,8])
length(yy)
MIAsub = airline[yy,]
newA = rbind(DEFsub,MIAsub)
newA[1:3,c(8,10,11)]
newA[1:3,c(8,11,12)]

group = newA[,8]
x = as.numeric(newA[,11])
y = as.numeric(newA[,12])

qplot(x, y, colour=group, xlab="Depart Delay", ylab="Arrival Delay")
# abline function does not work correctly within gplot graphs
# instead have to use gplots functions
p  = qplot(x, y, colour=group, xlab="Depart Delay", ylab="Arrival Delay") + geom_point()
p
# adding identity
p + geom_abline(intercept = 0, slope = 1)
p + geom_abline(intercept = 0, slope = 1, col="red")
# adding regression line for each departure airport
p + geom_smooth(method = "lm", se = FALSE)
 
#############################################################################################
# Working with categorical data
# Pie Chart
 
animal = c("cat", "mouse", "dog", "bird", "rabbit")
count = c(109,378,36,443,280)
# making a table including type of animal and its corresponding count
inputT = table(rep(animal,count))
 
pie(inputT, col=rainbow(length(animal), start=0.1, end=0.8), clockwise=T)
 
# Customizing colors for Pie Chart
# Creating a legend 
myColors = c("yellow1", "sienna1", "red1", "DeepSkyBlue2", "green")
 
pie(inputT, col=myColors, labels=NA, main="My animals")
legend("topright", legend=row.names(inputT), cex=1, bty="n", pch=15, pt.cex=1.8, col=myColors, ncol=1)
 
# Venn Diagram 
library(VennDiagram)

# Specifying group members
g1 = c("Marie", "Claus", "Stef", "Anna")
g2 = c("Tom", "Claus", "Laura", "Stef", "Betty")
g3 = c("Marie", "Tom", "Claus", "Clair", "Laura", "Beth")
 
# These graphics are not displayed as they are written to file directly, check your working directory
venn.diagram(list(G1 = g1,G2 = g2), fill=c("blue", "purple"), filename="Venn2sets.png")
venn.diagram(list(Goup1 = g1,Goup2 = g2, Group3 = g3), fill=c("blue", "purple", "green"), filename="Venn3sets.png")