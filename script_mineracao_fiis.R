#load libs

#install.packages("tidyverse")
#install.packages("rvest")
#install.packages("janitor")
#install.packages("stringr")
#install.packages("writexl")

#Pacotes
library(tidyverse)
library(rvest)
library(janitor)
library(dplyr)
library(stringr)
library(writexl)


####-------------------------####
#### Extraindo base de dados ####
####-------------------------####


#nse top gainers

url <- 'https://www.fundsexplorer.com.br/ranking'

# extract html

url_html <- read_html(url)

#table extraction

url_tables <- url_html %>% html_table(fill = TRUE)
#View(url_tables)
#extract relevant table

fundos_imobiliarios <- url_tables[[1]]
str(fundos_imobiliarios)

#extract relevant columns

#Seleciona colunas de 1 a 7
#fundos_imobiliarios %>%
#  select(1:7) -> fundos_imobiliarios

#organiza a base de dados reformulando alguns caracteres para a aplicação do pipe
fundos_imobiliarios %>%
  clean_names() -> fundos_imobiliarios
#View(fundos_imobiliarios)

a=as.data.frame(fundos_imobiliarios)
str(a)

cx=a

####-------------------####
#### Tratando os dados ####
####-------------------####

####Transformando classe dos dados

base_bruta1=cx|>mutate(preco_atual=str_sub(preco_atual,4,10))|>  
mutate(preco_atual=str_replace(preco_atual,",","."))|>
  mutate(dividendo=str_replace(preco_atual,",","."))|>
  mutate(dividend_yield=str_replace(dividend_yield,"%",""))|>
  mutate(dividend_yield=str_replace(dividend_yield,",","."))|>
  
  mutate(dy_3m_acumulado=str_replace(dy_3m_acumulado,"%",""))|>
  mutate(dy_3m_acumulado=str_replace(dy_3m_acumulado,",","."))|>
  
  mutate(dy_6m_acumulado=str_replace(dy_6m_acumulado,"%",""))|>
  mutate(dy_6m_acumulado=str_replace(dy_6m_acumulado,",","."))|>
  
  
  mutate(dy_12m_acumulado=str_replace(dy_12m_acumulado,"%",""))|>
  mutate(dy_12m_acumulado=str_replace(dy_12m_acumulado,",","."))|>
  
  mutate(dy_3m_media=str_replace(dy_3m_media,"%",""))|>
  mutate(dy_3m_media=str_replace(dy_3m_media,",","."))|>
  
  mutate(dy_6m_media=str_replace(dy_6m_media,"%",""))|>
  mutate(dy_6m_media=str_replace(dy_6m_media,",","."))|>
  
  mutate(dy_12m_media=str_replace(dy_12m_media,"%",""))|>
  mutate(dy_12m_media=str_replace(dy_12m_media,",","."))|>
  
  mutate(dy_ano=str_replace(dy_ano,"%",""))|>
  mutate(dy_ano=str_replace(dy_ano,",","."))|>
  
  mutate(variacao_preco=str_replace(variacao_preco,"%",""))|>
  mutate(variacao_preco=str_replace(variacao_preco,",","."))|>
  
  mutate(rentab_periodo=str_replace(rentab_periodo,"%",""))|>
  mutate(rentab_periodo=str_replace(rentab_periodo,",","."))|>
  
  mutate(rentab_acumulada=str_replace(rentab_acumulada,"%",""))|>
  mutate(rentab_acumulada=str_replace(rentab_acumulada,",","."))

# SEGUNDA ETAPA
  str(base_bruta1)
  
base_bruta=base_bruta1|>
    mutate(vpa=str_sub(vpa,4,10))|>
  mutate(vpa=str_replace(vpa,",","."))|>
  
  mutate(p_vpa=str_replace(p_vpa,",","."))|>
  
  mutate(dy_patrimonial=str_replace(dy_patrimonial,"%",""))|>
  mutate(dy_patrimonial=str_replace(dy_patrimonial,",","."))|>
  
  mutate(variacao_patrimonial=str_replace(variacao_patrimonial,"%",""))|>
  mutate(variacao_patrimonial=str_replace(variacao_patrimonial,",","."))|>
  
  mutate(rentab_patr_no_periodo=str_replace(rentab_patr_no_periodo,"%",""))|>
  mutate(rentab_patr_no_periodo=str_replace(rentab_patr_no_periodo,",","."))|>
  
  mutate(rentab_patr_acumulada=str_replace(rentab_patr_acumulada,"%",""))|>
  mutate(rentab_patr_acumulada=str_replace(rentab_patr_acumulada,",","."))|>
  
  mutate(vacancia_fisica=str_replace(vacancia_fisica,"%",""))|>
  mutate(vacancia_fisica=str_replace(vacancia_fisica,",","."))|>
  
  mutate(vacancia_financeira=str_replace(vacancia_financeira,"%",""))|>
  mutate(vacancia_financeira=str_replace(vacancia_financeira,",","."))

str(base_bruta)

####Transformando em numérico

base_ffis=base_bruta|>mutate(preco_atual=as.numeric(preco_atual))|>
  mutate(liquidez_diaria=as.numeric(liquidez_diaria))|>
  mutate(dividendo=as.numeric(dividendo))|>
  mutate(dividend_yield=as.numeric(dividend_yield))|>
  mutate(dy_3m_acumulado=as.numeric(dy_3m_acumulado))|>
  mutate(dy_6m_acumulado=as.numeric(dy_6m_acumulado))|>
  mutate(dy_12m_acumulado=as.numeric(dy_12m_acumulado))|>
  mutate(dy_3m_media=as.numeric(dy_3m_media))|>
  mutate(dy_6m_media=as.numeric(dy_6m_media))|>
  mutate(dy_12m_media=as.numeric(dy_12m_media))|>
  mutate(dy_ano=as.numeric(dy_ano))|>
  mutate(variacao_preco=as.numeric(variacao_preco))|>
  mutate(rentab_periodo=as.numeric(rentab_periodo))|>
  mutate(rentab_acumulada=as.numeric(rentab_acumulada))|>
  mutate(vpa=as.numeric(vpa))|>
  mutate(dy_patrimonial=as.numeric(dy_patrimonial))|>
  mutate(variacao_patrimonial=as.numeric(variacao_patrimonial))|>
  mutate(rentab_patr_no_periodo=as.numeric(rentab_patr_no_periodo))|>
  mutate(rentab_patr_acumulada=as.numeric(rentab_patr_acumulada))|>
  mutate(vacancia_fisica=as.numeric(vacancia_fisica))|>
  mutate(vacancia_financeira=as.numeric(vacancia_financeira))|>
  mutate(quantidade_ativos=as.numeric(quantidade_ativos))
  
#https://cdr.ibpad.com.br/dados-em-strings-texto.html
base_ffis=base_ffis|>mutate(patrimonio_liq=str_replace_all(patrimonio_liq,"\\.",""))|>
  mutate(patrimonio_liq=str_sub(patrimonio_liq,4,10))|> 
  mutate(patrimonio_liq=as.numeric(patrimonio_liq))|>
  mutate(p_vpa=as.numeric(p_vpa))


  ##### ##### #####   
##### ESTRATÉGIA#####  
  ##### ##### #####  
   
  #PRIORIDADE
#FILTRAR OS FIIS MAIS BARATOS: PONTO DE CORTE, ACIMA DE V_VAP>1
#FILRAR OS FIIS COM MAIORES DIVIDENDOS  
#realizar uma filtragem por categoria  

  table(base_ffis$setor)
  
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Logística")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Híbrido")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Hospital")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Hotel")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Lajes Corporativas")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Outros")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Residencial")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Shoppings")
base_ffis|>filter(p_vpa>=1.00 | dividend_yield>0.5) |>filter(setor=="Títulos e Val. Mob.")

#Filtro global
str(base_ffis)

#Renomenado

df_ffis <- rename(base_ffis,dividend_yield_percent=dividend_yield, 
                  dy_3m_acumulado_percent=dy_3m_acumulado,
                  dy_6m_acumulado_percent=dy_6m_acumulado,
                  dy_12m_acumulado_percent=dy_12m_acumulado,
                  dy_3m_media_percent=dy_3m_media,
                  dy_6m_media_percent=dy_6m_media,
                  dy_12m_media_percent=dy_12m_media,
                  dy_ano_percent=dy_ano,
                  variacao_preco_percent=variacao_preco,
                  rentab_periodo_percent=rentab_periodo,
                  rentab_acumulada_percent=rentab_acumulada,
                  dy_patrimonial_percent=dy_patrimonial,
                  rentab_patr_no_periodo_percent=rentab_patr_no_periodo,
                  rentab_patr_acumulada_percent=rentab_patr_acumulada,
                  vacancia_fisica_percent=vacancia_fisica,
                  vacancia_financeira_percent=vacancia_financeira)


df_ffis=df_ffis|>mutate(diff_med_med_yd=dy_12m_media_percent-dividend_yield_percent)

str(df_ffis)

rank=df_ffis|>filter(p_vpa<=0.90)|>filter(dividend_yield_percent>0.65)|>filter(liquidez_diaria>4000)|>
  filter(diff_med_med_yd<abs(0.3))|>filter(vacancia_fisica_percent<30)
 
View(rank)

rank=as.data.frame(rank)


#write_csv(rank,paste0('data/',Sys.Date(),'rank','.csv'))


#write_xlsx(rank,"rank.xlsx")
#https://www.youtube.com/watch?v=N3NrWMxeeJQ&t=1043s
