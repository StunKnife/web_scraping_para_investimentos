# web_scraping_para_investimentos
[![fiiscraping](https://github.com/StunKnife/web_scraping_para_investimentos/actions/workflows/main.yml/badge.svg)](https://github.com/StunKnife/web_scraping_para_investimentos/actions/workflows/main.yml)

# modelo_de_melhores_ativos
Estudo com python para definicao de melhores ativos para investimentos

Objetivo geral: 
* 1. **comprar fundos com desconto**: pois eles tem o maior potencial de valorização;
* 2. **comprar fundos com maiores dividendo yield**: pois fornecem os maiores proventos.

# Fundos imobiliários (fiis) 

O objetivo principal é construir um rank dos 20 melhores ativos, tomando como base uma série de filtros. 

São eles:

* 1. **liquidez diária**: um índice que nos diz o total de cotas que são negociadas diariamente. É importante que essa liquidez seja alta. Vamos estipular um valor mínimo de 5 mil (seguindo os padrões do site <https://www.fundsexplorer.com.br/ranking>);

* 2. **exclusão de fundos de desenvolvimento**: entendo que esses fundos atribuem um maior risco ao património investido. Isto ocorre por que o imóvel ainda está em construção/desenvolvimento. Então, no futuro ainda precisará ser alocada a algum inquilino. Por exemplo, os condomínios fechados.

* 3. **vacância física**: é um indicador interessante, pois existe a possibilidade do fundo conseguir mais proventos com a alocação desta reserva. Contudo, acho interessante colocar um filtro de no máximo 30% de vacância física;

* 4. **tempo de existência**: não considerar ativos com idade de 2 anos ou menos, por falta de consistência das informações;

* 5. **índice p/vap**: quanto maior esse índice maior é o preço da cota com relação ao preço justo. Acho interessante comprar ativos que são baratos para ganhar com seua valorização. Além disso, quando o ativo é barato ocorre uma maior economia do dinheiro. Podemos considerar um filtro de p/vap<0.95 ou 1.00;

* 6. **dividendo yield**: quando maior o dividendo yield, maior os ganhos. Logo, sempre estamos atras de grandes valores desse índice. Podemos considerar valores de dy>0.65;

* 7. **quantidade de ativos**: esta variável tras uma maior segurança ao fundo. Uma vez que ela não depende exclusivamente do pagamento de um único inquilino. Ou seja, seus investimentos estão bem pulverizados. Logo não existe uma dependência de uma ativo específico. O valor de referência fica em aberto.

# Sites de referência

Como site de referência para obter dados podemos citar:

* 1. <https://www.fundsexplorer.com.br/ranking>: para fii's;
* 2. <https://www.infomoney.com.br/cotacoes/b3/>: para fii's e ações;
* 2. <https://www.fundamentus.com.br/>: ara fii's e ações.









