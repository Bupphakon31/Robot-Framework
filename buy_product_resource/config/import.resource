*** Settings ***

Library        SeleniumLibrary
Library        BuiltIn
Library        OperatingSystem
Library        Screenshot
Library        String

Resource        ${CURDIR}/../pages/index/login_page.resource


*** Variables ***
# &{Login}                                    username=standard_user              password=secret_sauce


${SERVER}               https://www.saucedemo.com
${BROWSER}              gc 


&{product_Sauce_Labs_Onesie}                title=Sauce Labs Onesie             price=7.99     
&{product_Sauce_Labs_Fleece_Jacket}         title=Sauce Labs Fleece Jacket      price=49.99 


*** Keywords ***

Screenshot
     Set Screenshot Directory    ./screenshot
     Capture Page Screenshot     test_{index}.png