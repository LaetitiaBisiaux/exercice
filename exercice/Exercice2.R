source(file = "scripts/functions/install_packages.R")

catch <- read_excel("data/raw/catch.xlsx", sheet = 1) %>%
  pivot_longer(names_to="year", values_to="weight", c("1950":ncol(.))) %>%
  mutate(weight=as.numeric(weight), weight=weight/1000000,
         year = as.numeric(year)) %>%
  group_by(year)%>%
  summarize(total=sum(weight, na.rm = TRUE))%>%
  ungroup()

ggplot(data = catch,
       aes(x = year,
           y = total))+
  geom_bar(stat = "identity",
           width=0.8)+
  labs(x = "year",
       y = "Total annual catch (million t)",
       title = "le plus beau graphique") +
  theme(axis.text.x = element_text(angle=45),
        legend.position = "right") +
  scale_x_continuous(breaks = c(1950:2013))
  


ggplot(data = catch,
       aes(x = year,
           y = total,
           size=total))+
  geom_point()+
  geom_smooth(data = catch %>% filter(year <= 1996),
              method = lm)+
  geom_smooth(data = catch %>% filter(year >= 1996),
              method = lm)+
  stat_cor(label.y = 90) +
  stat_regline_equation(label.y = 80)+
  geom_smooth(data = catch)+
  labs(x = "year",
       y = "Total annual catch (million t)",
       title = "Amusons-nous") +
  theme(axis.text.x = element_text(angle=90)) 
