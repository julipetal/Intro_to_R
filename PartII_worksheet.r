getwd()
setwd("C:/...")


dat = read.csv("Data_OldvsYoung.txt", sep="\t", header=TRUE)
head(dat)
hist(dat)
rownames(dat) = dat[,1]
dat[1:3,1:3]
dat1 = dat[,-1]
dat1[1:3,1:3]
hist(dat1)
myData = as.matrix(dat1) 
hist(myData)
 
# write a function for histogram 

# for loop
# calculating the average of each row, here gene values
for(i in 1:nrow(myData)){
	averageV = mean(myData[i,])
	print(averageV)
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

library(ggplot2)
qplot(myData[1,], myData[2,], colour=group, xlab="Gene1", ylab="Gene2")
qplot(myData[1,], geom="density", colour=group)
qplot(myData[1,], geom="density", fill=group)
qplot(myData[1,], geom="histogram", fill=group)
qplot(myData[1,], geom="histogram", fill=group, binwidth=100)
qplot(myData[1,], geom="histogram", fill=group, binwidth=100, xlab=rownames(myData)[1])
 
 # plotting multiple lines in one graph
 MIN = min(myData)
 MAX = max(myData)
 numRow = nrow(myData)
 numCol = ncol(myData)
 colorScheme = rainbow(numRow)

 plot(c(1,numCol), c(MIN,MAX), cex = 0, xlab = "Condition", ylab = "Measurement")
 for( i in 1:numRow){
		points(1:numCol, myData[i,], col = colorScheme[i])
		lines(1:numCol, myData[i,], col = colorScheme[i])

 }
#############################################################################################
# weather data
W = read.csv("Data_weather.txt", sep="\t", header=TRUE)

library(latticeExtra)
Temperature <- xyplot(Temp ~ TimePt, W, type = "l" , lwd=2)
Humidity <- xyplot(Humid ~ TimePt, W, type = "l" , lwd=2)
doubleYScale(Temperature, Humidity, add.ylab2 = TRUE)	

#############################################################################################
# weather data	
airline = read.csv("Data_AA.txt", sep="\t", header=TRUE)

# number of departure airports
length(unique(airline[,8]))
# number of arrival airports
length(unique(airline[,9]))

index = which(airline[,8] == "DFW")
DFWsub = airline[index,]

index = which(airline[,8] == "MIA")
MIAsub = airline[index,]

newA = rbind(DFWsub,MIAsub)
newA[1:3,c(8,10,11)]

group = newA[,8]
x = as.numeric(newA[,11])
y = as.numeric(newA[,12])


qplot(x, y, colour=group, xlab="Depart Delay", ylab="Arrival Delay")

p  = qplot(x, y, colour=group, xlab="Depart Delay", ylab="Arrival Delay") + 
		geom_point()
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