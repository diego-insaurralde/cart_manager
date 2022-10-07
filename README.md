# SmartCart 

Projeto via Flutter para Android e IOS, que visa capturar o preço e o nome na etiqueta do produto em supermercados utilizando a câmera do celular, com o fim de gerenciar a compra. 

Desenvolvido por Diego Insaurralde. 

## Funcionalidades Atuais

- BottomBar contendo três botões de navegações para página principal, página do carrinho e página de análise de dados, funcionando adequadamente. 
- FloatButtom ainda sem funcionalidade
- Package Google Fonts sendo utilizado. 
- Página Principal e Página de Análise de Dados não contém conteúdo interno, apesar de estarem com navegação ativa. 
- Página do Carrinho contendo um cabeçalho contendo informações de quantidade de produtos e o valor total, além da data. 
    - O corpo contém uma lista detalhada em Card com os Nome, preço unitário, quantidade e valor (Preço unitário multiplicado pela quantidade)
    - O botão remover remove dinâmicamente os produtos da lista, de forma que altere a quantidade total e o valor total. 
    - Gerenciamento de estado por Provider.

## Funcionalidades Futura
- Adicionar funcionalidade para floatbuttom como adicionar produtos manualmente e via câmera
- Salvar em banco de dados a Lista, sendo salvo e organizado por Data. 
- Em análise de dados, listar as listas de compras salvas e gerar gráfico do valor por mês
- Criar tela de login 
- Recurso de machine learning para ler a etiqueta 

This project is a starting point for a Flutter application.

