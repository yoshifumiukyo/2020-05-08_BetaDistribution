############################################################
# R-project                                                #
# Program      : a1-BetaDist.r                             #
# Protocol     :                                           #
# Date         :                                           #
# Last         :                                           #
# Programmer   : yoshifumi ukyo                            #
#                                                          #
############################################################
# [Ver.0000]                                               #
# Memorandom   :                                           #
#                                                          #
############################################################


#----- clean-up working directory 
rm(list = (ls(all = TRUE)))
#----- library assignment 
base_dir <- ""
setwd(base_dir)



d1 <- data.frame(dist = "Beta(1, 1)", 
                 x = seq(from = 0, to = 1, by = 0.001), 
                 p = dbeta(x = seq(from = 0, to = 1, by = 0.001), shape1 = 1, shape2 = 1))
d2 <- data.frame(dist = "Beta(2, 2)", 
                 x = seq(from = 0, to = 1, by = 0.001), 
                 p = dbeta(x = seq(from = 0, to = 1, by = 0.001), shape1 = 2, shape2 = 2))
d3 <- data.frame(dist = "Beta(8, 2)", 
                 x = seq(from = 0, to = 1, by = 0.001), 
                 p = dbeta(x = seq(from = 0, to = 1, by = 0.001), shape1 = 8, shape2 = 2))
d <- rbind(d1, d2, d3)


library(ggplot2)
p <- ggplot(data = d, aes(x = x, y = p))
p <- p + theme_bw() 
p <- p + facet_wrap( ~ dist, ncol = 3)
p <- p + geom_line(size = 1.5, colour = "black")
p <- p + scale_x_continuous(limits = c(0, 1), breaks = seq(from = 0, to = 1, by = 0.25))
p <- p + scale_y_continuous(limits = c(0, 4.0), breaks = seq(from = 0, to = 3.5, by = 0.5))
p <- p + theme(strip.text = element_text(size = 14, colour = "black"))
p <- p + theme(axis.title = element_text(size = 14, colour = "black"))
p <- p + theme(axis.text = element_text(size = 14, colour = "black"))
ggsave(file = paste0(base_dir, "/output/a1-BetaDist.png"), plot = p, dpi = 400, w = 8, h = 4)



