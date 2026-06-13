*** Settings ***
Resource    ../resources/browser/browser.resource
Resource    ../resources/config/users.resource
Resource    ../resources/config/products.resource
Resource    ../resources/keywords/login_keywords.resource
Resource    ../resources/pages/inventory_page.resource

Test Setup       browser.Open Application
Test Teardown    browser.Close Application

*** Test Cases ***

Inventory page is displayed after successful login
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Inventory Page Should Be Displayed

Inventory List Should Match Product Catalog
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Product Count Should Match Catalog
    inventory_page.Product Names And Corresponding Prices Should Match Catalog
  
Add selected products to cart and verify remove button visibility
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Products Should Not Have Remove Button Visible   @{PRODUCTS_TO_ADD}    
    inventory_page.Add Products To Cart    @{PRODUCTS_TO_ADD}
    inventory_page.Products should have Remove button visible    @{PRODUCTS_TO_ADD}    

