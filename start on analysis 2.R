library(BiodiversityR)

NP_Species <- read_sheet("https://docs.google.com/spreadsheets/d/1hfK3ptAkMU4AiM5PknHe4IebFl29wEWNdMKpc5nEC4M/edit#gid=0")
NP_Species

Houston_Species <- read_sheet("1-VpDe1FBQKK1nWYI_HOV8qVGD1fSHKUoe65E11iqOEU")

data<-
  bind_rows(
    NP_Species, 
    Houston_Species
  )

count(data, taxa) %>% 
  count()

count(data, site, taxa) %>% 
  count(site)

data_presence_site <- 
  data %>% 
  distinct(site, taxa) %>% 
  mutate(present = TRUE) %>% 
  pivot_wider(
    names_from = "site", 
    values_from = "present", 
    values_fill = FALSE
  ) %>% 
  print()

filter(
  data_presence_site,
  !Houston,
  !NP
) %>% 
  arrange(taxa)

ggplot(data = NP_Species) +
geom_point(mapping = aes(x = plot, y = cover, color = Treatment))
