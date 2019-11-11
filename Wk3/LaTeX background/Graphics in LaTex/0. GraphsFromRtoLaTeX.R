set.seed(123)
library(mice)
plot(mice::nhanes)
imp <- mice(mice::boys)

#save a plot as a postscript file (you'll have to render it before you can display it)
postscript("Plots/epsplot.eps")
plot(nhanes)
dev.off()

#save a plot as a pdf file
pdf("Plots/pdfplot.pdf")
plot(nhanes)
dev.off()

#save a plot as a pdf file with fixed dimensions
pdf("Plots/pdfplot2.pdf", width = 16, height = 9)
plot(nhanes)
dev.off()

#save a plot as a pdf file with fixed dimensions
pdf("Plots/pdfplot2a.pdf", width = 4, height = 2)
plot(nhanes)
dev.off()

#save a plot as a multiple pages pdf file
pdf("Plots/pdfplot3.pdf", onefile = TRUE)
plot(imp)
dev.off()