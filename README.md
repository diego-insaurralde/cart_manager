# CartManager 

Projeto via Flutter para Android e IOS, que visa capturar o preço e o nome na etiqueta do produto em supermercados utilizando a câmera do celular, com o fim de gerenciar a compra. 

Desenvolvido por Diego Insaurralde. 

## Funcionalidades Atuais

- BottomBar contendo três botões de navegações para página principal, página do carrinho e página de análise de dados, funcionando adequadamente.
- Criado página de login, com possibilidade de criação de conta, devidamente funcionando. (bug: mais de um login no mesmo dispositivo recupera os dados do login anterior)
- FloatButtom abrindo formulário para cadastro de produtos. 
- Package Google Fonts sendo utilizado. 
- Página Principal Sem conteúdo
- Página de Análise de Dados contendo a primeira seção carrinhos recuperados do banco de dados firebase referente ao usuário. Segundo seção contendo futuro gráfico.  
    - Carrinhos recuperados estão abrindo em uma bottomsheet, contendo informaçõs dos carrinhos respectivos, carregando todos os produtos pertinente a ele.
    - Bug: botão deletar ainda não funcionando adequadamente. 
- Página do Carrinho contendo um cabeçalho contendo informações de quantidade de produtos e o valor total, além da data. 
    - O corpo contém uma lista detalhada em Card com os Nome, preço unitário, quantidade e valor (Preço unitário multiplicado pela quantidade)
    - O botão remover remove dinâmicamente os produtos da lista, de forma que altere a quantidade total e o valor total, além de remover do banco de dados do próprio carrinho.
    - O carrinho não se desfaz ao fazer logout, sendo recuperado via banco de dados firebase a sessão anterior. 
    - Botão finalizar carrinho, recomeça uma nova sessão. 
    - Gerenciamento de estado por Provider.

## Funcionalidades Futura
- Adicionar funcionalidade para adicionar produtos via câmera
- Correção de bugs
- Em análise de dados, listar as listas de compras salvas e gerar gráfico do valor por mês
- Recurso de machine learning para ler a etiqueta 

This project is a starting point for a Flutter application.

