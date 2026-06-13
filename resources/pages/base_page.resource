*** Settings ***
Library    Browser
Resource    ../config/environment.resource

*** Keywords ***
Wait Until Page Loaded
    Wait For Elements State    
    ...    body    
    ...    visible
    ...    timeout=${TIMEOUT}