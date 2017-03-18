####################################################
# histogram script
####################################################
TITLE = 
xAXIS = 
COLOR = 
vec = 
numBins =                     # number of histogram’s subintervals/bins
fileName =

# MIN and MAX will always be integers
MIN = round(min(vec)-0.5, digits=0)
MAX = round(max(vec)+0.5, digits=0)

png(filename = paste(fileName, ".png", sep=""), width=7, height=8.5, units="in", pointsize=12, bg="white",res=600)
h = hist(vec, breaks=seq(MIN, MAX, by=(MAX-MIN)/numBins), col=COLOR, xlab=xAXIS, main=TITLE)
dev.off()

vec = as.vector(myData)
MIN = round(min(vec)-0.5, digits=0)
MAX = round(max(vec)+0.5, digits=0)