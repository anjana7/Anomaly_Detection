
#anomaly detection using R

train = read.csv("path to dataset + /Bike-Sharing-Dataset/hour.csv")

X <- train[,c(3,5,6,8,9,10,11,12,13,14,15,16)] #input data

kmeans.result <- kmeans(X, centers=5)

kmeans.result$centers #prints the cluster centre values for each feature

centers <- kmeans.result$centers[kmeans.result$cluster, ]
distances <- sqrt(rowSums((X - centers)^2))
outliers <- order(distances, decreasing=T)[1:5]

print(outliers) # these are the row numbers of the top 5 outliers

print(X[outliers,]) #these are the row values of these 5 outliers

plot(X[,c("hr","cnt")], pch=19, col=kmeans.result$cluster, cex=1)

points(kmeans.result$centers[,c("hr","cnt")], col=1:3, pch=15, cex=2)

points(X[outliers, c("hr","cnt")], pch="+", col=4, cex=3)


