*** Settings ***

Library           SeleniumLibrary


*** Variables ***

&{product_Sauce_Labs_Onesie}                title=Sauce Labs Onesie             price=7.99     
&{product_Sauce_Labs_Fleece_Jacket}         title=Sauce Labs Fleece Jacket      price=49.99 


*** Keywords ***

#step 5 :Checkouts
Checkouts

# #step 5.1 : Click cart icon
#     Click Element                               //div[@id='shopping_cart_container'] 

#step 5.2 : Verify that "Your Cart" is show
    Wait Until Element Is Visible               //span[@class='title'][text()='Your Cart']

#step 5.3 : Verify is product same product list
    #step 5.3.1 : Verify Sauce Labs Onesie Title
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]']]

    #step 5.3.2 : Verify Sauce Labs Onesie Price
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Onesie}[price]']]

    #step 5.3.3 : Verify that product QTY = 1
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='cart_quantity'][text()='1']]

    #step 5.3.4 : Verify that Remove button is show
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]']]//button[text()='Remove']


#step 5.4 : Verify is product same product list
    #step 5.4.1 : Verify Sauce Labs Bolt T-Shirt Title
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]

    #step 5.4.2 : Verify Sauce Labs Bolt T-Shirt Price
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Fleece_Jacket}[price]']]

    #step 5.4.3 : Verify that product QTY = 1
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='cart_quantity'][text()='1']]

    #step 5.4.4 : Verify that Remove button is show
    Wait Until Element Is Visible               //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]//button[text()='Remove']

# #step 5.5 : Click Checkout button
#     Click Element                               //button[@id='checkout'][text()='Checkout']