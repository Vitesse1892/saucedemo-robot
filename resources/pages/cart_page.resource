*** Settings ***
Library     Collections
Resource    base_page.resource
Resource    ../config/products.resource


*** Variables ***
${ELEMENT_CART_ITEMS}            [data-test="inventory-item"]
${ELEMENT_CHECKOUT_BUTTON}       [data-test="checkout"]


*** Keywords ***
Cart Should Match Selected Products and corresponding Prices
    [Arguments]    @{products}

    ${actual_count}=      Get Element Count    ${ELEMENT_CART_ITEMS}
    ${expected_count}=    Get Length    ${products}

    Should Be Equal As Integers
    ...    ${actual_count}
    ...    ${expected_count}

    FOR    ${product_name}    IN    @{products}
        Product should contain Correct Price
        ...    ${product_name}
    END

#Ik kies voor dictionary als basis. Hier zou ik ook scenarioContext kunnen gebruiken
Product should contain Correct Price
    [Arguments]    ${product_name}

    ${expected_price}=    Get From Dictionary
    ...    ${PRODUCT_CATALOG}
    ...    ${product_name}

    ${locator}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item"][.//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]]//div[@data-test="inventory-item-price"]

    ${actual_price}=    Get Text    ${locator}

    Should Be Equal
    ...    ${actual_price}
    ...    ${expected_price}

Click Checkout Button
    Click    ${ELEMENT_CHECKOUT_BUTTON}