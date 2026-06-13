*** Settings ***
Library     Collections
Resource    base_page.resource
Resource    ../config/products.resource
Resource    ../config/users.resource


*** Variables ***
#locators
${ELEMENT_STEP_TWO_PAGE_TITLE}                 [data-test="title"]

#constanten
${CHECKOUT_OVERVIEW_PAGE_TITLE_VALUE}          Checkout: Overview

*** Keywords ***
#Geschikt voor base page, aangezien het een algemene keyword is dat controleert of de juiste pagina wordt weergegeven op basis van de titel. Het kan worden hergebruikt in andere pagina's door de verwachte titel aan te passen.
Overview Page Should Be Displayed
    ${title}=    Get Text    ${ELEMENT_STEP_TWO_PAGE_TITLE}

    Should Be Equal
    ...    ${title}
    ...    ${CHECKOUT_OVERVIEW_PAGE_TITLE_VALUE}