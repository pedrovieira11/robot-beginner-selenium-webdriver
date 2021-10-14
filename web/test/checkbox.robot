*** Settings *** 
Resource        ../resource/resourceWeb.robot

Test Setup      Start browser
Test Teardown   Finish browser

*** Variables ***  
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    xpath://*[@id='checkboxes']/input[7]    

*** Test Cases ***
Check option by Id
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}

Check option by CSS Selector
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_iron}
    Checkbox Should Be Selected     ${check_iron}

Check option by Xpath
    [tags]      ironman
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_panther}
    Checkbox Should Be Selected     ${check_panther}