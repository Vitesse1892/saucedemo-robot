*** Settings ***
Library    Browser
Resource    ../config/environment.resource
Resource    ../pages/base_page.resource

*** Keywords ***
Open Application
    New Browser    
    ...    ${BROWSER}    
    ...    headless=${HEADLESS}

    Wait Until Keyword Succeeds
    ...    3x
    ...    5s
    ...    New Page
    ...    ${BASE_URL_PROD}

    base_page.Wait Until Page Loaded

Close Application
    Close Browser