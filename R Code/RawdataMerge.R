install.packages("dplyr")
install.packages("tidyr")
install.packages("reshape")
library(reshape)
library(dplyr)
library(tidyr)

setwd("/Users/vigneshkarthikeyan/Desktop")
data1<- read.table("rawData1.csv",sep=",", header= TRUE)
data2<- read.table("rawData2.csv",sep=",", header= TRUE)
Result1<- data.frame(data1)
Result2<- data.frame(data2)
Result1
Result2
dplyr::tbl_df(Result1)
dplyr::tbl_df(Result2)
utils::View(Result1)
utils::View(Result2)
A <-dplyr::filter(Result1, Channel == "MILDRED SCHOOL 1")    #Filtering a specific column
utils::View(A)
#remove(B)
B<-A %>%  ungroup() %>%select(-Channel)  #Ungrouping "channel" column
utils::View(B)

y<-3
x<-y+1
y<-x+11
T_0<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_0)
x<-y+1
y<-x+11

T_1<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_1)
x<-y+1
y<-x+11

T_2<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_2)
x<-y+1
y<-x+11

T_3<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_3)
x<-y+1
y<-x+11
T_4<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_4)
x<-y+1
y<-x+11
T_5<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_5)
x<-y+1
y<-x+11
T_6<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_6)
x<-y+1
y<-x+11
T_7<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_7)
x<-y+1
y<-x+11
T_8<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_8)
x<-y+1
y<-x+11
T_9<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_9)
x<-y+1
y<-x+11
T_10<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_10)
x<-y+1
y<-x+11
T_11<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_11)
x<-y+1
y<-x+11
T_12<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_12)
x<-y+1
y<-x+11
T_13<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_13)
x<-y+1
y<-x+11
T_14<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_14)
x<-y+1
y<-x+11
T_15<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_15)
x<-y+1
y<-x+11
T_16<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_16)
x<-y+1
y<-x+11
T_17<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_17)
x<-y+1
y<-x+11
T_18<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_18)
x<-y+1
y<-x+11
T_19<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_19)
x<-y+1
y<-x+11
T_20<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_20)
x<-y+1
y<-x+11
T_21<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_21)
x<-y+1
y<-x+11
T_22<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_22)
x<-y+1
y<-x+11
T_23<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_23)


utils::View(B)
C <- B[ -c(4:291) ]
utils::View(C)

D<-C %>% gather(hour, kWh, T_0:T_23)
utils::View(D)

#D<-arrange(D,Date,variable)
#utils::View(D)

#######################################################REsult2

A <-dplyr::filter(Result2, Channel == "MILDRED SCHOOL 1")
utils::View(A)
#remove(B)
B<-A %>%  ungroup() %>%select(-Channel)
utils::View(B)

y<-3
x<-y+1
y<-x+11
T_0<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_0)
x<-y+1
y<-x+11

T_1<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_1)
x<-y+1
y<-x+11

T_2<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_2)
x<-y+1
y<-x+11

T_3<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_3)
x<-y+1
y<-x+11
T_4<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_4)
x<-y+1
y<-x+11
T_5<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_5)
x<-y+1
y<-x+11
T_6<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_6)
x<-y+1
y<-x+11
T_7<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_7)
x<-y+1
y<-x+11
T_8<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_8)
x<-y+1
y<-x+11
T_9<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_9)
x<-y+1
y<-x+11
T_10<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_10)
x<-y+1
y<-x+11
T_11<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_11)
x<-y+1
y<-x+11
T_12<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_12)
x<-y+1
y<-x+11
T_13<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_13)
x<-y+1
y<-x+11
T_14<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_14)
x<-y+1
y<-x+11
T_15<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_15)
x<-y+1
y<-x+11
T_16<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_16)
x<-y+1
y<-x+11
T_17<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_17)
x<-y+1
y<-x+11
T_18<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_18)
x<-y+1
y<-x+11
T_19<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_19)
x<-y+1
y<-x+11
T_20<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_20)
x<-y+1
y<-x+11
T_21<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_21)
x<-y+1
y<-x+11
T_22<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_22)
x<-y+1
y<-x+11
T_23<-(rowSums(B[,x:y]))
B<-dplyr::mutate(B,T_23)


utils::View(B)
C <- B[ -c(4:291) ]
utils::View(C)

D1<-C %>% gather(hour, kWh, T_0:T_23)
utils::View(D1)

#Combine both csv
Raw_df<-dplyr::bind_rows(D1, D)

Raw_df<-tidyr::separate(Raw_df, hour,c("n","hour"))
Raw_df<-Raw_df %>%  ungroup() %>%select(-n)
utils::View(Raw_df)

#get seperate day month year
Raw_df<-tidyr::separate(Raw_df, Date, c("month","day","year"))

#add Date column
Raw_df$Date <- as.Date(with(Raw_df, paste(year, month, day,sep="/")), "%Y/%m/%d") 

#get week day from dates
DayofWeek<-as.POSIXlt(Raw_df$Date)$wday

Raw_df<-dplyr::mutate(Raw_df,DayOfWeek)


#check for weekday
Raw_df$Weekday<-ifelse(Raw_df$DayOfWeek > 0 & Raw_df$DayOfWeek < 6, "1", "0")    

#peek hour column
Raw_df <- Raw_df %>% mutate(hour = as.numeric(hour))
###remove(fc_dff)
Raw_df$Peakhour<-ifelse(Raw_df$hour > 6 & Raw_df$hour < 20, "1", "0")

utils::View(Raw_df)

