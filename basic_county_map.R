library(ggplot2)
library(maps) #maps package contains shape files
library(readxl)
library(maptools)
library(rgeos)
library(Cairo)
library(ggmap)
library(scales)
library(RColorBrewer)

setwd("~/R files/Mapping")
#load us map data
all_county <- map_data("county")
#import rate data to map
cntyrate <- read_excel("countyrate.xlsx")
str(cntyrate)
countyor <- subset(all_county, region %in% c( "oregon" ) )
mergesets <- merge(countyor, cntyrate, by="subregion", all.x=TRUE)
mergesets$rate1 = as.numeric(mergesets$rate1 ) #allows "NAs"
k <- ggplot() +
  geom_polygon(data = mergesets, 
               aes(x = long, y = lat, group = group, fill = rate1), 
                color= "#005595", size = 0.25) + 
  coord_map()+
  scale_fill_distiller(name="Rate per 100,000", palette = "Blues", breaks = pretty_breaks(n = 4))+
  theme_nothing(legend = TRUE)+
  labs(title="Rate of X in Oregon")
k

###save as a png
 ggsave(k, file = "map1.png", width = 6, height = 4.5, type = "cairo-png")
###or...save as a pdf
pdf("mymap.pdf")
print(k)
dev.off()
