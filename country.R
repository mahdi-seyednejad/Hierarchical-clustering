df1 <- read.csv('country_info_numbers.csv',row.names = 1)
#df1<- max(df1)-df1
#sim.by.hclust <- hclust(as.dist(df1))

## To see some stats
# desc_stats <- data.frame(
#   Min = apply(df1, 2, min), # minimum
#   Med = apply(df1, 2, median), # median
#   Mean = apply(df1, 2, mean), # mean
#   SD = apply(df1, 2, sd), # Standard deviation
#   Max = apply(df1, 2, max) # Maximum
# )
# 
# desc_stats <- round(desc_stats, 1)
# head(desc_stats)

## Clustering
df1 <- scale(df1)

# Dissimilarity matrix
d <- dist(df1, method = "euclidean")

# Hierarchical clustering using Ward's method
res.hc <- hclust(d, method = "ward.D2" )

# Plot the obtained dendrogram
plot(res.hc, cex = 0.6, hang = -1)

##############################


##### The comparing part

df1 <- read.csv('country_info_numbers.csv',row.names = 1)
df1 <- scale(df1)

# Dissimilarity matrix
d <- dist(df1, method = "euclidean")
hc1 <- hclust(d, method = "ward.D2" )


df2 <- read.csv('country_corr_df_pr.csv',row.names = 1)
df2<- max(df2)-df2
hc2 <- hclust(as.dist(df2))

# Create two dendrograms
#dend0 <- as.dendrogram (hc0)
dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)


#tanglegram(dend1, dend2)

#entanglement(dend_list)

dend_list <- dendlist(dend1, dend2)


tanglegram(dend1, dend2,
           highlight_distinct_edges = FALSE, # Turn-off dashed lines
           common_subtrees_color_lines = TRUE, # Turn-off line colors
           common_subtrees_color_branches = TRUE, # Color common branches 
           main = paste("entanglement =", round(entanglement(dend_list), 2))
           
)


# Create a list of dendrograms
dend_list <- dendlist(dend1, dend2)

dend_list_multi <- dendlist("Family" = dend0, "Distance" = dend1,
                            "Emoji" = dend2)

cors <- cor.dendlist(dend_list)

# Visualize the correlation matrix using corrplot package
#library(corrplot)
corrplot(cors, "pie", "lower")


cor.dendlist(dend_list, method = "cophenetic")

