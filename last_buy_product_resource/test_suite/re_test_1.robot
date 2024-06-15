*** Settings ***

Resource         ${CURDIR}/../config/import.resource
 
*** Test Cases ***

Buy_2_Product_Success
    #TC01 : Buy 2 Product Success

    Open Browser by chrome
    login_keyword.Login
    product_page_keyword.Verify that page and Add product to cart
    your_cart_keyword.Checkout Page
    information_keyword.input information
    overview_keyword.Verify Checkouts page and click finish
    complete_keyword.Verify Complete Page
    # Screenshot