*** Variables ***

&{dict_overview_page} 
...     title_Overview=//span[@class='title'][text()='Checkout: Overview'] 
...     Description_label=//div[@class='cart_desc_label'][text()='Description']
...     shopping_cart_badge=//span[@class='shopping_cart_badge']
...     cart_item=//div[@class='cart_item'] 

...     title_product=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}']]
...     title_price=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}'] and .//div[@class='inventory_item_price'][text()='{price}']] 
...     title_qty=//div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='{title}'] and .//div[@class='cart_quantity'][text()='{qty}']] 

...     Payment_Information_label=//div[@data-test='payment-info-label'][text()='Payment Information:']
...     Payment_Information_value=//div[@data-test='payment-info-value'][text()='SauceCard #31337'] 
...     shipping_label=//div[@data-test='shipping-info-label'][text()='Shipping Information:']
...     summary_value=//div[@class='summary_value_label'][text()='Free Pony Express Delivery!'] 

...     total_info_label=//div[@data-test='total-info-label'][text()='Price Total']
...     check_price_total=//div[@data-test='subtotal-label'][text()='Item total: $' and text()='{Price_item_total}'] 
...     check_tax_item_total=//div[@data-test='tax-label'][text()='Tax: $' and text()='{tax_item_total}'] 
...     summary_total_label=//div[@class='summary_total_label'] 
...     check_sum_of_item_total_plus_tax=//div[@data-test='total-label'][text()='Total: $' and text()='{sum_of_item_total_plus_tax}'] 

...     finish_btn=//button[@id='finish'][text()='Finish']


*** Keywords ***

Verify Checkouts Label And Cart
    
#step 7 :Verify that checkouts page
#step 7.1 : Verify that “Checkout: Overview” is show
    Wait Until Element Is Visible            ${dict_overview_page}[title_Overview]  

#step 7.2 : Verify that Description is show
    Wait Until Element Is Visible            ${dict_overview_page}[Description_label]  

#step 7.3 : Verify that Summary same checkout page
    #step 7.3.1 : Verify item cart in checkout page

    ${is_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    ${dict_overview_page}[shopping_cart_badge] 
    IF    ${is_count_of_cart} == ${True}
        ${last_cart}    Get Text    ${dict_overview_page}[shopping_cart_badge] 
    ELSE
        ${last_cart}     Set Variable    0
    END

    ${cart_count}                        Get Element Count                ${dict_overview_page}[cart_item]                               
    
    Should Be True                       ${cart_count} == ${last_cart} 

Verify Product Same Product List
    [Arguments]     ${title}    ${price}    ${qty}    

    #step 7.3.2 : Verify Sauce Labs Onesie Title   Sauce_Labs_Onesie_title

    ${xpath_title_product}       Format String	         ${dict_overview_page}[title_product]       title=${title}
    
    Wait Until Element Is Visible           ${xpath_title_product}         

    #step 7.3.3 : Verify Sauce Labs Onesie Price

    ${xpath_title_price}       Format String	         ${dict_overview_page}[title_price]         title=${title}       price=${price}
    
    Wait Until Element Is Visible           ${xpath_title_price}

    #step 7.3.4 : Verify that product QTY = 1

    ${xpath_title_qty}       Format String	         ${dict_overview_page}[title_qty]               title=${title}       qty=${qty}
    
    Wait Until Element Is Visible           ${xpath_title_qty}

Verify All Payment Label
    [Arguments]     ${expected_data}
#step 7.4 : Verify that Payment Information label is show
    Wait Until Element Is Visible              ${dict_overview_page}[Payment_Information_label]  

#step 7.4.1 : Verify Payment value
    Wait Until Element Is Visible              ${dict_overview_page}[Payment_Information_value]   

#step 7.5 : Verify that Shipping Information label is show
    Page Should Contain Element                ${dict_overview_page}[shipping_label]  

#step 7.5.1 : Verify Shipping value
    Wait Until Element Is Visible              ${dict_overview_page}[summary_value]                   


#step 7.6 Verify that "Price Total" is show
    Wait Until Element Is Visible               ${dict_overview_page}[total_info_label]  

    ${Price_item_total}     Set Variable    0

    FOR    ${key}    ${value}    IN    &{expected_data}
    Log    Key is '${key}' and value is '${value}'.
    Log    ${value.title}
    Log    ${value.price}
    Log    ${value.qty}
    
#step 7.6.1 Verify that Item total = ___    

    ${Price_item_total}        Evaluate           ${Price_item_total} + ${value}[price]
    
    Log     ${Price_item_total}
    
    END

    ${xpath_Price_item_total}       Format String	         ${dict_overview_page}[check_price_total]        Price_item_total=${Price_item_total}
    
    Wait Until Element Is Visible           ${xpath_Price_item_total}  

    ${Price_item_total}        evaluate           "%.2f" % ${Price_item_total}
   
#step 7.7 Verify that tax = ___

    ${tax}    Evaluate    (${Price_item_total} * 8)/100

    ${tax_item_total}    evaluate       "%.2f" % ${tax}
    ${xpath_tax_item_total}       Format String	         ${dict_overview_page}[check_tax_item_total]        tax_item_total=${tax_item_total}

    Wait Until Element Is Visible          ${xpath_tax_item_total}  

#step 7.8 Verify that Total = ___
    ${sum_of_item_total_plus_tax}    Evaluate       ${Price_item_total} + ${tax_item_total}
      
    ${Total}            Get Text                      ${dict_overview_page}[summary_total_label]             
    ${Total}            Remove String                           ${Total}        Total    :      $       
    ${Total}            evaluate                       "%.2f" % ${Total}                                

    Should Be True      ${sum_of_item_total_plus_tax} == ${Total} 
    
    ${xpath_sum_of_item_total_plus_tax}       Format String	         ${dict_overview_page}[check_sum_of_item_total_plus_tax]        sum_of_item_total_plus_tax=${sum_of_item_total_plus_tax}

    Page Should Contain Element            ${xpath_sum_of_item_total_plus_tax}   

Click Finish Button
# #step 7.9: Click Finish
     Click Element                         ${dict_overview_page}[finish_btn] 