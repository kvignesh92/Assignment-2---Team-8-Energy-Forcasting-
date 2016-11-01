install.packages("MASS")
install.packages("ISLR")
install.packages("forecast")
install.packages("leaps")
install.packages("weathermetrics")
library(MASS)
library(ISLR)
library(forecast)
library(leaps)
library(weathermetrics)

getwd()

df <- read.table("Reg_data.csv",sep=",",header=TRUE)
attach(df)
df=na.omit(df)
head(df)

names <- c("year","month","day","hour","Conditions","DayofWeek","Weekday","Peakhour","WindDirDegrees")
df[,names] <- lapply(df[,names] , factor)
str(df)

########################################################################
tab <- table(df$Conditions)
df<-df[df$Conditions %in% names(tab)[tab>2],]
########################################################################

#75% of sample size
smp_size<-floor(0.75 * nrow(df))

#set the seed to make your partition reproductible
set.seed(123)
train_ind<-sample(seq_len(nrow(df)),size = smp_size)

#split the data into training and testing
train<-df[train_ind,]
test<-df[-train_ind,]

#fit a linear regression model
lm.fit=lm(kWh~month+Humidity+day+hour+DayofWeek+Weekday+Conditions+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees,data=train)
summary(lm.fit)
d<-confint(lm.fit, level=0.95)

print<-accuracy(lm.fit)
write.csv(d, file = "performance_metrics.csv")
#head(train)
#sapply(df,mode)
plot(lm.fit)

#measure of predictive accuracy
L = predict(lm.fit,test)
accuracy(L, train$kWh)
lm.fittest=lm(kWh~month+Humidity+day+hour+DayofWeek+Weekday+Conditions+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees,data=test)
print2<-summary(lm.fit)

print2df<-as.data.frame(print2)

print2df

print2<- data.frame(print2)
write.csv(print2df, file = "Regression_Output.csv")
#variable selection
#1 exhaustive search
#train=na.omit(train)

#1 Backward selection in two ways
x_1<-step(lm(kWh~month+Humidity+day+hour+DayofWeek+Conditions+Weekday+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees,data=train),direction = "backward")
summary(x_1)
#2 Forward selection in two ways
x_2<-step(lm(kWh~1,data=train),direction="forward",scope=~month+Humidity+day+Conditions+hour+DayofWeek+Weekday+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees)
summary(x_2)
#3 Stepwise method in two ways
#trainto<-train[complete.cases(train),]
#trainto=na.omit(trainto)
#x_3<-step(lm(kWh ~ month+Humidity+day+year+DayofWeek+Conditions+hour+Weekday+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees),data=trainto,direction = "both")
#summary(x_3)
#compare models

accuracy(x_3)
#Stepwise Regression
library(MASS)
fit <- lm(kWh~month+Humidity+day+DayofWeek+Conditions+hour+Weekday+Peakhour+Temperature+Dew_PointF+Sea_Level_PressureIn+VisibilityMPH+Wind_SpeedMPH+WindDirDegrees,data=train)
step <- stepAIC(fit, direction="both")
step$terms# display results


##################################################
#forcast
f_df <- read.table("forecast_data.csv",sep=",",header=TRUE)
attach(f_df)
f_df=na.omit(f_df)
Temperature<-fahrenheit.to.celsius(f_df$TemperatureF, round = 1)
f_df<-mutate(f_df,Temperature)

names <- c("year","month","day","hour","Conditions","DayofWeek","Weekday","Peakhour","WindDirDegrees")
f_df[,names] <- lapply(f_df[,names] , factor)
f_df[,"Wind_SpeedMPH"] <- as.numeric(as.character(f_df[,"Wind_SpeedMPH"]))
f_df$Wind_SpeedMPH
#http://www.maineharbors.com/weather/windscal.htm, Calm = 0-1 MPH
f_df[is.na(f_df)] <- 0
f_df<-f_df[complete.cases(f_df),]
new.kWh<-predict(lm.fit, data.frame(f_df), type="response")

new.kWh
fore_cast<-mutate(f_df,new.kWh)
write.csv(fore_cast, file = "forecastOutput.csv")
required<-c("Date","hour","Temperature","new.kWh")
fore_cast1<-transmute(fore_cast,Date,hour,Temperature,new.kWh)
write.csv(fore_cast1, file = "forecastOutput_Account_26908650026.csv")

#cross validation
# K-fold cross-validation
install.packages("DAAG")
library(DAAG)
cv.lm(train, lm.fit, m=3) # 3 fold cross-validation

#ridge
library(glmnet)
library("MASS")
install.packages("taRifx")
library( taRifx )
#dat<-train
dat<-transmute(train,Temperature,VisibilityMPH,Wind_SpeedMPH,kWh,Sea_Level_PressureIn,WindDirDegrees)
#dat <- japply( dat, which(sapply(dat, class)=="character"), as.numeric )
dat$WindDirDegrees<-as.numeric(dat$WindDirDegrees)
is.numeric(dat$WindDirDegrees)

str(dat$WindDirDegrees)
str(da)

class(dat$WindDirDegrees)

train_x <- as.matrix(scale(subset(dat, select = -kWh)))
train_y <- as.matrix(scale(dat$kWh))

cvfit = cv.glmnet(train_x, train_y)
plot(cvfit)

ridge <- glmnet(train_x, train_y,alpha = 0)
plot(ridge)

lasso <- glmnet(train_x, train_y,alpha = 1)
plot(lasso)

elas <- glmnet(train_x, train_y,alpha = 0.5)
plot(lasso)


##########################################