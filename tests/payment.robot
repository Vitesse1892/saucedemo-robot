*** Settings ***
Resource    ../resources/browser/browser.resource
Resource    ../resources/config/users.resource
Resource    ../resources/config/products.resource
Resource    ../resources/keywords/login_keywords.resource
Resource    ../resources/pages/inventory_page.resource
Resource    ../resources/pages/cart_page.resource
Resource    ../resources/pages/checkoutStepOne_page.resource
Resource    ../resources/pages/checkoutStepTwo_page.resource

Test Setup       browser.Open Application
Test Teardown    browser.Close Application

*** Test Cases ***
  
Add selected products to cart, go to shopping cart and verify the correct product names and corresponding prices are displayed
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Add Products To Cart    @{PRODUCTS_TO_ADD}
    inventory_page.Click Shopping Cart Icon
    cart_page.Cart Should Match Selected Products and corresponding Prices    @{PRODUCTS_TO_ADD}
    
Fill in checkout information and verify that the user can proceed to the next step
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Add Products To Cart    @{PRODUCTS_TO_ADD}
    inventory_page.Click Shopping Cart Icon
    cart_page.Click Checkout Button
    checkoutStepOne_page.Fill in Checkout Information    &{CHECKOUT_USER}
    checkoutStepOne_page.Click Continue Button
    checkoutStepTwo_page.Overview Page Should Be Displayed
    #Hierna kun je finish. Ook die button is generiek en zou dus naar de base page verplaatst kunnen worden.
    #Mijn doel is geweest om een acceptabele basis op te zetten
