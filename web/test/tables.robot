*** Settings *** 
Resource        ../resource/resourceWeb.robot

Test Setup      Start browser
Test Teardown   Finish browser

*** Test Cases ***
Validate the value by low number
    Go To                           ${url}/tables
    Table Row Should Contain        id:actors   1   $ 10.000.000

Descobre a linha pelo texto chave e valida os demais valores
    Go To               ${url}/tables
    ${target}=          Get WebElement      xpath:.//tr[contains(.,'@chadwickboseman')]
    Should Contain      ${target.text}      $ 700.000
    Should Contain      ${target.text}      Pantera Negra
         