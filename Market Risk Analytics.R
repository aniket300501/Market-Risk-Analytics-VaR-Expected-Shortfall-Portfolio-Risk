####Market Risk Analytics#############
library(TTR)
library(fGarch)
library(ghyp)
library(BUSI4428)
library(MASS)

# ---------- Utility Functions ---------- #

compute_returns <- function(price_series) {
  ret <- ROC(price_series, type = "discrete")
  ret <- ret[-1]
  return(as.numeric(ret))
}

var_es_historical <- function(ret, pt, alpha = 0.95) {
  loss <- -pt * ret
  VaR <- quantile(loss, alpha)
  ES  <- mean(loss[loss > VaR])
  list(VaR = VaR, ES = ES)
}

vol_adjust_returns <- function(ret) {
  ret_dm <- ret - mean(ret)
  gfit <- garchFit(ret_dm, trace = FALSE)
  vol  <- volatility(gfit)
  scale <- tail(vol, 1) / vol
  ret_adj <- ret_dm * scale + mean(ret)
  return(ret_adj)
}
#############Single Asset Analysis###############

ret_met <- compute_returns(MET$Adj.Close)

summary(ret_met)
hist(ret_met, breaks = 50)
plot(ret_met, type = "l")


###Historical Simulation
pt <- 1e6
hs_met <- var_es_historical(ret_met, pt)
hs_met


###Age Weighted Historical Simulation
HS_aw(ret_met, pt)

###Hull White Approach
ret_hw <- vol_adjust_returns(ret_met)
hw_met <- var_es_historical(ret_hw, pt)
hw_met

###Parametric Normal (no Volatility Adjustment)
g_norm <- gauss(mean(ret_met), sd(ret_met))
g_loss <- transform(g_norm, multiplier = -pt)

VaR_norm <- qghyp(0.95, g_loss)
ES_norm  <- ESghyp(0.95, g_loss, distr = "loss")

###Parametric Normal (With Volatility Adjustment)
ret_norm_adj <- vol_adjust_returns(ret_met)
g_norm_adj <- gauss(mean(ret_norm_adj), sd(ret_norm_adj))
g_loss_adj <- transform(g_norm_adj, multiplier = -pt)

VaR_norm_adj <- qghyp(0.95, g_loss_adj)
ES_norm_adj  <- ESghyp(0.95, g_loss_adj, distr = "loss")

###Heavy Tailed Distribution (No Volatility Adjustment)
fit_t <- fit.tuv(ret_met, symmetric = TRUE)
loss_t <- transform(fit_t, multiplier = -pt)

VaR_t <- qghyp(0.95, loss_t)
ES_t  <- ESghyp(0.95, loss_t, distr = "loss")

###Heavy-Tailed Distribution (With Vol Adj)
ret_t_adj <- vol_adjust_returns(ret_met)
fit_nig <- fit.NIGuv(ret_t_adj, symmetric = TRUE)
loss_nig <- transform(fit_nig, multiplier = -pt)

VaR_nig <- qghyp(0.95, loss_nig)
ES_nig  <- ESghyp(0.95, loss_nig, distr = "loss")


#######Multi Asset Analysis###########

####Returns
ret_pru <- compute_returns(Prudential.life.insurance$Adj.Close)
pret <- na.omit(cbind(ret_met, ret_pru))

####Histrorical Simulation
pt2 <- 2e6
w <- c(0.5, 0.5)

portfolio_loss <- function(returns, weights, pt) {
  rowSums(-pt * sweep(returns, 2, weights, "*"))
}

loss_p <- portfolio_loss(pret, w, pt2)

VaR_p <- quantile(loss_p, 0.95)
ES_p  <- mean(loss_p[loss_p > VaR_p])

#####Hull White(Vol adjusted)
ret_met_adj <- vol_adjust_returns(ret_met)
ret_pru_adj <- vol_adjust_returns(ret_pru)

pret_adj <- na.omit(cbind(ret_met_adj, ret_pru_adj))
loss_hw_p <- portfolio_loss(pret_adj, w, pt2)

VaR_hw_p <- quantile(loss_hw_p, 0.95)
ES_hw_p  <- mean(loss_hw_p[loss_hw_p > VaR_hw_p])

####Parametric Normal
g_port <- gauss(mu = colMeans(pret), cov = cov(pret))
loss_port <- transform(g_port, multiplier = -pt2 * w)

VaR_port <- qghyp(0.95, loss_port)
ES_port  <- ESghyp(0.95, loss_port, distr = "loss")
