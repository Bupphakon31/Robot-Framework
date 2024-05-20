*** Variables ***

&{dict_product_page}
    ...     title_label=//span[@class='title'][text()='Products']
    ...     shopping_cart=//a[@class='shopping_cart_link']
    ...     shopping_cart_badge=//span[@class='shopping_cart_badge']

    ...     product_dropdown=//select[@class='product_sort_container']
    ...     product_list=//div[@class='inventory_list' and .//div[@class='inventory_item' and .//div[@class='inventory_item_description']]]




# &{product_Sauce_Labs_Onesie}                title=Sauce Labs Onesie             price=7.99     
# &{product_Sauce_Labs_Fleece_Jacket}         title=Sauce Labs Fleece Jacket      price=49.99 


*** Keywords ***


Verify Product Page
#step 2.3.1 : Verify that product is show
    Wait Until Element Is Visible             ${dict_product_page}[title_label]                   #//span[@class='title'][text()='Products']
#step 2.3.2 : Verify that Empty cart
    Wait Until Element Is Visible             ${dict_product_page}[shopping_cart]                     #//a[@class='shopping_cart_link']

    ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    ${dict_product_page}[shopping_cart_badge]       #//span[@class='shopping_cart_badge']
    IF    ${ver_count_of_cart} == ${True}
        ${ver_cart}     Get Text             ${dict_product_page}[shopping_cart_badge]     #//span[@class='shopping_cart_badge']
    ELSE
        ${ver_cart}     Set Variable    0
    END

#step 3 :Filter product
Filter product

# #step 3.1 : Click dropdown filter
     Click Element                          ${dict_product_page}[product_dropdown]

#step 3.2 : Select Name (Z to A) filter
    Select From List By Value               ${dict_product_page}[product_dropdown]      za           # //select[@class='product_sort_container']   za
#step 3.2.1 : Verify that list name product is show on page
    Wait Until Element Is Visible           ${dict_product_page}[product_list]       #//div[@class='inventory_list' and .//div[@class='inventory_item' and .//div[@class='inventory_item_description']]]

#step 4 :Add product to cart
Add product to cart
#step 4.1 : Add Sauce Labs Onesie  1 ea
#step 4.1.1 : Verify Sauce Labs Onesie Title
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Onesie}[title]']]

#step 4.1.2 : Verify Sauce Labs Onesie Price
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Onesie}[title]'] and .//*[@class='inventory_item_price'][text()='${product_Sauce_Labs_Onesie}[price]']]

#step 4.1.3 : Verify Sauce Labs Onesie Price Add to cart
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Onesie}[title]']]//button[text()='Add to cart']

#step 4.2 Get item in cart
# conditon  if item >0 get text   //span[@class='shopping_cart_badge']
# conditon  if item ==0  Set  0

    ${has_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element        ${dict_product_page}[shopping_cart_badge]   #//span[@class='shopping_cart_badge']
    IF    ${has_count_of_cart} == ${True}
        ${count_of_cart}    Get Text        ${dict_product_page}[shopping_cart_badge]     #//span[@class='shopping_cart_badge']
    ELSE
        ${count_of_cart}     Set Variable    0
    END
  

    #step 4.3 Click Add to cart
    Click Element                   //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Onesie}[title]']]//button[text()='Add to cart']
  

    #step 4.4 Verify that cart plus one item
    # Should Be True    ${count_of_cart} + 1 == 1
    # 1 = Page Should Contain Element    //span[@class='shopping_cart_badge']

    # Wait Until Element Is Visible               //span[@class='shopping_cart_badge']
    ${last_count_of_cart}    Get Text           ${dict_product_page}[shopping_cart_badge]    #//span[@class='shopping_cart_badge']

    Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}

    # Capture Page Screenshot    TC_01_{index}.png

    #step 4.5 Add Sauce Labs Fleece Jacket  1  ea
    #step 4.5.1 Verify Sauce Labs Fleece Jacket Title
    Wait Until Element Is Visible               //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]

    #step 4.5.2 Verify Sauce Labs Fleece Jacket Price
    Wait Until Element Is Visible               //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//*[@class='inventory_item_price'][text()='${product_Sauce_Labs_Fleece_Jacket}[price]']]
  
    #step 4.5.3 Verify Sauce Labs Fleece Jacket Add to cart
    Wait Until Element Is Visible               //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]//button[text()='Add to cart']

    #step 4.6 Get item in cart
    ${has_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element            ${dict_product_page}[shopping_cart_badge]     #//span[@class='shopping_cart_badge']
    IF    ${has_count_of_cart} == ${True}
        ${count_of_cart}    Get Text            ${dict_product_page}[shopping_cart_badge]       #//span[@class='shopping_cart_badge']
    ELSE
        ${count_of_cart}     Set Variable    0
    END
  
  
    #step 4.7 Click Add to cart
    # Click Element    //div[@class='inventory_item' and .//div[text()='Sauce Labs Bolt T-Shirt'] and .//*[@class='inventory_item_price'][text()='15.99']]//button[text()='Add to cart']
    Click Element                           //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]//button[text()='Add to cart']
  

    #step 4.8 Verify that cart plus one item
    # Wait Until Element Is Visible           //span[@class='shopping_cart_badge']
    ${last_count_of_cart}    Get Text       ${dict_product_page}[shopping_cart_badge]     # //span[@class='shopping_cart_badge']

    Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}
    # Capture Page Screenshot    TC_01_{index}.png

