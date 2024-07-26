*** Settings ***

Library        SeleniumLibrary      timeout=10s
Library        BuiltIn
Library        OperatingSystem
Library        Screenshot
Library        String
Library        Collections

# common
Resource         ${CURDIR}/../configs/common.resource

# prefs.yaml
Variables      ${CURDIR}/../test_data/prefs.yaml


# Pages
Resource         ${CURDIR}/../Pages/index/home_page.resource
Resource         ${CURDIR}/../Pages/product/product_page.resource
Resource         ${CURDIR}/../Pages/shopping_cart/shopping_cart_page.resource



# Keywords
Resource         ${CURDIR}/../Keywords/index/home_page_keyword.resource
Resource         ${CURDIR}/../Keywords/product/product_page_keyword.resource
Resource         ${CURDIR}/../Keywords/shopping_cart/shopping_cart_page_keyword.resource






*** Variables ***
${count_of_bag}    0
${SERVER}               https://www.central.co.th/
${BROWSER}              gc                  

${count_of_bag}    0