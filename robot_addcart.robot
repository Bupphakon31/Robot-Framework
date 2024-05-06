*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         String




*** Variables ***
&{Login}        username=standard_user      password=secret_sauce
&{information}      Firstname=Bupphakon     Lastname=Silarat    postode=24160
&{product_Sauce_Labs_Onesie}                title=Sauce Labs Onesie             price=7.99     
&{product_Sauce_Labs_Fleece_Jacket}         title=Sauce Labs Fleece Jacket      price=49.99  


*** Test Cases ***
TC_01

    Log Environment Variables
    ${Home_Path}     Get Environment Variable        HOMEDRIVE 
    # Log    ${Home_Path}

    # step 1 :Open Browser  https://www.saucedemo.com/
    Open Browser        https://www.saucedemo.com/ 	browser=chrome      
    ...     options=binary_location=r"${Home_Path}\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True)    
    ...     executable_path=${Home_Path}\\chromedriver\\chromedriver.exe
    
    Maximize Browser Window
    Verify Login Page
    Login
    Filter product
    Add product to cart
    Checkouts
    Input information and finish
    Verify Checkouts
    Verify thank you page


    # Verify that thank you page


*** Keywords ***



Verify Login Page

#step 1.1 : Verify page title  Swag labs is show
    Wait Until Page Contains Element        //div[@class='login_logo'][text()='Swag Labs']
#step 1.2 : Verify textfield Username is show
    Wait Until Element Is Visible           //input[@id='user-name']
#step 1.3 : Verify textfield Username is show
    Wait Until Element Is Visible           //input[@id='password']
#step 1.4 : Verify login button is show
    Page Should Contain Button              //input[@id='login-button']


#step 2 :Login
Login
#step 2.1 : input your Username
    Input Text		                        //input[@id='user-name']			${Login}[username]                                     #input username

#step 2.1.1 : Verify that input Username has a value
    Textfield Value Should Be               //input[@id='user-name']            ${Login}[username]

# #step 2.2 : input your Password
    Input Text		                        //input[@id='password']				${Login}[password]                                     #input password

#step 2.2.1 : Verify that input Username has a value
    Textfield Value Should Be               //input[@id='password']            ${Login}[password]

#step 2.3 : Click login button
    Click Element			                //input[@type='submit']

#step 2.3.1 : Verify that Empty cart
    Wait Until Element Is Visible             //a[@class='shopping_cart_link']

    ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //span[@class='shopping_cart_badge']
    IF    ${ver_count_of_cart} == ${True}
        ${ver_cart}     Get Text             //span[@class='shopping_cart_badge']
    ELSE
        ${ver_cart}     Set Variable    0
    END

#step 2.3.2 : Verify that product is show
    Wait Until Element Is Visible             //span[@class='title'][text()='Products']

#step 3 :Filter product
Filter product
#step 3.1 : Click dropdown filter
    Click Element                           //select[@class='product_sort_container']
#step 3.2 : Select Name (Z to A) filter
    Select From List By Value               //select[@class='product_sort_container']   za
#step 3.2.1 : Verify that list name product is show on page
    Wait Until Element Is Visible           //div[@class='inventory_list' and .//div[@class='inventory_item' and .//div[@class='inventory_item_description']]]


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

    ${has_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element        //span[@class='shopping_cart_badge']
    IF    ${has_count_of_cart} == ${True}
        ${count_of_cart}    Get Text        //span[@class='shopping_cart_badge']
    ELSE
        ${count_of_cart}     Set Variable    0
    END
  

    #step 4.3 Click Add to cart
    Click Element                   //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Onesie}[title]']]//button[text()='Add to cart']
  

    #step 4.4 Verify that cart plus one item
    # Should Be True    ${count_of_cart} + 1 == 1
    # 1 = Page Should Contain Element    //span[@class='shopping_cart_badge']

    Wait Until Element Is Visible               //span[@class='shopping_cart_badge']
    ${last_count_of_cart}    Get Text           //span[@class='shopping_cart_badge']

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
    ${has_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element            //span[@class='shopping_cart_badge']
    IF    ${has_count_of_cart} == ${True}
        ${count_of_cart}    Get Text            //span[@class='shopping_cart_badge']
    ELSE
        ${count_of_cart}     Set Variable    0
    END

  
    #step 4.7 Click Add to cart
    # Click Element    //div[@class='inventory_item' and .//div[text()='Sauce Labs Bolt T-Shirt'] and .//*[@class='inventory_item_price'][text()='15.99']]//button[text()='Add to cart']
    Click Element                           //div[@class='inventory_item' and .//div[text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]//button[text()='Add to cart']
  

    #step 4.8 Verify that cart plus one item
    Wait Until Element Is Visible           //span[@class='shopping_cart_badge']
    ${last_count_of_cart}    Get Text       //span[@class='shopping_cart_badge']

    Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}
    # Capture Page Screenshot    TC_01_{index}.png



#step 5 :Checkouts
Checkouts

#step 5.1 : Click cart icon
    Click Element                               //div[@id='shopping_cart_container'] 
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

#step 5.5 : Click Checkout button
    Click Element                               //button[@id='checkout'][text()='Checkout']

    #step 5.5.1 : Verify that "Checkout: Your Information" is show
    Wait Until Element Is Visible               //span[@class='title'][text()='Checkout: Your Information']
    #step 5.5.2 Verify that textfield firstname is show
    Wait Until Element Is Visible               //input[@id='first-name']
    #step 5.5.3 Verify that textfield lastname is show
    Wait Until Element Is Visible               //input[@id='last-name']
    #step 5.5.4 Verify that textfield Zip/Postal Code is show
    Wait Until Element Is Visible               //input[@id='postal-code']


#step 6 :Input your informations
Input information and finish

#step 6.1 : input your First Name
    Input Text		                        //input[@id='first-name']			        ${information}[Firstname]                        #input Firstname

#step 6.1.1 : Verify that input First Name has a value
    Textfield Value Should Be               //input[@id='first-name']			        ${information}[Firstname]                       #ตรวจสอบว่ามีค่า input Firstname

#step 6.2 : input your Last Name
	Input Text		                        //input[@id='last-name']					${information}[Lastname]                         #input Lastname

#step 6.2.1 : Verify that input Last Name has a value
    Textfield Value Should Be               //input[@id='last-name']					${information}[Lastname]                         #ตรวจสอบว่ามีค่า input Lastname

#step 6.3 : input your Zip/Postal Code
    Input Text		                        //input[@id='postal-code']			        ${information}[postode]                          #input postode

#step 6.3.1 : Verify that input Zip/Postal Code has a value
    Textfield Value Should Be               //input[@id='postal-code']			        ${information}[postode]                          #ตรวจสอบว่ามีค่า input postode

#step 6.4 : Click continue button
    Click Element                           //input[@id='continue']			                                                   #click continue


Verify Checkouts
#step 7 :Verify that checkouts page
#step 7.1 : Verify that “Checkout: Overview” is show
    Wait Until Element Is Visible            //span[@class='title'][text()='Checkout: Overview']             #ตรวจสอบว่ามี text Checkout: Overview

#step 7.2 : Verify that Description is show
    Wait Until Element Is Visible            //div[@class='cart_desc_label'][text()='Description']

#step 7.3 : Verify that Summary same checkout page
    #step 7.3.1 : Verify Sauce Labs Onesie Title 
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]']]

    #step 7.3.2 : Verify Sauce Labs Onesie Price
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Onesie}[price]']]

    #step 7.3.3 : Verify that product QTY = 1
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Onesie}[title]'] and .//div[@class='cart_quantity'][text()='1']]

    #step 7.3.4 : Verify Sauce Labs Fleece Jacket Title 
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]']]

    #step 7.3.5 : Verify Sauce Labs Fleece Jacket Price
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_Sauce_Labs_Fleece_Jacket}[price]']]

    #step 7.3.6 : Verify that product QTY = 1
    Wait Until Element Is Visible           //div[@class='cart_item' and .//div[@class='inventory_item_name'][text()='${product_Sauce_Labs_Fleece_Jacket}[title]'] and .//div[@class='cart_quantity'][text()='1']]


#step 7.4 : Verify that Payment Information label is show
    Wait Until Element Is Visible              //div[@data-test='payment-info-label'][text()='Payment Information:']

#step 7.4.1 : Verify Payment value
    Wait Until Element Is Visible              //div[@data-test='payment-info-value'][text()='SauceCard #31337']  

#step 7.5 : Verify that Shipping Information label is show
    Page Should Contain Element                //div[@data-test='shipping-info-label'][text()='Shipping Information:']

#step 7.5.1 : Verify Shipping value
    Wait Until Element Is Visible              //div[@class='summary_value_label'][text()='Free Pony Express Delivery!']                 


#step 7.6 Verify that "Price Total" is show
    Wait Until Element Is Visible               //div[@data-test='total-info-label'][text()='Price Total'] 

#step 7.6.1 Verify that Item total = ___

    ${Price_item_total}        Evaluate           ${product_Sauce_Labs_Onesie}[price] + ${product_Sauce_Labs_Fleece_Jacket}[price]

    Wait Until Element Is Visible           //div[@data-test='subtotal-label'][text()='Item total: $' and text()='${Price_item_total}'] 

    
#step 7.7 Verify that tax = ___
    
    ${tax}    Evaluate    (${Price_item_total} * 8)/100

    ${tax_item_total}    Format String    {:.2f}    ${tax}

    Wait Until Element Is Visible           //div[@data-test='tax-label'][text()='Tax: $' and text()='${${tax_item_total}}'] 

#step 7.8 Verify that Total = ___
    ${sum_of_item_total_with_tax}    Evaluate    ${Price_item_total} + ${tax_item_total}
    ${sum_of_item_total_with_tax_format}    Format String    {:.2f}    ${sum_of_item_total_with_tax}

    Page Should Contain Element             //div[@data-test='total-label'][text()='Total: $' and text()='${sum_of_item_total_with_tax_format}'] 
    
#step 7.9: Click Finish
    Click Element                           //button[@id='finish'][text()='Finish']


#step 8 :Verify that thank you page
Verify thank you page
    #step 8.1 : Verify that “Checkout: Complete!” is show
    Wait Until Element Is Visible           //span[@class='title'][text()='Checkout: Complete!'] 

    #step 8.2 : Verify that image is show
    Wait Until Element Is Visible           //img[@data-test='pony-express']


    #step 8.3 : Verify that “Thank you for your order!” is show
    Wait Until Element Is Visible           //h2[@class='complete-header'][text()='Thank you for your order!'] 

    #step 8.4 : Verify that Back Home button is show on page
    Wait Until Element Is Visible           //button[@id='back-to-products'][text()='Back Home'] 




