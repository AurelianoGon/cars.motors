
library(tidyverse)
install.packages( c( "nycflights13", "gapminder", "Lahman" ))
library(ggplot2)

# Visualização de dados com GGplot2
# Carros com motores maiores usam mais combustíveis que carros com motores menores?
# Com essa visualização de dados tornaremos a resposta mais precisa
# A seguir a descrição das variáveis do Banco de Dados MPG:
# displ (o tamanho do motor de um carro, em litros.)
# hwy (a eficiência do combustível de um carro na estrada)
#

data(mpg)
ggplot2::mpg
ggplot( data = mpg ) +
  geom_point(aes(x = displ , y = hwy ) )

# O primeiro gráfico mostra uma relçao negativa entre o tamanho do motor e a eficiência 
# do combuatível
# O Banco de dados possui 234 linhas e 11 colunas

# Neste gráfico temos uma relação negativa entre o tamanho do motor(displ) e a eficiência do combustível.
ggplot(mpg) +
  geom_point(aes(x = hwy, y = cyl))


# Gráfico de dispersão de hwy versus cyl
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  labs(x = "Tamanho do Motor (litros)",
       y = "Eficiência de Combustível na Estrada",
       title = "Gráfico de Dispersão: Tamanho do Motor vs Eficiência de Combustível")

#Este gráfico mostra as classes de carros disponíveis através de uma legenda
ggplot(mpg) +
  geom_point(aes ( x = displ, y = hwy, color = class)) 

ggplot(mpg) +
  geom_point(aes ( x = displ, y = hwy, alpha = class)) #classes

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy), color = 'blue') #cores

#Gráficos em facetas para uma melhor visualização
ggplot(mpg) +
  geom_point(aes ( x = displ , y = hwy)) +
  facet_wrap(~ class, nrow = 2)

#Facetas com a combinação de 2 variáveis
ggplot (mpg ) +
  geom_point(aes(x = displ, y = hwy )) +
  facet_grid (drv ~ cyl)

ggplot (mpg ) +
  geom_point(aes(x = displ, y = hwy )) +
  facet_grid (.~ cyl)

# Visualização dos dados com o GEOM (objeto geométrico)
# Aqui usaremos o GEOM SMOOTH  que é uma linha suave ajustada aos dados 
ggplot (mpg) +
  geom_smooth(aes(x = displ, y = hwy))

# Usando outro tipo de linha (linetype) para visualizar o valor singular de cada variável
# 4 significa (tração nas quatro rodas)
# F significa (tração dianteira)
# R significa (tração traseira)
ggplot(mpg) +
  geom_smooth(aes(x = displ, y = hwy, linetype = drv))

#Lembrando que o (ggplot2) fornece mais de 30 geoms

# Exibindo vários GEOMS no mesmo gráfico
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))

# MApeamentos sobrescritos para exibir estéticas diferentes e camadas diferentes
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()



