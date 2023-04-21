2+2

log(8, base = 2)
seq(0, 10, by=2)
?seq

1==1
1!=2
1==1 & 1==2
1==1 | 1==2

x <- 1
y <- 2
z <- x + y
z

fruit1 <- "apples"
fruit2 <- "oranges"
fruit3 <- "pears"
fruit <- c(fruit1, fruit2, fruit3)
fruit
fruit[1]
fruit[2]
fruit[3]
length(fruit)
number <- c(5, 12, 7)

basket <- data.frame(fruit, number)
rbind(fruit, number)

basket$fruit[1]
basket[,1]
basket[1,]
basket[2:3,]
basket$fruit=="apples"
basket[basket$fruit=="apples",]
basket[basket$fruit=="apples",]$number

install.packages(c("BiocManager", "tidyverse", "epitools"))
BiocManager::install("biomaRt")
library(tidyverse)
