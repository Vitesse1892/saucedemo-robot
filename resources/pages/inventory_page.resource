*** Settings ***
Resource    base_page.resource
Resource    ../config/products.resource

*** Variables ***

# Locators
${ELEMENT_PAGE_TITLE}              [data-test="title"]
${ELEMENT_PRODUCT_ITEMS}           [data-test="inventory-item"]
${ELEMENT_CART_BADGE}              [data-test="shopping-cart-badge"]

#constanten
${PAGE_TITLE_VALUE}                 Products

*** Keywords ***
Inventory Page Should Be Displayed
    ${title}=    Get Text    ${ELEMENT_PAGE_TITLE}

    Should Be Equal
    ...    ${title}
    ...    ${PAGE_TITLE_VALUE}


Product Count Should Match Catalog
    ${actual_count}=      Get Element Count    ${ELEMENT_PRODUCT_ITEMS}
    ${expected_count}=    Get Length    ${PRODUCT_CATALOG}

    Should Be Equal As Integers
    ...    ${actual_count}
    ...    ${expected_count}

Product Names And Corresponding Prices Should Match Catalog
    FOR    ${product_name}    ${expected_price}    IN    &{PRODUCT_CATALOG}

        Product Should Be Visible With Price
        ...    ${product_name}
        ...    ${expected_price}
    END

Product Should Be Visible With Price
    [Arguments]    ${product_name}    ${expected_price}

    ${locator}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item"][.//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]]//div[@data-test="inventory-item-price"]

    ${actual_price}=    Get Text    ${locator}

    Should Be Equal
    ...    ${actual_price}
    ...    ${expected_price}


Add Products To Cart
    [Arguments]    @{products}

    FOR    ${product_name}    IN    @{products}
        Add Product To Cart    ${product_name}
    END

Add Product To Cart
    [Arguments]    ${product_name}

    ${locator}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item"][.//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]]//button[normalize-space(.)="Add to cart"]

    Click    ${locator}

Products should have Remove button visible
    [Arguments]    @{products}

    FOR    ${product_name}    IN    @{products}
        Product Remove Button Should Be Visible    ${product_name}
    END
   
Product Remove Button Should Be Visible
    [Arguments]    ${product_name}

    ${locator}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item"][.//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]]//button[normalize-space(.)="Remove"]

    Wait For Elements State
    ...    ${locator}
    ...    visible

Products Should Not Have Remove Button Visible
    [Arguments]    @{products}

    FOR    ${product_name}    IN    @{products}
        Product Remove Button Should Not Be Visible
        ...    ${product_name}
    END

Product Remove Button Should Not Be Visible
    [Arguments]    ${product_name}

    ${locator}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item"][.//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]]//button[normalize-space(.)="Remove"]

    ${count}=    Get Element Count    ${locator}

    Should Be Equal As Integers
    ...    ${count}
    ...    0

Click Shopping Cart Icon
    Click    ${ELEMENT_CART_BADGE}

# Add Product To Cart


# Remove Product From Cart


# Cart Badge Should Show Quantity


# Go To Cart


# Sort Products By