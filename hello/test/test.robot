
*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome     Pedro
    Should Be Equal     ${result}   Olá Pedro, bem vindo a LionX!
