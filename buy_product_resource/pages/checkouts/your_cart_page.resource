*** Variables ***
&{dict_your_cart_page}
...     title_label=//span[@class='title'][text()='Your Cart']
...     cart_icon=//div[@id='shopping_cart_container']
...     checkout_button=//button[@id='checkout'][text()='Checkout']

...     title_product=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}']]
...     title_price=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}'] and .//div[@class='inventory_item_price'][text()='{price}']]
...     title_qty=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}'] and .//div[@class='cart_quantity'][text()='{qty}']]
...     remove_btn=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}']]//button[text()='Remove']

*** Keywords ***

#step 5 :Checkouts
Click Cart Icon

# #step 5.1 : Click cart icon
    Click Element                               ${dict_your_cart_page}[cart_icon]   

Verify Your Cart Page And Product Same Product List 
    [Arguments]     ${title}    ${price}    ${qty}

#step 5.2 : Verify that "Your Cart" is show
    Wait Until Element Is Visible           ${dict_your_cart_page}[title_label] 

#step 5.3 : Verify is product same product list
    #step 5.3.1 : Verify Sauce Labs Onesie Title
    ${xpath_title_product}       Format String	         ${dict_your_cart_page}[title_product]        title=${title}
    Wait Until Element Is Visible           ${xpath_title_product} 

    #step 5.3.2 : Verify Sauce Labs Onesie Price
    ${xpath_title_price}       Format String	         ${dict_your_cart_page}[title_price]          title=${title}      price=${price}
    Wait Until Element Is Visible           ${xpath_title_price}

    #step 5.3.3 : Verify that product QTY = 1
    ${xpath_title_qty}       Format String	         ${dict_your_cart_page}[title_qty]                title=${title}      qty=${qty}
    Wait Until Element Is Visible           ${xpath_title_qty}

    #step 5.3.4 : Verify that Remove button is show
    ${xpath_remove_btn}       Format String	         ${dict_your_cart_page}[remove_btn]               title=${title}        
    Wait Until Element Is Visible           ${xpath_remove_btn}

Click Checkout Button
# #step 5.5 : Click Checkout button
    Click Element                           ${dict_your_cart_page}[checkout_button] 