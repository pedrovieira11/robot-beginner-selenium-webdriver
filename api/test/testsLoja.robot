*** Settings ***
Documentation   Documentacao da API: http://165.227.93.41/lojinha-arquivos/Swagger.pdf
Resource        ../resource/resourceLojaApi.robot
Suite Setup     Conectar a minha API


*** Test Case ***
Cadastrar novo Produto (POST)
    [tags]      POST
    Fazer Login na API
    Cadastrar novo Produto
    Conferir mensagem POST "Produto adicionado com sucesso"
    Conferir se retorna todos os dados cadastrados para o novo produto
    Conferir status code POST  201

Conferir lista de Produtos (GET)
    [tags]      GET
    Fazer Login na API
    Buscar lista de Produtos 
    Conferir status code  200
    Conferir mensagem GET "Listagem de produtos realizada com sucesso"