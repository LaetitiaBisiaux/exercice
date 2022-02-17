data <- data.frame(p = c("A", "A", "A", "B", "B", "B"),
                   a = c(2000, 2001, 2002, 2000, 2001, 2002),
                   v = c(1:6))
resume <- data %>%
  group_by(p) %>%
  summarise(v = sum(v))

ggplot() +
  geom_bar(data = resume,
           aes(x = p,
               y = v,
               fill = p),
           stat = "identity") +
  scale_fill_viridis_d(option = "plasma")



ggplot() +
  geom_point(data = resume,
           aes(x = p,
               y = v,
               size = v,
               color = p)) +
  theme_minimal() + theme(legend.position = "none") +
  labs(x = "Pays",
       y = "Somme des valeurs",
       title = "Graphique de merde") +
  scale_color_viridis_d(option = "plasma")



ggplot() +
  geom_point(data = resume,
             aes(x = p,
                 y = v),
             color = "blue") +
  theme_minimal() + theme(legend.position = "none") +
  labs(x = "Pays",
       y = "Somme des valeurs",
       title = "Graphique de merde")



ggplot() +
  geom_bar(data = data %>%
             group_by(p) %>%
             summarise(v = sum(v)),
           aes(x = p,
               y = v,
               fill = p),
           stat = "identity") +
  scale_fill_viridis_d(option = "plasma")
