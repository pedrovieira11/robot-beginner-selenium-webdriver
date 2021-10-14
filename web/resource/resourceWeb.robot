*** Settings *** 
Library     SeleniumLibrary

*** Variables ***  
${url}      https://training-wheels-protocol.herokuapp.com/
${browser}  chrome

*** Keywords ***
Start browser
    Open Browser    ${url}      ${browser}

Finish browser
    Capture Page Screenshot
    Close Browser