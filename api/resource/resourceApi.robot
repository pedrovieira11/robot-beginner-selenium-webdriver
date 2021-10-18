*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variable ***
${URL_API}      http://gateway.marvel.com/
${TS}           1
${API_KEY}      777940b06b615d39333d877764f6218f
${HASH}         97782cffd464d49f1eccdd7912fb3786

*** Keywords ***
Conectar a API
    Create Session  marvelApi   ${URL_API}

Buscar todos os personagens         
    ${params}=          Create Dictionary   ts=${TS}    apikey=${API_KEY}   hash=${HASH}
    ${resp}=            GET On Session      marvelApi       /v1/public/characters       ${params}
    ${json_response}=   Set Variable    ${resp.json()}
    ${data_validate}=   get value from json     ${json_response}        code
    Log To Console      ${data_validate}