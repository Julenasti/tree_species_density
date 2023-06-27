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

# maps
map_vars <- function(dat, var){
  map_data("world") %>% 
    ggplot(aes(x = long, y = lat)) +
    geom_polygon(aes(fill = NA, group = group),
                 color = "black", size = 0.5, fill = NA) +
    coord_fixed(xlim = c(-140, 40), ylim = c(25, 70), ratio = 1.3) +
    geom_point(data = dat,
               aes(x = longitude,
                   y = latitude,
                   color = .data[[var]]),
               size = 0.3) +
    xlab("Longitude") +
    ylab("Latitude") +
    scale_colour_viridis() +
    theme(
      plot.margin = margin(0, 0, 0, 0),
      axis.title = element_blank(),
      axis.text.x = element_text(colour = "grey50", size = 8),
      axis.text.y = element_text(colour = "grey50", size = 8),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(colour = "grey90", size = 0.5),
      axis.line = element_blank(),
      legend.key = element_blank(),
      panel.background = element_blank()
    )
}

