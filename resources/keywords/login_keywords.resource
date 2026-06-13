*** Settings ***
Resource    ../../resources/pages/login_page.resource

*** Keywords ***
Login Should Show Correct Error For User
    [Arguments]    &{user}
    login_page.Login As User    &{user}
    login_page.Login Error Message For User Should Be Displayed    &{user}