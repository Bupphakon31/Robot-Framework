*** Settings ***

# Library         SeleniumLibrary

Resource         ${CURDIR}/../config/import.resource
# Resource          ../resource/setting.robot

# pages
Resource         ${CURDIR}/../pages/index/login_page.resource
Resource         ${CURDIR}/../pages/home/product_page.resource
Resource         ${CURDIR}/../pages/checkouts/your_cart_page.resource
Resource         ${CURDIR}/../pages/checkouts/information_page.resource
Resource         ${CURDIR}/../pages/checkouts/overview_page.resource
Resource         ${CURDIR}/../pages/checkouts/complete_page.resource



# keywords
Resource         ${CURDIR}/../Keywords/index/login_keyword.resource
Resource         ${CURDIR}/../Keywords/home/product_page_keyword.resource
Resource         ${CURDIR}/../Keywords/checkouts/your_cart_keyword.resource
Resource         ${CURDIR}/../Keywords/checkouts/information_keyword.resource
Resource         ${CURDIR}/../Keywords/checkouts/overview_keyword.resource
Resource         ${CURDIR}/../Keywords/checkouts/complete_keyword.resource



# Variables
Variables        ${CURDIR}/../test_data/data.yaml

# Resource          ../resource/LoginPage.robot
# Resource          ../resource/Fillter.robot
# Resource          ../resource/ProductPage.robot
# Resource          ../resource/CartPage.robot
# Resource          ../resource/InformationPage.robot
# Resource          ../resource/VerifyCheckoutPage.robot
# Resource          ../resource/VerifyThankPage.robot

 


*** Test Cases ***
# TC02

#     Log Variables
#     Log     ${TEST_NAME}
#     Log     ${Data.TC02}
#     ${test_data}     Set Variable    ${Data.${TEST_NAME}}
#     Log     ${test_data}

TC01
    #TC01 : Buy 2 Product Success


    Log Variables
    Log     ${TEST_NAME}
    Log     ${Data.TC01}
    ${test_data}     Set Variable    ${Data.${TEST_NAME}}
    Log     ${test_data}
    Set Test Variable       ${Test_Data}    ${test_data}



    Log Variables
    Log Environment Variables
    ${Home_Path}     Get Environment Variable        HOMEDRIVE 
    # Log    ${Home_Path}

    # step 1 :Open Browser  https://www.saucedemo.com/
    Open Browser        ${SERVER} 	    ${BROWSER}      
    ...     options=binary_location=r"${Home_Path}\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True)    
    ...     executable_path=${Home_Path}\\chromedriver\\chromedriver.exe
    
    Maximize Browser Window 
    # Screenshot

    login_keyword.Login
    product_page_keyword.Verify that page and Add product to cart  
    # Verify Login Page
    # login

    # Click Element			              ${dict_login_page}[login_button]  #//input[@type='submit']

    # product_page.Verify Product Page

    # #step 3.1 : Click dropdown filter
    # Click Element                           //select[@class='product_sort_container']

    # product_page.Filter product
    # product_page.Add product to cart

    #step 5.1 : Click cart icon
    # Click Element                               //div[@id='shopping_cart_container'] 
    # your_cart_keyword.Checkout Page
    your_cart_keyword.Checkout Page
    # Checkouts

    #step 5.5 : Click Checkout button
    # Click Element                               //button[@id='checkout'][text()='Checkout']

    information_keyword.input information

    #step 6.4 : Click continue button
    # Click Element                           //input[@id='continue']	

    # Verify Checkouts
    overview_keyword.Verify Checkouts page 

    #step 7.9: Click Finish
    # Click Element                           //button[@id='finish'][text()='Finish']

    # Verify thank you page
    complete_keyword.Verify Complete Page