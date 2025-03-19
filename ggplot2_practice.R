library(tidyverse)

los_data <- read_csv("los.csv")
head(los_data)

glos <- mutate(los_data, los= as.numeric(discharged-vdate)) %>% 
  ggplot(aes(x = los)) +
  geom_bar(color="red", fill="blue") + 
  labs(title = "Length of Stay in Hospital", x = "Length of Stay (in days)", y = "Frequency") +
  theme_minimal() +
  theme(plot.title = element_text(hjust=.5, size=20),
        axis.ticks = element_line(),
        panel.border = element_rect(fill = NA, linewidth = 2),
        axis.text = element_text(size=20),
        axis.title = element_text(size=20)
        ) +
  facet_wrap(~ facid)

glos

gbmi <- los_data %>% 
  ggplot(aes(x=facid, y=bmi, fill = gender)) +
  geom_boxplot(color="black", outlier.shape = NA) +
  scale_fill_manual(name = "Gender",
                    values = c("F" = "steelblue", "M" = "tomato"),
                    labels = c("F" = "Female", "M" = "Male"),
                    limits = c("M", "F")
                    )+
  theme_minimal() +
  labs(x="Facility ID", y = expression(BMI~(kg/m^2)), title = "BMI by Facility") + 
  theme(panel.border = element_rect(fill=NA),
        axis.ticks = element_line(),
        axis.text = element_text(size = 20),
        axis.title = element_text(size = 20)
        )


gbmi
