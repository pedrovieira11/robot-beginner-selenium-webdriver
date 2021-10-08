*** Settings *** 
Resource        ./resource/resource.robot

Test Setup      Start browser
Test Teardown   Finish browser

*** Test Cases ***
Should See Page Title
    Title Should Be     Training Wheels Protocol