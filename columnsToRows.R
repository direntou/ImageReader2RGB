# ImageReader2RGB
#using R to turn the row coming from Azure ML's image reader into R, G, B values

# Map 1-based optional input ports to variables
dataset <- maml.mapInputPort(1) 
df<- data.frame(dataset)

#Extract the red, green and blue columns respectively
df_red<-df[ , grepl( "Red" , names( df ) ) ]
df_green<-df[ , grepl( "Green" , names( df ) ) ]
df_blue<-df[ , grepl( "Blue" , names( df ) ) ]

#transpose and assign the columns names
df_red_out <- as.data.frame(t(df_red))
colnames(df_red_out)<-paste0("R")
df_green_out <-as.data.frame(t(df_green))
colnames(df_green_out)<-paste0("G")
df_blue_out <-as.data.frame(t(df_blue))
colnames(df_blue_out)<-paste0("B")

#cbind the three columns into one data frame
df_out<-cbind(df_red_out,df_green_out,df_blue_out)

maml.mapOutputPort("df_red_out")
