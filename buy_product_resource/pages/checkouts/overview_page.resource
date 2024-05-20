
*** Variables ***
# &{product_Sauce_Labs_Onesie}                title=Sauce Labs Onesie             price=7.99     
# &{product_Sauce_Labs_Fleece_Jacket}         title=Sauce Labs Fleece Jacket      price=49.99 

&{dict_overview_page} 
...     title_Overview=//span[@class='title'][text()='Checkout: Overview'] 
...     Description_label=//div[@class='cart_desc_label'][text()='Description']
...     shopping_cart_badge=//span[@class='shopping_cart_badge']
...     cart_item=//div[@class='cart_item'] 

...     Payment_Information_label=//div[@data-test='payment-info-label'][text()='Payment Information:']
...     Payment_Information_value=//div[@data-test='payment-info-value'][text()='SauceCard #31337'] 
...     shipping_label=//div[@data-test='shipping-info-label'][text()='Shipping Information:']
...     summary_value=//div[@class='summary_value_label'][text()='Free Pony Express Delivery!'] 
...     total_info_label=//div[@data-test='total-info-label'][text()='Price Total'] 
...     summary_total_label=//div[@class='summary_total_label'] 
...     finish_btn=//button[@id='finish'][text()='Finish']


*** Keywords ***

Verify Checkouts
#step 7 :Verify that checkouts page
#step 7.1 : Verify that “Checkout: Overview” is show
    Wait Until Element Is Visible            ${dict_overview_page}[title_Overview]  #//span[@class='title'][text()='Checkout: Overview']             #ตรวจสอบว่ามี text Checkout: Overview

#step 7.2 : Verify that Description is show
    Wait Until Element Is Visible            ${dict_overview_page}[Description_label]  #//div[@class='cart_desc_label'][text()='Description']

#step 7.3 : Verify that Summary same checkout page

    #step 7.3.1 : Verify item cart in checkout page

    ${is_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    ${dict_overview_page}[shopping_cart_badge]  #//span[@class='shopping_cart_badge']
    IF    ${is_count_of_cart} == ${True}
        ${last_cart}    Get Text    ${dict_overview_page}[shopping_cart_badge]  #//span[@class='shopping_cart_badge']
    ELSE
        ${last_cart}     Set Variable    0
    END

    ${cart_count}                        Get Element Count                ${dict_overview_page}[cart_item]    #//div[@class='cart_item']               #เรียกจำนวสินค้าที่มีในตระกร้า                               
    
    Should Be True                       ${cart_count} == ${last_cart} 


    #step 7.3.2 : Verify Sauce Labs Onesie Title 
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]']]

    #step 7.3.3 : Verify Sauce Labs Onesie Price
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Onesie}[price]']]

    #step 7.3.4 : Verify that product QTY = 1
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='cart_quantity'][text()='1']]

    #step 7.3.5 : Verify Sauce Labs Fleece Jacket Title 
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]

    #step 7.3.6 : Verify Sauce Labs Fleece Jacket Price
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Fleece_Jacket}[price]']]

    #step 7.3.7 : Verify that product QTY = 1
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='cart_quantity'][text()='1']]


#step 7.4 : Verify that Payment Information label is show
    Wait Until Element Is Visible              ${dict_overview_page}[Payment_Information_label]  #//div[@data-test='payment-info-label'][text()='Payment Information:']

#step 7.4.1 : Verify Payment value
    Wait Until Element Is Visible              ${dict_overview_page}[Payment_Information_value]   #//div[@data-test='payment-info-value'][text()='SauceCard #31337']  

#step 7.5 : Verify that Shipping Information label is show
    Page Should Contain Element                ${dict_overview_page}[shipping_label]   #//div[@data-test='shipping-info-label'][text()='Shipping Information:']

#step 7.5.1 : Verify Shipping value
    Wait Until Element Is Visible              ${dict_overview_page}[summary_value]   # //div[@class='summary_value_label'][text()='Free Pony Express Delivery!']                 


#step 7.6 Verify that "Price Total" is show
    Wait Until Element Is Visible               ${dict_overview_page}[total_info_label]  #//div[@data-test='total-info-label'][text()='Price Total'] 

#step 7.6.1 Verify that Item total = ___

    ${Price_item_total}        Evaluate           ${product_Sauce_Labs_Onesie}[price] + ${product_Sauce_Labs_Fleece_Jacket}[price]
    
    Wait Until Element Is Visible           //div[@data-test='subtotal-label'][text()='Item total: $' and text()='${Price_item_total}'] 

    ${Price_item_total}        evaluate           "%.2f" % ${Price_item_total}

#step 7.7 Verify that tax = ___
    
    ${tax}    Evaluate    (${Price_item_total} * 8)/100

    ${tax_item_total}    evaluate       "%.2f" % ${tax}
    # ${tax_item_total}    Format String    {:.2f}    ${tax}

    Wait Until Element Is Visible           //div[@data-test='tax-label'][text()='Tax: $' and text()='${${tax_item_total}}'] 

#step 7.8 Verify that Total = ___
    ${sum_of_item_total_plus_tax}    Evaluate       ${Price_item_total} + ${tax_item_total}
    
    # ${sum_of_item_total}             evaluate       "%.2f" % ${sum_of_item_total_plus_tax}
    # ${sum_of_item_total_with_tax_format}    Format String    {:.2f}    ${sum_of_item_total_with_tax}    

    ${Total}            Get Text                      ${dict_overview_page}[summary_total_label]  #//div[@class='summary_total_label']           
    ${Total}            Remove String                           ${Total}        Total    :      $       #ลบ text Total    :      $
    ${Total}            evaluate                       "%.2f" % ${Total}                                #ทำเป็นทศนิยม 2 ตำแหน่ง

    Should Be True      ${sum_of_item_total_plus_tax} == ${Total} 

    Page Should Contain Element             //div[@data-test='total-label'][text()='Total: $' and text()='${sum_of_item_total_plus_tax}'] 


# #step 7.9: Click Finish
     Click Element                         ${dict_overview_page}[finish_btn]  # //button[@id='finish'][text()='Finish']