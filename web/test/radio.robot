*** Settings *** 
Resource        ./resource/resource.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Selecting by Id
    Go To                   ${url}/radios
    #                               group   id
    Select Radio Button             movies  cap
    Radio Button Should Be Set To   movies  cap

Selecting by Value
    Go To                   ${url}/radios
    #                               group   value
    Select Radio Button             movies  guardians
    Radio Button Should Be Set To   movies  guardians
    