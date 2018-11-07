# Read Teh csv data frame
df1 <- read.csv('simMAt_df.csv',row.names = 1)
df1<- max(df1)-df1
sim.by.hclust <- hclust(as.dist(df1))
plot(sim.by.hclust)

df <- read.csv('corr_df_pr.csv',row.names = 1)
df<- max(df)-df
sim.by.hclust <- hclust(as.dist(df))
plot(sim.by.hclust)

# Set the lang names as the index
#rownames(df) <- df$X

# Delete the column containing the index
#df$X <-NULL

##### The comparing part
df1 <- read.csv('simMAt_df.csv',row.names = 1)
df1<- max(df1)-df1
hc1 <- hclust(as.dist(df1))


df2 <- read.csv('corr_df_pr.csv',row.names = 1)
df2<- max(df2)-df2
hc2 <- hclust(as.dist(df2))

# Create two dendrograms
dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)

# Create a list of dendrograms
#dend_list <- dendlist(dend1, dend2)

tanglegram(dend1, dend2)




