*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     Process
Library     OperatingSystem

*** Variable ***
${url_api}      http://gateway.marvel.com/
${ts}           1
${api_key}      777940b06b615d39333d877764f6218f
${hash}         97782cffd464d49f1eccdd7912fb3786

*** Test Cases ***
Conectar a API
    Create Session  marvelApi   ${url_api}

Buscar todos os personagens         
    ${params}=          Create Dictionary       ts=${ts}    apikey=${api_key}   hash=${hash}
    ${resp}=            Get On Session          marvelApi       /v1/public/characters       ${params}
    ${response_json}=   Set variable            ${resp.json()}
    #Valida status_code = 200
    Should Be Equal As Strings      ${resp.status_code}     200
    #Valida campo results
    Should Not Be Empty             ${response_json}       data.results

Buscar informacoes pelo id do personagem
    ${params}=          Create Dictionary       ts=${ts}    apikey=${api_key}   hash=${hash}
    ${resp}=            Get On Session          marvelApi       /v1/public/characters/1011334       ${params}
    ${json_response}=   Set Variable            ${resp.json()}
    ${results}=         get value from json     ${json_response}    data.result        
    Should Be Equal As Strings                  ${resp.status_code}     200
    Length Should Be  item  length  msg=None