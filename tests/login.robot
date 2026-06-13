*** Settings ***
Resource    ../resources/browser/browser.resource
Resource    ../resources/config/users.resource
Resource    ../resources/keywords/login_keywords.resource
Resource    ../resources/pages/inventory_page.resource


Test Setup       browser.Open Application
Test Teardown    browser.Close Application

*** Test Cases ***
Successful login
    login_page.Login As User    &{STANDARD_USER}
    inventory_page.Inventory Page Should Be Displayed

#Indien 10 testcases nodig zijn, kan ik deze users toevoegen.
Unsuccessful login users should show correct error
    [Template]    Login Should Show Correct Error For User
    
    &{INVALID_USER}
    &{LOCKED_OUT_USER}

  
