NP_Species <- read_sheet("https://docs.google.com/spreadsheets/d/1hfK3ptAkMU4AiM5PknHe4IebFl29wEWNdMKpc5nEC4M/edit#gid=0")
NP_Species



ggplot(data = NP_Species) +
geom_point(mapping = aes(x = plot, y = cover, color = Treatment))
