*** Settings ***

Library           SeleniumLibrary

*** Keywords ***

Verify Product Page
#step 2.3.1 : Verify that product is show
    Wait Until Element Is Visible             //span[@class='title'][text()='Products']
#step 2.3.2 : Verify that Empty cart
    Wait Until Element Is Visible             //a[@class='shopping_cart_link']

    ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //span[@class='shopping_cart_badge']
    IF    ${ver_count_of_cart} == ${True}
        ${ver_cart}     Get Text             //span[@class='shopping_cart_badge']
    ELSE
        ${ver_cart}     Set Variable    0
    END

#step 3 :Filter product
Filter product

# #step 3.1 : Click dropdown filter
#     Click Element                           //select[@class='product_sort_container']

#step 3.2 : Select Name (Z to A) filter
    Select From List By Value               //select[@class='product_sort_container']   za
#step 3.2.1 : Verify that list name product is show on page
    Wait Until Element Is Visible           //div[@class='inventory_list' and .//div[@class='inventory_item' and .//div[@class='inventory_item_description']]]