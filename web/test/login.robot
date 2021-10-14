*** Settings *** 
Resource        ../resource/resourceWeb.robot

Test Setup      Start browser
Test Teardown   Finish browser

*** Test Cases ***
Login success
    Go To                   ${url}/login
    Login With              stark  jarvis!
    Should See Logged User  Tony Stark

Invalid password
    [tags]                          login_error
    Go To                           ${url}/login
    Login With                      stark              senhainvalida
    Should Contain Login Alert      Senha é invalida                   

User not found
    [tags]              login_error
    Go To               ${url}/login
    Login With          usuarioinvalido     jarvis!
    Should Contain Login Alert      O usuário informado não está cadastrado         


*** Keywords ***
Login With 
    [Arguments]     ${uname}   ${pass}

    Input Text      css:input[name=username]        ${uname}
    Input Text      css:input[name=password]        ${pass}
    Click Element   class:btn-login

Should Contain Login Alert
    [Arguments]     ${expect_message} 
    
    ${message}=             Get WebElement      id:flash
    Should Contain          ${message.text}     ${expect_message}

Should See Logged User
    [Arguments]     ${full_name}

    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!