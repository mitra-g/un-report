library(tidyverse)

gapminder_1997 <- read_csv("/Users/mitra.ghiyasian/Desktop/un-report/data/gapminder_1997.csv")

ggplot(gapminder_1997, aes(gdpPercap, lifeExp)) + xlab("GDP Per Capita") + ylab("Life Expectancy") + 
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) + 
  labs(size = " Population in millions")

ggplot(gapminder_1997)+ aes(x=gdpPercap,y=lifeExp, color= continent, size= pop/1000000) + 
  geom_point()+
  labs(x="GDP per capita", y="life expectancy", title = "do people in wealthy countries live longer?", size = "population") +
  scale_color_brewer(palette = "Set1")

gapminder_data <- read_csv("/Users/mitra.ghiyasian/Desktop/un-report/data/gapminder_data.csv")

ggplot(gapminder_data) + aes(x = year, y = lifeExp, color = continent, group = country) + geom_line()

ggplot(data = gapminder_data) + aes(x = continent, y = lifeExp) + geom_boxplot()

ggplot(data = gapminder_data) + aes(x = continent, y = lifeExp) + geom_jitter(aes(color = continent)) + geom_boxplot(fill = "white")

ggplot(data = gapminder_data) + aes(x = continent, y = lifeExp) + geom_boxplot(color = "black") + geom_jitter(alpha = 0.3) 

ggplot(gapminder_1997) + aes(x = lifeExp) + geom_histogram()
 
ggplot(gapminder_1997) + aes(x = lifeExp) + geom_histogram(bins = 10)

ggplot(gapminder_1997) + aes(x = lifeExp) + geom_histogram(bins = 20) + theme_bw()

ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_wrap(vars(continent))

ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_wrap(vars(continent)) + theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_grid(vars(continent))

ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() + facet_grid(rows = vars(continent))

violin_plot <- ggplot(gapminder_1997) + aes(x = continent, y = lifeExp) + geom_violin(aes(fill = continent)) + theme_classic()
ggsave("figures/awesome_plot.jpg") # it saves the latest plot that was created
ggsave("figures/awesome_plot.jpg", violin_plot, width = 6, height = 4)

#animated graphs
install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(gifski)

staticPlot <- ggplot(data = gapminder_data) + aes(x = log(gdpPercap), y = lifeExp, color = continent, size = pop/1000000) +
  geom_point(alpha = 0.5) +
  theme_classic() +
  labs(x = "GDP per capita", y= "Life Expectancy", color = "Continent", size = "Population in millions") + 
  scale_color_brewer(palette = "Set1")

animatedPlot <- staticPlot + transition_states(year, state_length = 5) + ggtitle("{closest_state}") #play with state length function for the speed of the plot
animatedPlot

#save this animated plot
anim_save("figures/animatedPlot.gif", plot = animatedPlot, renderer = gifski_renderer()) #once it is saved, open it in a browser. The framework can be adjusted as well

