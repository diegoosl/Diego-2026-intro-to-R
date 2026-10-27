library(ggplot2)
tyre <- read.csv("C:/Users/diego/Documents/Diego 2026 intro to R/tyre.csv")
tyre
head(tyre)
books <- read.csv("C:/Users/diego/Documents/Diego 2026 intro to R/books.csv")
head(books)

colores = c("red", "blue","yellow", "green")
plot <- ggplot(data=tyre,
       aes(x= Brands, y= Mileage)) +
geom_boxplot(fill= colores) + labs(title= "Marcas de llantas y cuanto aguantan",
                                       x= "Marcas Caras",
                                       y= "Millas"
                                       ) +
  theme_bw() +
  theme(legend.position = 'none') +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12)
  )

summary(tyre)
mod <- aov(Mileage ~Brands, data=tyre)
mod
summary(mod)

resid_anova <- residuals(mod)
shapiro.test(resid_anova)
TukeyHSD(mod)
plot(TukeyHSD(mod))

plot
ggsave(
  filename = "Mileage_by_Brand.png",
  plot = plot,
  width = 8, height = 6, dpi = 300)


?ggsave
