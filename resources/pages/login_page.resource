*** Settings ***
Resource    base_page.resource

*** Variables ***
# Locators
${ELEMENT_USERNAME_INPUT}                    [data-test="username"]
${ELEMENT_PASSWORD_INPUT}                    [data-test="password"]
${ELEMENT_LOGIN_BUTTON}                      [data-test="login-button"]
${ELEMENT_LOGIN_ERROR_MESSAGE}               [data-test="error"]
      
*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Fill Text    ${ELEMENT_USERNAME_INPUT}    ${username}


Enter Password
    [Arguments]    ${password}
    Fill Text    ${ELEMENT_PASSWORD_INPUT}    ${password}


Click Login
    Click    ${ELEMENT_LOGIN_BUTTON}


Login As User
    [Arguments]    &{user}
    Enter Username    ${user.username}
    Enter Password    ${user.password}
    Click Login


Login Error Message For User Should Be Displayed
    [Arguments]    &{user}

    ${actual_message}=    
    ...    Get Text    ${ELEMENT_LOGIN_ERROR_MESSAGE}

    Should Be Equal    
    ...    ${actual_message}    
    ...    ${user.expected_error_text}

