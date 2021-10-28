
*** Settings ***

Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     Process
Library     OperatingSystem

*** Variable ***
${URL_API}              http://165.227.93.41/lojinha
${PRODUTO_ESPERADO}     {'data': {'produtoid': 39706, 'produtonome': 'Coca-Cola', 'produtovalor': 5, 'produtocores': ['Vermelho'], 'componentes': 
...                     [{'componenteid': 44932, 'componentenome': 'Refrigerante', 'componentequantidade': 10}]},
...                      'message': 'Produto adicionado com sucesso', 'error': ''}
${DADOS_LOGIN}          {"usuariologin": "teste.pedro","usuariosenha" :"Teste@123"}
${NOVO_PRODUTO}         {"produtonome": "Coca-Cola", "produtovalor": 5.00,
...                      "produtocores": [ "Vermelho" ], "componentes":[{
...                     "componentenome": "Refrigerante",
...                      "componentequantidade": 10}]}

** Keywords ***
Conectar a minha API
    Create Session    APILojinha   ${URL_API}

#Chamadas de API
Fazer Login na API
    ${HEADERS}=         Create Dictionary     content-type=application/json
    ${RESPOSTA}=        Post On Session         APILojinha      /login         
    ...                 data=${DADOS_LOGIN}   
...                     headers=${HEADERS}

    ${TOKEN}            Get From Dictionary     ${RESPOSTA.json()["data"]}      token
    Set Suite Variable  ${TOKEN}    ${TOKEN}

Cadastrar novo Produto
    ${HEADERS}=             Create Dictionary   content-type=application/json       token=${TOKEN}
    ${RESPOSTA_POST}=       Post On Session         APILojinha          /produto
    ...                     data=${NOVO_PRODUTO}
...                         headers=${HEADERS}

    Set Test Variable           ${RESPOSTA_POST}

Buscar lista de Produtos
    ${HEADERS}        Create Dictionary    token=${TOKEN}
    ${RESPOSTA_GET}   Get On Session      APILojinha    /produto
...                                headers=${HEADERS}
  
    Set Test Variable    ${RESPOSTA_GET}

Conferir status code
    [Arguments]                         ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings          ${RESPOSTA_GET.status_code}   ${STATUSCODE_DESEJADO}
    Log                                 ${RESPOSTA_GET.status_code}


#Validações
Conferir mensagem GET "${MENSAGEM}"
    Should Be Equal As Strings          ${RESPOSTA_GET.json()["message"]}     ${MENSAGEM}
    Log                                 ${RESPOSTA_GET.json()["message"]}

Conferir mensagem POST "${MENSAGEM}"
    Should Be Equal As Strings         ${RESPOSTA_POST.json()["message"]}     ${MENSAGEM}
    Log                                ${RESPOSTA_POST.json()["message"]}

Conferir se retorna todos os dados cadastrados para o novo produto
    Should Not Be Empty      ${RESPOSTA_POST.json()}
        
Conferir status code POST
    [Arguments]                        ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings         ${RESPOSTA_POST.status_code}   ${STATUSCODE_DESEJADO}