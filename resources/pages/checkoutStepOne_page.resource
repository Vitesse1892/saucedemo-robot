*** Settings ***
Library     Collections
Resource    base_page.resource
Resource    ../config/products.resource
Resource    ../config/users.resource


*** Variables ***
*** Variables ***
${ELEMENT_FIRST_NAME_INPUT}    [data-test="firstName"]
${ELEMENT_LAST_NAME_INPUT}     [data-test="lastName"]
${ELEMENT_POSTAL_CODE_INPUT}   [data-test="postalCode"]
${ELEMENT_CONTINUE_BUTTON}     [data-test="continue"]


*** Keywords ***
Fill in Checkout Information
    [Arguments]    &{checkout_user}

    Fill Text
    ...    ${ELEMENT_FIRST_NAME_INPUT}
    ...    ${checkout_user.first_name}

    Fill Text
    ...    ${ELEMENT_LAST_NAME_INPUT}
    ...    ${checkout_user.last_name}

    Fill Text
    ...    ${ELEMENT_POSTAL_CODE_INPUT}
    ...    ${checkout_user.postal_code}

Click Continue Button
    Click    ${ELEMENT_CONTINUE_BUTTON}