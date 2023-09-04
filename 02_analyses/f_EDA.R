# univariate EDA plots
plot_eda <- function(dat){
  
  g1 <- ggplot(dat, aes(y = log(n.plot), l.n.plot0)) +
    geom_hex()
  
  g2 <- ggplot(dat, aes(y = log(n.plot), census.interval)) +
    geom_hex()
  
  g3 <- ggplot(dat, aes(y = log(n.plot), for.dev)) +
    geom_hex()
  
  g4 <- ggplot(dat, aes(y = log(n.plot), aridity)) +
    geom_hex()
  
  g5 <- ggplot(dat, aes(y = log(n.plot), bio11)) +
    geom_hex()
  
  (g1 + g2) /
    (g3 + g4) /
    (g5 + plot_spacer())
  
}

# coplots
coplot_n0_ci <- function(dat){
  coplot(log(n.plot) ~ l.n.plot0 | census.interval,
         data = dat)
}

coplot_n0_fd <- function(dat){
  coplot(log(n.plot) ~ l.n.plot0 | for.dev,
         data = dat)
}

coplot_n0_fd_arid <- function(dat){
  coplot(log(n.plot) ~ l.n.plot0 | for.dev * aridity,
         data = dat)
}

coplot_n0_fd_bio11 <- function(dat){
  coplot(log(n.plot) ~ l.n.plot0 | for.dev * bio11,
         data = dat)
}

coplot_fd_arid <- function(dat){
  coplot(log(n.plot) ~ for.dev | aridity,
         data = dat)
}

coplot_fd_bio11 <- function(dat){
  coplot(log(n.plot) ~ for.dev | bio11,
         data = dat)
}
