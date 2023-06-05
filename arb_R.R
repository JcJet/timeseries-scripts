library(readr)
library(tseries)
SBER <- read_csv("Downloads/SBER.csv", col_types = cols(`<DATE>` = col_date(format = "%Y%m%d"), 
                                                        `<TIME>` = col_time(format = "%H%M%S")))
SBERP <- read_csv("Downloads/SBERP.csv", col_types = cols(`<DATE>` = col_date(format = "%Y%m%d"), 
                                                        `<TIME>` = col_time(format = "%H%M%S")))

p <- SBER$`<CLOSE>`
q <- SBERP$`<CLOSE>`

len = min(length(q),length(p))
p <- p[0:len]
q <- q[0:len]
min(length(q),length(p))
plot(p,q, xlab="Sec1", ylab="Sec2")
comb1 = lm(p~q)
comb2 = lm(q~p)
plot(comb1$residuals, type="l")
plot(comb2$residuals, type="l")
adf.test(comb1$residuals, k=1)
adf.test(comb2$residuals, k=1)
par(new=T)
plot(p, type="l", col="blue")
plot(q, type="l", axes=F, col="red")
par(new=F)