*** Variables ***

&{dict_product_page}
    ...     title_label=//span[@class='title'][text()='Products']
    ...     shopping_cart=//a[@class='shopping_cart_link']
    ...     shopping_cart_badge=//span[@class='shopping_cart_badge']

    ...     product_dropdown=//select[@class='product_sort_container']
    ...     product_list=//div[@class='inventory_list' and .//div[@class='inventory_item' and .//div[@class='inventory_item_description']]]

    ...     title_product=//div[@class='inventory_item' and .//div[text()='{title}']]
    ...     title_price=//div[@class='inventory_item' and .//div[text()='{title}'] and .//*[@class='inventory_item_price'][text()='{price}']]
    ...     add_to_cart_btn=//div[@class='inventory_item' and .//div[text()='{title}']]//button[text()='Add to cart']

*** Keywords ***

Verify Product Page
#step 2.3.1 : Verify that product is show
    Wait Until Element Is Visible             ${dict_product_page}[title_label] 

#step 2.3.2 : Verify that Empty cart
    Wait Until Element Is Visible             ${dict_product_page}[shopping_cart]                    

    ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    ${dict_product_page}[shopping_cart_badge]       
    IF    ${ver_count_of_cart} == ${True}
          ${ver_cart}     Get Text             ${dict_product_page}[shopping_cart_badge]     
    ELSE
          ${ver_cart}     Set Variable    0
    END

#step 3 :Filter product
Filter Product

# #step 3.1 : Click dropdown filter
     Click Element                          ${dict_product_page}[product_dropdown]

#step 3.2 : Select Name (Z to A) filter
    Select From List By Value               ${dict_product_page}[product_dropdown]      za  

#step 3.2.1 : Verify that list name product is show on page
    Wait Until Element Is Visible           ${dict_product_page}[product_list]       

#step 4 :Add product to cart
Add Product To Cart
    [Arguments]     ${title}    ${price}

#step 4.1 : Add Sauce Labs Onesie  1 ea
#step 4.1.1 : Verify Sauce Labs Onesie Title
    ${xpath_title_product}                  Format String	                ${dict_product_page}[title_product]             title=${title}   
    Wait Until Element Is Visible           ${xpath_title_product}

#step 4.1.2 : Verify Sauce Labs Onesie Price
    ${xpath_title_price}                    Format String	                ${dict_product_page}[title_price]               title=${title}        price=${price}   
    Wait Until Element Is Visible           ${xpath_title_price}

#step 4.1.3 : Verify Sauce Labs Onesie Price Add to cart
    ${xpath_add_to_cart_btn}                Format String	                ${dict_product_page}[add_to_cart_btn]           title=${title}         
    Wait Until Element Is Visible           ${xpath_add_to_cart_btn}

#step 4.2 Get item in cart
    ${has_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element        ${dict_product_page}[shopping_cart_badge]   
    IF    ${has_count_of_cart} == ${True}
          ${count_of_cart}                  Get Text        ${dict_product_page}[shopping_cart_badge]     
    ELSE
          ${count_of_cart}                  Set Variable    0
    END
  
    #step 4.3 Click Add to cart
    Click Element                   ${xpath_add_to_cart_btn}    
  
    #step 4.4 Verify that cart plus one item
    ${last_count_of_cart}                   Get Text       ${dict_product_page}[shopping_cart_badge]    

    Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}

    # Capture Page Screenshot    Buy_2_Product_Success_{index}.png

    

