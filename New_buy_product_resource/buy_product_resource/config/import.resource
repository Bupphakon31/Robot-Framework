*** Settings ***

Library        SeleniumLibrary
Library        BuiltIn
Library        OperatingSystem
Library        Screenshot
Library        String


# common
Resource         ${CURDIR}/../config/common.resource


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


*** Variables ***

${SERVER}               https://www.saucedemo.com
${BROWSER}              gc 

# ${Decimal_Format}        {:.2f}

*** Keywords ***

Screenshot
     Capture Page Screenshot    Buy_2_Product_Success_{index}.png
     Screenshot.Set Screenshot Directory     ${CURDIR}/../screenshot


