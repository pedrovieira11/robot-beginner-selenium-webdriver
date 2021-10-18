*** Settings ***
Resource        ../resource/resourceApi.robot
Suite Setup     Conectar a API

*** Test Case ***
Buscar personagem especifico
    Buscar todos os personagens
    