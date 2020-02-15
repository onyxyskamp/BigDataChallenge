###############################################################################

#                              MAIN SCRIPT                                     #

################################################################################

#----------------------------TABLE OF CONTENTS----------------------------------

# - Overview
# - Packages downloaded
# - Libraries
# - Data Download 
# - Workflow 

################################################################################

#---------------------------------OVERVIEW--------------------------------------

#The following contents within this main directory include the packages, 
#libraries, dataset and the workflow that is used in this analysis. For the 
#purpose of this analysis the scripts should be run in the folling order to gain 
#replicatory results:

#    1. MainScript:(Data organization with the overview of the workflow used
#                   in this project)
#
#    2. DataCleaning: (How to clean the data that is used for these analyses)
#
#
#    3. DataAnalysis: WE NEED TO DESCRIBE THIS 

#------------------------------PACKAGE DOWNLOAD---------------------------------

# This is a list of all the packages used for thess analyses

#---------------------------------LIBRARIES-------------------------------------

# Load the packages in the libraries 

#--------------------------------DATA DOWLOAD-----------------------------------

# The raw data file was originally found from:
#     https://datadryad.org/stash/dataset/doi:10.5061/dryad.hp
# 38ct1?fbclid=IwAR2T0qNARXX80OK_fTSZ2B1B3hP4Wr2rCm9BawzTMmfgRSiTTihqGu3mZPM  
# The datasheet was then downloaded as a csv file. When downloading this 
# dataset as a csv, we saved the first worksheet titled Osteometrics. 

# The file of the raw data can be accessed with the following code.

working.dir <- getwd()

# This should be set to the working directory of
# the "Big_Data_Challenge_Emery_Onyx_Salma_Will" folder 

raw.data <- read.csv("Raw.Bison.Data.csv")

#-----------------------------------WORKFLOW------------------------------------

# In our working firectory we created 4 pathways to different folders with 
# specific outputs 

#           - 1.Raw.Data  -> the path to this folder is: rd.path
#                 (This folder contains a copy of the original downloaded
#                   data set without changes.)
#
#           - 2.Clean.Data -> the path to this folder is: cd.path
#                 (This folder contains  the cleaned data set.)
#
#           - 3.Analysis -> the path to this folder is: an.path
#                 (This folder contains saved outputs of our anaylsis.)
#
#           - 4.Graphs -> the path to this folder is: gr.path
#                 (This folder contains all visualizations of data.)

output.folders <- c("1.Raw.Data","2.Clean.Data","3.Analysis","4.Graphs")

# Check to see if the folders exist in the working directory and if they don't, 
# use the following loop. 
# The following loop checks the output.folders list and checks to see 
# if the folders exist in the working directory. If they don't it will create 
# them. 

# Make the folders using this loop code 
for(i in 1:length(output.folders)) 
  if(file.exists(output.folders[i]) == FALSE) 
    dir.create(output.folders[i])

#-------- Pathways----------

# The following is a directory of the pathways to each of our output folders

# Path to 1.Raw.Data folder
rd.path <- paste(working.dir,"/",output.folders[1], "/", sep="")

# Path to 2.Clean.Data
cd.path <- paste(working.dir,"/",output.folders[2], "/", sep="")

# Path to 3.Analysis
an.path <- paste(working.dir,"/",output.folders[3], "/", sep="")

# Path to 4.Graphs
gr.path <- paste(working.dir,"/",output.folders[4], "/", sep="")








# attempt to make a for loop of the data. 
print(bis)

dat.3 <- cbind.data.frame(name= c("mass", "dstl", "elev"), values= bis$mass, bis$dstl,                        bis$elev) #organize the data for the for loop 
print(dat.3 )                      
names.2 <- unique(dat.3$name)
print(names.2)

store <- rep(NA, length(names.2$values)# store the data 
print(store)


for(i in 1:length(names.2)){
  
  print(i)
  d.t <- dat.3[dat.3$name == names.2[i],]
  store[i] <- sum(dat.3$values)/ nrow(dat.3)
  print(names.2[i])
}



columns.compare <- c(bis$long, bis$elev, bis$temp) # Y axis 

print(columns.compare)

M <- c(bis$mass) #x axis 
print(M)

for(i in 1:length(columns.compare)-1){
  lm(bis[,1]~bis[,columns.compare[i+1]])
}

p

bis <- read.csv("~/Desktop/Data using R /RFiles&Data /BDC/2.Clean.Data/bis.csv")

head(bis)

names(bis)[names(bis)== "elev"] <- "Elevation"
names(bis)[names(bis)== "long"] <- "Longitude"
names(bis)[names(bis)== "lat"] <- "Lattitude"
names(bis)[names(bis)== "temp"] <- "Tempreture"

expl.variable <- c(2,3,4,5)
var.names <- colnames(bis)[expl.variable]


regr.results <- cbind.data.frame(intercept = rep(NA, length(expl.variable)), 
                                 coeffic = rep(NA, length(expl.variable)))

for(i in 1:4){
  
  #i <- 1
  model.t <- lm(bis$mass ~ bis[, expl.variable[i]] )
  regr.results[i,]  <- model.t$coefficients
  
  pdf(paste(i,".",var.names[i], ".pdf", sep = ""), width = 5, height = 5)
  plot(bis[, expl.variable[i]], bis$mass, main = var.names[i], ylab = "Mass", 
       xlab= var.names[i])
  dev.off
  
}










