# requires package datasets (R-core package)
# requires package xtable - install.packages("xtable")

require(xtable)
xtable(anscombe, label = "ACtable", 
       caption = "Example table: Anscombe's Quartet of 'Identical' Simple Linear Regressions")
# just copy and paste this output in LaTeX

# same table with 3 decimals
xtable(anscombe, digits=3, label = "ACtable3", 
       caption = "Example table with 3 digits")

# same table with 3 decimals, but without the annoying row names
print(xtable(anscombe, digits=3, label = "ACtable3norow", 
             caption = "Example table with 3 digits, but without rownames"), 
      include.rownames=FALSE)

#sidewaystable - \usepackage{rotating} needed in LaTeX preamble
print(xtable(anscombe, digits=3, label = "ACtable3norow", 
             caption = "Example sidewaystable with 3 digits, but without rownames"), 
      include.rownames=FALSE,
      floating.environment = 'sidewaystable')

# if you have a long table that should span several pages 
# \usepackage{longtable} needed in LaTeX preamble
print(xtable(Loblolly , label = "APlongtable", 
             caption = "Example longtable: Growth of Loblolly pine trees"), 
      include.rownames=FALSE,
      tabular.environment = 'longtable', 
      floating = FALSE)

# see for more examples
# example(xtable) 
