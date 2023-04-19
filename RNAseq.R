### Housekeeping
true=TRUE
false=FALSE

### Install packages
install.packages(c('tidyverse', 'gplots', 'ggrepel'))
BiocManager::install(c('limma', 'DESeq2', 'AnnotationDbi', 'org.Hs.eg.db', 'ReportingTools', 'GO.db', 'GOstats', 'pathview', 'gage', 'gageData', 'select'))

### Load packages
library(DESeq2)
library(tidyverse)
library(gplots)

### Import data
countData = read.csv('https://raw.githubusercontent.com/mss-genomics/first-meeting/ce48486c5e0122edfba55220a477b80c48cbd397/GSE224783_readcount_trimmed.csv', header=1)

### Transform first column
rownames(countData) = countData$GeneID
countData = countData[,-1]
hist(countData$nonlesional_1, br=100)

### Log-transform data
logCountData = log2(1+countData)
hist(logCountData$nonlesional_1, br=100)

### Define the groups/variables
group = c("nonlesional", "nonlesional", "lesion", "nonlesional", "lesion", "lesion", "nonlesional", "lesion", "nonlesional", "lesion", "nonlesional", "lesion", "lesion", "nonlesional", "lesion",
"lesion", "lesion", "nonlesional", "lesion", "nonlesional", "nonlesional", "nonlesional")

colData = as.data.frame(cbind(colnames(countData), group))

### Build DESeq2 object
?DESeqDataSetFromMatrix
dds = DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~group)
dds = DESeq(dds)
nrow(dds)

### Filter out zeros
dds = dds[rowSums(counts(dds)) > 5,]
sizeFactors(dds)

### PCA plot
rld = rlog(dds)
plotPCA(rld, intgroup = "group")

### Heatmap - SETUP
detectGroups <- function (x){  # x are col names
  tem <- gsub("[0-9]*$","",x) # Remove all numbers from end
  #tem = gsub("_Rep|_rep|_REP","",tem)
  tem <- gsub("_$","",tem); # remove "_" from end
  return( tem )
  }

dist2 <- function(x, ...)   # distance function = 1-PCC (Pearson's correlation coefficient)
  as.dist(1-cor(t(x), method="pearson"))

hclust2 <- function(x, method="average", ...)  # average linkage in hierarchical clustering
  hclust(x, method=method, ...)

### Heatmap - PLOT
n=50
x=assay(rld)

if(n>dim(x)[1]) n = dim(x)[1] # max	as data
x = x[order(apply(x,1,sd),decreasing=TRUE),]  # sort genes by standard deviation
x = x[1:n,]   # only keep the n genes

# this will cutoff very large values, which could skew the color 
x=as.matrix(x[1:n,])-apply(x[1:n,],1,mean)
cutoff = median(unlist(x)) + 4*sd (unlist(x)) 
x[x>cutoff] <- cutoff
cutoff = median(unlist(x)) - 4*sd (unlist(x)) 
x[x< cutoff] <- cutoff

groups = detectGroups(colnames(x) )
groups.colors = rainbow(length(unique(groups) ) )

lmat = rbind(c(5,4),c(0,1),c(3,2))
lwid = c(1.5,4)
lhei = c(1,.2,4)

heatmap.2(x, distfun = dist2,hclustfun=hclust2,
          col=greenred(75), density.info="none", trace="none", scale="none", keysize=.5
          ,key=T, symkey=F
          ,ColSideColors=groups.colors[ as.factor(groups)]
          ,margins=c(8,12)
          ,cexRow=1
          ,srtCol=45
          ,cexCol=1.  # size of font for sample names
          ,lmat = lmat, lwid = lwid, lhei = lhei
)

### Differential gene expression analysis
resultsNames(dds)
res = results(dds)
head(res)
summary(res)

### Visualize data - blue = significant
DESeq2::plotMA(res, ylim=c(-5,5))

### Visualize data - adjusted p-val
res1 = as.data.frame(res)
res1 = mutate(res1, sig=ifelse(res$padj<0.1, "FDR<0.1", "Not significant"))
res1[which(abs(res1$log2FoldChange)<1.0), "sig"] = "Not significant"

ggplot(res1, aes(log2FoldChange, -log10(padj))) + geom_point(aes(col=sig)) + scale_color_manual(values=c("red", "black"))

### Identify specific genes
res = res[order(abs(res$log2FoldChange), decreasing = true),]
View(as.data.frame(res))
topGene = rownames(res)[1]
