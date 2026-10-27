install.packages("DNAseqtest")
data("DNase")
head(DNase, 3)
?DNase

mean_density <- aggregate(density~conc,
                          data=DNase,
                          FUN = mean)
barplot(
  height = mean_density$density,
  names.arg = mean_density$conc,
  col= "pink",
  main= 'This plot was created by the goat',
  xlab= "Concentration (mg/L)",
  ylab= "Mean optical density (units?)",
  cex.names=0.8
  )
