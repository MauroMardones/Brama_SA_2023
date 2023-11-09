library(tidyverse)
library(ggthemes)
library(egg)
library(see)

r <- c(0.6056412,
       0.6416342,
       0.6500071,
       0.6575291,
       0.6834757)
rm <- mean(r)
rsd <- sd(r)

k <- c(184245.4,
       190570.5,
       192454.4,
       194271.5,
       200181)
km <- mean(k)
ksd <- sd(k)

msy <- c(28660.35,
         30776.75,
         31256.02,
         31762.22,
         33680.84)
msym <- mean(msy)
msysd <- sd(msy)


bend <- c(48659.46,
          76655.01,
          83879.74,
          90829.26,
          111493.03)
bendm <- mean(bend)
bendsd <- sd(bend)

# colores  '#a6611a','#dfc27d','#80cdc1','#018571'
# Generar datos aleatorios con distribución normal para r
datosr <- rnorm(1000, mean = rm, sd = rsd)


# Crear un data frame
dfr <- data.frame(Valores = datosr)

# Crear el gráfico con ggplot
rplot <- ggplot(dfr, aes(x = Valores)) +
  geom_density(fill = '#a6611a',
               color = '#a6611a',
               alpha = 0.5) +
  geom_vline(aes(xintercept = 0.65),
             color = 'red') +
  ggtitle('Distribución r') +
  xlab('') +
  ylab('Densidad')+
  theme_few()


# Generar datos aleatorios con distribución normal para k
datosk <- rnorm(1000, mean = km, sd = ksd)


# Crear un data frame
dfk <- data.frame(Valores = datosk)

# Crear el gráfico con ggplot
kplot <- ggplot(dfk, aes(x = Valores)) +
  geom_density(fill = '#dfc27d',
               color = '#dfc27d',
               alpha = 0.5) +
  geom_vline(aes(xintercept = 192454.4),
             color = 'red') +
  ggtitle('Distribución k') +
  xlab('') +
  ylab('Densidad')+
  theme_few()

# Generar datos aleatorios con distribución normal para msy
datosmsy <- rnorm(1000, mean = msym, sd = msysd)


# Crear un data frame
dfmsy <- data.frame(Valores = datosmsy)

# Crear el gráfico con ggplot
msyplot <- ggplot(dfmsy, aes(x = Valores)) +
  geom_density(fill = '#80cdc1',
               color = '#80cdc1',
               alpha = 0.5) +
  geom_vline(aes(xintercept = 31225.6),
             color = 'red') +
  ggtitle('Distribución msy') +
  xlab('') +
  ylab('Densidad')+
  theme_few()

# Generar datos aleatorios con distribución normal para biomasa final
datosbend <- rnorm(1000, mean = bendm, sd = bendsd)

# Crear un data frame
dfbend <- data.frame(Valores = datosbend)

# Crear el gráfico con ggplot
bendplot <- ggplot(dfbend, aes(x = Valores)) +
  geom_density(fill = '#018571',
               color = '#018571',
               alpha = 0.5) +
  geom_vline(aes(xintercept = 83879),
             color = 'red') +
  ggtitle('Distribución Biomasa 2023') +
  xlab('') +
  ylab('Densidad')+
  theme_few()

ggarrange(kplot, rplot, msyplot, bendplot, ncol=2)



# Crear un ggplot vacío
p <- ggplot() +
  theme_few() +
  geom_vline(xintercept = 1,
             linetype = 'dashed',
             color = 'red')+
  geom_hline(yintercept = 0.318,
             color = 'blue')+
  xlim(0,3)+
  ylim(0,0.5)+
  ylab('Fishing Mortality') +
  xlab('B/Brms')
p
# Puedes personalizar más si lo deseas, por ejemplo, establecer los límites de los ejes
# p <- p + xlim(-1, 1) + ylim(-1, 1)



