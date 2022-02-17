source(file = "scripts/functions/install_packages.R")
ngo <- read_excel("data/raw/Exercice_R.xlsx", sheet = 1)
idh <- read_excel("data/raw/Exercice_R.xlsx", sheet = 2) %>%
  pivot_longer(names_to="annee", values_to="idh", c("1999":ncol(.)))%>%
  mutate(idh=as.numeric(idh),
         annee = as.numeric(annee),
         Country = ifelse(Country == "Bolivia (Plurinational State of)", "Bolivia", 
                          ifelse(Country == "Hong Kong, China (SAR)", "Hong Kong", 
                                 ifelse(Country == "Korea (Republic of)", "Korea", Country))))%>%
  filter(!is.na(idh))
data <- idh %>%  
  left_join(ngo, by=c("Country"="Pays d'origine", "annee"="Année"))
  
check <- ngo %>%
  select(Country =`Pays d'origine`) %>%
  distinct() %>%
  anti_join(data %>%
              filter(!is.na(Organisation)) %>%
              select(Country) %>%
              distinct(), 
            by = "Country")
  
idh %>% filter(grepl("orea", Country)) %>% select(Country) %>% distinct()

write.xlsx(data, "output/data/results.xlsx")
