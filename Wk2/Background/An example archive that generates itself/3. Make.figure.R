load("Workspaces/Simulation_Multivariate.RData")

type <- c("Finite rules","Rubin's rules")
var <- c("Y1", "Y1", "Y2", "Y2")
mis <- c(rep(.10, 4),
         rep(.20, 4),
         rep(.30, 4),
         rep(.40, 4),
         rep(.50, 4),
         rep(.60, 4),
         rep(.70, 4),
         rep(.80, 4),
         rep(.90, 4),
         rep(.95, 4))

out <- rbind(out10BR,
             out20,
             out30,
             out40,
             out50,
             out60,
             out70,
             out80,
             out90,
             out95)

#make table
table <- data.frame(type, var, mis, out)
rownames(table) <- NULL

#make figure
require(lattice)


pdf(file="Coverageplot.pdf", width=9, height=4)
key.variety <- list(corner=c(1,0.90), text = list(levels(table$type), col = c("#0080ff","#ff00ff")), points = list(pch = 1:2, col = c("#0080ff","#ff00ff")))
xyplot(coverage~mis|var, 
       groups=type, 
       data=table, 
       ylim = c(0.92,1.01), 
       type="o", 
       key = key.variety,
       lwd=2,
       pch = c(1:2),
       xlab = "Percentage Missingness", 
       ylab = "Coverage Rate",
       panel = function(...) {
         panel.abline(h=0.95, col="grey", lwd=2)
         panel.xyplot(...)
       })
dev.off()