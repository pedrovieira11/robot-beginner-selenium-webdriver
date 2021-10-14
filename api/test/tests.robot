*** Settings ***
Resource        ../config/resourceApi.robot
Suite Setup     Conectar a API

*** Test Case ***
GET
    Fazer login