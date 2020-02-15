################################################################################

#                                 DATA CLEANING                                #

################################################################################


#make a data frame including only the relevent colums and check that it worked
bison<-data.frame(Bison$Elevation..ASL..m, Bison$Long, Bison$Lat, Bison$GISP2.Temp..IntCal13., Bison$DstL)
head(bison)
str(bison)

# get rid of the missing data points and check that it works
biso <- na.omit(bison)
str(biso)

#rename the columns to make them more usable and check that it works
names(biso)[names(biso)== "Bison.Elevation..ASL..m"] <- "elev"
names(biso)[names(biso)== "Bison.Long"] <- "long"
names(biso)[names(biso)== "Bison.Lat"] <- "lat"
names(biso)[names(biso)== "Bison.GISP2.Temp..IntCal13."] <- "temp"
names(biso)[names(biso)== "Bison.DstL"] <- "dstl"
head(biso)

#find the number of rows contained in dstl
str(biso$dstl)
## 849 Rows

#create a new vector containing dstl converted to mass 
#the formula for converting to mass was given in the paper
#check that it worked 
mass <- (((biso$dstl[1:849])/11.43)^3)
head(mass)

#add a new column to the data frame
bis <- cbind(biso, mass)

#check that the data frame is working and has all that you want 
str(bis)

