*** Settings *** 
Resource        ./resource/resource.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Should See Page Title
    Title Should Be     Training Wheels Protocol