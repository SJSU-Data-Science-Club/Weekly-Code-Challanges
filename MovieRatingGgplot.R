#This example has been taken from Udemy - R Programming A-Z for Data Science

#Data set on movie ratings (2007-2011)
movies<- read.csv("Movie-Ratings.csv") 
colnames(movies)<-c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
movies$Year<- factor(movies$Year) 
head(movies, n= 13)

#install ggplot2
install.packages("ggplot2")
library("ggplot2")

#Relation beteen AudienceRating and CriticRating 
#DATA and AESTHETICS
ggplot(data= movies, aes(x= CriticRating, y= AudienceRating))

#save in an object
p<- ggplot(data= movies, aes(x= CriticRating, y= AudienceRating))

#Adding the geom layer
p + geom_point()

#MAPPING V/S SETTING

p + geom_point(colour= "red") #setting the dots red

#Relation beteen AudienceRating and CriticRating with  respect to Genre

p + geom_point(aes(colour= Genre)) #Mapping  colour of the points  to Genre

p + geom_point(aes(colour= Genre, size = BudgetMillions)) #Mapping  size of the points  to Budget

t<- p + geom_point(aes(colour= Genre, size = BudgetMillions)) 

#Improvise
t + geom_line(aes(colour= Genre))

t <-t +  geom_smooth( fill= NA, aes(colour= Genre)) + xlim (0,100) + ylim(0, 100)
t

#Grids for each Genre
t + facet_grid(rows= vars(Genre)) 

#Grids for each Genre and Year  
t + facet_grid(rows= vars(Genre), col= vars(Year)) + ggtitle("Grid-Scatter Plot")

`#.....................................................................................................................

#LAYERING

#BOXPLOT
b <-ggplot(data= movies , aes(x= Genre, y= AudienceRating, colour= Genre))
b + geom_boxplot()

#jitter on top
b + geom_boxplot() + geom_jitter( alpha = 0.3 , aes(colour= Genre))

#box on top
b + geom_jitter( alpha = 0.3 , aes(colour= Genre)) + geom_boxplot( alpha = 0.5) + ggtitle("Box Plot")



#.....................................................................................................................

#HISTOGRAM
h<- ggplot()+ geom_histogram(data= movies , aes(x= BudgetMillions, fill= Genre), 
                             colour= "black", binwidth = 10)

h + facet_grid(rows= vars(Genre))

 