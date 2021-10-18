*** Settings *** 
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***  
${url}          https://training-wheels-protocol.herokuapp.com/
${browser}      chrome
${files_route}    C:\qaninja\robot\web\log

*** Keywords ***
Start browser
    Remove File     ${files_route}/selenium-screenshot-*.png
    Open Browser    ${url}      ${browser}

Finish browser
    Capture Page Screenshot
    Close Browser