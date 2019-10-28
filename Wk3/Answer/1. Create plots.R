#load package lattice 
require(lattice)
#fix the random generator seed
set.seed(123)
#create data
data <- rnorm(1000)

#save histogram as a pdf file
pdf("Plots/a.pdf", width = 4, height = 4)
histogram(data)
dev.off()
#save densityplot as a pdf file
pdf("Plots/b.pdf", width = 4, height = 4)
densityplot(data^12 / data^10, xlab = expression(data^12/data^10))
dev.off()
#save stripplot as a pdf file
pdf("Plots/c.pdf", width = 4, height = 4)
stripplot(data^2, xlab = expression(data^2))
dev.off()
#save boxplot as a pdf file
pdf("Plots/d.pdf", width = 4, height = 4)
bwplot(exp(data))
dev.off()

#TABLE
require(xtable)
#matrix with all data used
data.all <- cbind(data = data, 
                  squared1 = data^12 / data^10,
                  squared2 = data^2,
                  exponent = exp(data))
#generate latex code
xtable(head(data.all, n=9))