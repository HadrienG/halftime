library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
africa <- map_data("world")

mau <- data.frame(
    long = c(57.5522),
    lat = c(-20.3484))
kenya <- map_data("world", region = "Kenya")
mauritius <- map_data("world", region = "Mauritius")
ggplot() +
    geom_polygon(data = africa, color = "white",
                 aes(x=long, y = lat, group = group)) +
    geom_polygon(data = kenya, fill = "red",
                 aes(x=long, y = lat, group = group)) +
    geom_polygon(data = mauritius, fill = "red",
                 aes(x=long, y = lat, group = group)) +
    # geom_point(data = mau, aes(x = long, y = lat), color = "red", size = 2) +
    coord_fixed(1.3) +
    xlim(-18, 58) + ylim(-35, 40) +
    xlab("") +
    ylab("") +
    theme_minimal() +
    theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
ggsave(filename = "map_cropped.png", device = "png", path = "assets/img/", bg = "transparent")
