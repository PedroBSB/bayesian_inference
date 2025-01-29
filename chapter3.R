setwd("/Users/pedroalbuquerque/Desktop/Youtube")
load("gss.RData")


df<-gss[gss$YEAR==1998 & gss$AGE>=65 & gss$FEMALE==1, c("YEAR","AGE","HAPUNHAP")]
df$HAPUNHAP <- as.numeric(df$HAPUNHAP)
df$HAPUNHAP <- ifelse(df$HAPUNHAP > 4, NA, df$HAPUNHAP)
df$HAPUNHAP <- ifelse(df$HAPUNHAP<=2, 1, df$HAPUNHAP)
df$HAPUNHAP <- ifelse(df$HAPUNHAP>2, 0, df$HAPUNHAP)
df=df[!is.na(df$HAPUNHAP),]
write.csv(df, "hapiness.csv",row.names = FALSE)
