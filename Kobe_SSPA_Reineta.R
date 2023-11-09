
library(readr)
library(egg)
library(ggthemes)
library(see)
library(tidyverse)
Kobe_Outputs <- read_csv("~/IFOP/CBA/REINETA/2023/SA/Brama_SA_2023/Kobe_Outputs.csv")
View(Kobe_Outputs)
# enero el vector con ambos parámetros


# Genero el diagrama con lo disppuesto por el CCTRDAP (Subpesca, 2015)


texto_coords <- data.frame(
  x = c(0.2, 1, 2.5, 2.3),   # Coordenadas x para los textos
  y = c(2, 2.5, 2.5, 0.2),   # Coordenadas y para los textos
  etiqueta = c("Agotada", "Plena Explotación", "Sobrexplotación", "Subexplotación")  # Textos que se agregarán
)


# Gráfico Zhou Model

zhou1 <- ggplot(Kobe_Outputs %>%
         filter(Escenario == "Zhou Model"))+
  #geom_line(aes(kobebro$BBMSY, kobebro$FFMSY)) +
  geom_rect(aes(xmin = 0, xmax = 0.95, ymin = 0, ymax = 3),
            fill = "#E43338", alpha = 0.5) +
  geom_rect(aes(xmin = 0.5, xmax = 0.95, ymin = 0, ymax = 3),
            fill = "#F2ED23", alpha = 0.5) +
  geom_rect(aes(xmin = 0.95, xmax = 1.05, ymin = 0, ymax = 3),
            fill = "#ACC39A", alpha = 0.5) +
  geom_rect(aes(xmin = 1.05, xmax = 3.5, ymin = 0, ymax = 1),
            fill = "#608D68", alpha = 0.5) +
  geom_rect(aes(xmin = 1.05, xmax = 3.5, ymin = 1, ymax = 3),
            fill = "#808080", alpha = 0.5) +
  geom_path(aes(x=B_Bmsy,y=F_Fmsy,label=Yr))+
  geom_point(aes(B_Bmsy, F_Fmsy),
             lwd=2) +
  geom_hline(yintercept = 1) +
  geom_vline(xintercept = c(0.5, 0.95, 1.05, 1, 1.05), linetype=2)+
  theme_few()+
  labs(x = expression("BD/BD"[RMS]), y = expression("F/F"[RMS]))+
  # geom_text(data = texto_coords, aes(x = x, y = y, label = etiqueta),
  #            vjust = -0.5)+
  geom_text(aes(x=B_Bmsy,y=F_Fmsy,label=Yr),
            nudge_y = 0.1,size = 3,
            check_overlap = TRUE)

zhou2 <- ggplot(Kobe_Outputs %>%
                  filter(Escenario == "Zhou Model"))+
  #geom_line(aes(kobebro$BBMSY, kobebro$FFMSY)) +
  geom_rect(aes(xmin = 0, xmax = 0.975, ymin = 0, ymax = 3),
            fill = "#E43338", alpha = 0.5) +
  geom_rect(aes(xmin = 0.5, xmax = 0.975, ymin = 0, ymax = 3),
            fill = "#F2ED23", alpha = 0.5) +
  geom_rect(aes(xmin = 0.975, xmax = 1.025, ymin = 0, ymax = 3),
            fill = "#ACC39A", alpha = 0.5) +
  geom_rect(aes(xmin = 1.025, xmax = 3.5, ymin = 0, ymax = 1),
            fill = "#608D68", alpha = 0.5) +
  geom_rect(aes(xmin = 1.025, xmax = 3.5, ymin = 1, ymax = 3),
            fill = "#808080", alpha = 0.5) +
  geom_path(aes(x=B_Bmsy,y=F_Fmsy))+
  geom_point(aes(B_Bmsy, F_Fmsy),
             lwd=2) +
  geom_hline(yintercept = 1) +
  geom_vline(xintercept = c(0.5, 0.975, 1.025, 1, 1.025), linetype=2)+
  theme_few()+
  labs(x = expression("BD/BD"[RMS]), y = expression("F/F"[RMS]))+
  # geom_text(data = texto_coords, aes(x = x, y = y, label = etiqueta),
  #            vjust = -0.5)+
  geom_text(aes(x=B_Bmsy,y=F_Fmsy,label=Yr),
            nudge_y = 0.1,size = 3,
            check_overlap = TRUE)

# Integrated Model

s7 <- ggplot(Kobe_Outputs %>%
         filter(Yr < 2024,
                Escenario == "Integrated Model S7"))+
  #geom_line(aes(kobebro$BBMSY, kobebro$FFMSY)) +
  geom_rect(aes(xmin = 0, xmax = 0.5, ymin = 0, ymax = 5),
            fill = "#E43338", alpha = 0.5) +
  geom_rect(aes(xmin = 0.5, xmax = 0.75, ymin = 0, ymax = 5),
            fill = "#F2ED23", alpha = 0.5) +
  geom_rect(aes(xmin = 0.75, xmax = 1.25, ymin = 0, ymax = 5),
            fill = "#ACC39A", alpha = 0.5) +
  geom_rect(aes(xmin = 1.25, xmax = 9, ymin = 0, ymax = 1),
            fill = "#608D68", alpha = 0.5) +
  geom_rect(aes(xmin = 1.25, xmax = 9, ymin = 1, ymax = 5),
            fill = "#808080", alpha = 0.5) +
  geom_path(aes(x=B_Bmsy,y=F_Fmsy,label=Yr))+
  geom_point(aes(B_Bmsy, F_Fmsy),
             lwd=2) +
  geom_hline(yintercept = 1) +
  geom_vline(xintercept = c(0.5, 0.75, 1.75, 1, 1.25), linetype=2)+
  theme_few()+
  labs(x = expression("BD/BD"[RMS]), y = expression("F/F"[RMS]))+
  # geom_text(data = texto_coords, aes(x = x, y = y, label = etiqueta),
  #            vjust = -0.5)+
  geom_text(aes(x=B_Bmsy,y=F_Fmsy,label=Yr),
            nudge_y = 0.1,size = 3,
            check_overlap = TRUE)

ggarrange(zhou1, zhou2, ncol =2)
