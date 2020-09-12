load("Workspaces/Simulation_Multivariate.RData")

type <- c("finite","Rubin")
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

out10_corrected <- rbind(out10[1,], out10BR[2,], out10[3:4,])
out <- rbind(out10_corrected,
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

#seperate tables
table_finite <- table[table$type == "finite", ]
table_rubin <- table[table$type == "Rubin", ]

#make print table
table_print_finite <- table_finite[c(1,3,5,7,9,11,13,15,17,19,2, 4, 6, 8, 10, 12, 14, 16, 18, 20),c(2, 3, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24)]
table_print_rubin <- table_rubin[c(1,3,5,7,9,11,13,15,17,19,2, 4, 6, 8, 10, 12, 14, 16, 18, 20),c(2, 3, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24)]

#LaTeX seperate tables
require(xtable)
print(xtable(table_print_finite, digits=3), include.rownames=FALSE)
print(xtable(table_print_rubin, digits=3), include.rownames=FALSE)

#LaTeX combined table
table_print_finite$ciw <- table_print_finite$upper - table_print_finite$lower
table_print_rubin$ciw <- table_print_rubin$upper - table_print_rubin$lower
table_combined <- cbind(table_print_finite[,c(1,2,7,8,9,13,12)],table_print_finite[,9],
                        table_print_rubin[,c(7,8,9,13,12)])
print(xtable(table_combined, digits=c(1, 2, 2, 0, 2, 2, 2, 3, 2,2 , 2, 2, 2, 3)), include.rownames=FALSE)
