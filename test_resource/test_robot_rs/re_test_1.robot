*** Settings ***

Library         SeleniumLibrary

Resource          ../resource/setting.robot
Resource          ../resource/LoginPage.robot
Resource          ../resource/Fillter.robot
Resource          ../resource/ProductPage.robot
Resource          ../resource/CartPage.robot
Resource          ../resource/InformationPage.robot
Resource          ../resource/VerifyCheckoutPage.robot
Resource          ../resource/VerifyThankPage.robot

 


*** Test Cases ***
TC--0001 : Buy 2 Product Success

    Open Browser by chrome
    # Screenshot
    Verify Login Page
    login

    Click Element			                //input[@type='submit']

    Verify Product Page

    #step 3.1 : Click dropdown filter
    Click Element                           //select[@class='product_sort_container']

    Filter product
    Add product to cart

    #step 5.1 : Click cart icon
    Click Element                               //div[@id='shopping_cart_container'] 

    Checkouts

    #step 5.5 : Click Checkout button
    Click Element                               //button[@id='checkout'][text()='Checkout']

    Input information and finish

    #step 6.4 : Click continue button
    Click Element                           //input[@id='continue']	

    Verify Checkouts


    #step 7.9: Click Finish
    Click Element                           //button[@id='finish'][text()='Finish']

    Verify thank you page