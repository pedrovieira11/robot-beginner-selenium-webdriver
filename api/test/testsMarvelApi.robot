*** Settings ***
Resource        ../resource/resourceApi.robot
Suite Setup     Conectar a API

*** Test Case ***
Buscar todos os personagens
    Buscar todos os personagens

Buscar informações pelo id do personagem
    Buscar informações pelo id do personagem