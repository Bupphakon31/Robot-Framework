*** Settings ***
Library		SeleniumLibrary
Library         BuiltIn
Library         String
# Suite Setup		Open Browser  https://www.saucedemo.com/ 	browser=chrome	 options=add_experimental_option("detach", True) 

*** Variables *** 
${username}	    standard_user 
${password}	    secret_sauce
${Firstname}		Bupphakon
${Lastname}		Silarat
${postode}		24160


*** Test case ***
TestCases
    #step 1 :Open Browser  https://www.saucedemo.com/
    Open Browser        https://www.saucedemo.com/ 	browser=chrome      
    ...     options=binary_location=r"C:\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True)    
    ...     executable_path=C:\\chromedriver\\chromedriver.exe
    Login
    Filter product
    Add to cart
    Checkouts
    Input information and finish
    Verify that checkouts page
    Verify that thank you page
    # Go to Product page


*** Keywords ***
Login

    Maximize Browser Window                                                                                         #ขยาย window    
    Set Selenium Speed  0.05s                                                                                       #กำหนดให้ทุก action 0.05s 

    Element Text Should Be                  xpath=//div[@class='login_logo']      Swag Labs                         #ตรวจสอบว่ามีชื่อเพจ  Swag Labs
    Page Should Contain Textfield           id=user-name                                                            #ตรวจสอบว่ามี textfield username 
    Page Should Contain Textfield           id=password                                                             #ตรวจสอบว่ามี textfield password
    Page Should Contain Button              id=login-button                                                         #ตรวจสอบว่ามี   login button
   
    Input Text		                        id=user-name			${username}                                     #input username
    Textfield Should Contain                id=user-name            ${username}                                     #ตรวจสอบว่ามีค่า input username
  
    Input Text		                        id=password				${password}                                     #input password
    Textfield Should Contain                id=password             ${password}                                     #ตรวจสอบว่ามีค่า input password  

	Click Element			                id=login-button                                                         #click login

    Page Should Contain Element             xpath=//div[@id='shopping_cart_container']/a                            #ตรวจสอบว่ามี cart แสดง
    Page Should Contain Element             xpath=//*[@id="header_container"]/div[2]/div/span/select                #ตรวจสอบว่ามี DropDown filter แสดง
    Page Should Contain Element             xpath=//*[@id="inventory_container"]                                    #ตรวจสอบว่ามี product แสดง

Filter product
    Page Should Contain Element     xpath=//div[@id='shopping_cart_container']/a                                    #ตรวจสอบว่ามี cart แสดง
    Click Element                   xpath=//*[@id="header_container"]/div[2]/div/span/select                        #click filter 
    Page Should Contain List        xpath=//*[@id="header_container"]/div[2]/div/span/select                        #ตรวจสอบว่ามี DropDown filter แสดง
    Select From List By Index       xpath=//*[@id="header_container"]/div[2]/div/span/select   1                    #select filter Z-A
    Page Should Contain Element     xpath=//*[@id="inventory_container"]                                            #ตรวจสอบว่ามี product แสดง

Add to cart

    Click Element                       xpath=//*[@id="item_2_title_link"]/div                                                          #click ชื่อสินค้า Sauce Labs Onesie
    Click Element                       id=add-to-cart                                                                                  #click button add to cart
    Page Should Contain Button          xpath=//button[@id='back-to-products'][text()='Back to products']                               #ตรวจสอบว่ามีปุ่ม Back to product
    Element Text Should Be              xpath=//div[text()='Sauce Labs Onesie']             Sauce Labs Onesie                           #ตรวจสอบว่ามีชื่อ Sauce Labs Onesie
    Element Text Should Be              xpath=//div[@class='inventory_details_price'][text()='7.99']                  $7.99             #ตรวจสอบว่ามีราคา 7.99
    Page Should Contain Button          xpath=//button[@id='remove']                Remove                                              #ตรวจสอบว่าปุ่ม add to cart เปลี่ยนเป็น Remove
    ${Cart}                             Get Text                           xpath=//a/span[@class='shopping_cart_badge']         #เก็บค่า text          
    ${Cart}                             Convert To Number                  ${Cart}                                              #แปลง text เป็นตัวเลข
    ${Cart}                             Evaluate                           ${Cart} + 1                                          #ตรวจสอบว่ามี element แสดงที่ cart +1 หรือไม่


Checkouts

    Click Element                       xpath=//div[@id='shopping_cart_container']/a                #click cart
    Element Text Should Be              xpath=//div[@class='cart_quantity'][text()='1']                             1                       #ตรวจสอบว่ามี QTY = 1
    Element Text Should Be              xpath=//div[@class='inventory_item_name'][text()='Sauce Labs Onesie']       Sauce Labs Onesie       #ตรวจสอบว่ามีชื่อ Sauce Labs Onesie
    Element Text Should Be              xpath=//div[@class='inventory_item_price'][text()='7.99']                   $7.99                   #ตรวจสอบว่ามีราคา 7.99
    Page Should Contain Button          xpath=//div/button[@name='continue-shopping']               #ตรวจสอบว่าปุ่ม Continue Shopping
    Click Element                       id=checkout                                                 #click Checkout
    Page Should Contain Textfield       id=first-name                    #ตรวจสอบว่ามี textfield firstname
    Page Should Contain Textfield       id=last-name                     #ตรวจสอบว่ามี textfield lastname
    Page Should Contain Textfield       id=postal-code                   #ตรวจสอบว่ามี textfield pastal code 

Input information and finish
    Input Text		                id=first-name			${Firstname}                        #input Firstname
    Textfield Should Contain        id=first-name            ${Firstname}                       #ตรวจสอบว่ามีค่า input Firstname

	Input Text		                id=last-name			${Lastname}                         #input Lastname
    Textfield Should Contain        id=last-name            ${Lastname}                         #ตรวจสอบว่ามีค่า input Lastname

    Input Text		                id=postal-code	        ${postode}                          #input postode
    Textfield Should Contain        id=postal-code          ${postode}                          #ตรวจสอบว่ามีค่า input postode

    Click Element                   id=continue                                                 #click continue

    Element Text Should Be          xpath=//span[@class='title']                         Checkout: Overview             #ตรวจสอบว่ามี text Checkout: Overview

Verify that checkouts page

    ${cart_count}                        Get Element Count                xpath=//div[@class='cart_item']               #เรียกจำนวสินค้าที่มีในตระกร้า                               
    Should Be True                       ${cart_count} == 1                                                             #ตรวจสอบว่ามีสินค้าแค่ 1 ชิ้น

    ${item_price}       Get Text                xpath=//div[@class='inventory_item_price']                   #เรียกค่า text  $7.99
    ${item_price}       Remove String           ${item_price}   $                                            #ลบ text  $ 
    ${item_price}       Convert To Number       ${item_price}                                                #แปลง 7.99 เป็นตัวเลข

    Element Text Should Be              xpath=//div[@class='summary_value_label'][text()='SauceCard #31337']                      SauceCard #31337                   #ตรวจสอบว่ามี Payment Information Shipping Information Item total
    Element Text Should Be              xpath=//div[@class='summary_value_label'][text()='Free Pony Express Delivery!']           Free Pony Express Delivery!        #ตรวจสอบว่ามี Payment Information Shipping Information Item total

    ${item_total}    Get Text              xpath=//div[@class='summary_subtotal_label']                            #เรียกค่า text  Item  total   :   $7.99 
    ${item_total}    Remove String         ${item_total}      Item  total   :   $                                  #ลบ text Item  total   :   $
    ${item_total}    Convert To Number     ${item_total}                                                           #แปลงเป็นตัวเลข 7.99

    Should Be True      ${item_price} == ${item_total}                                             #ตรวจสอบว่า ราคารวมกับราคาสินค้าเท่ากัน

    ${tax}          evaluate                            (${item_total} * 8)/100                    #นำราคาสินค้ามาหาค่าภาษี
    ${Tax}          Convert To Number                   ${Tax}                                     #เปลี่ยนภาษีเป็นตัวเลข
    ${Tax}          evaluate                   "%.2f" % ${Tax}                                     #ทำเป็นทศนิยม 2 ตำแหน่ง


    ${price_total}        evaluate                            ${item_total} + ${Tax}
    ${price_total}        Convert To Number                   ${price_total}                #เปลี่ยนผลรวมภาษีและสินค้าเป็นตัวเลข
    ${price_total}        evaluate                   "%.2f" % ${price_total}                #ทำเป็นทศนิยม 2 ตำแหน่ง


    ${Total}            Get Text            xpath=//div[@class='summary_total_label']           
    ${Total}            Remove String                           ${Total}        Total    :      $       #ลบ text Total    :      $
    ${Total}            Convert To Number                       ${Total}                                #เปลี่ยน total text เป็นตัวเลข
    ${Total}            evaluate                       "%.2f" % ${Total}                                #ทำเป็นทศนิยม 2 ตำแหน่ง

    Should Be True      ${Total} == ${price_total}              #ตรวจสอบว่า ราคารวมที่แปลงจาก text เท่ากันกับ ราคาผลรวมภาษีและสินค้าที่ทำการคำนวนข้างบน

    Click Element                   id=finish                                                                                   #กดปุ่ม finish
    Element Text Should Be          xpath=//span[@class='title'][text()='Checkout: Complete!']      Checkout: Complete!         #ตรวจสอบว่ามี Checkout: Complete!

Verify that thank you page
    Element Text Should Be              xpath=//h2[@class][text()='Thank you for your order!']     Thank you for your order!                       #ตรวจสอบว่ามี Thank you for your order! แสดงอยู่
    Page Should Contain Button          id=back-to-products                     #ตรวจสอบว่ามี button Back Home แสดงอยู่

# Go to Product page
#     Click Element                        id=back-to-products                 #คลิก button Back Home เพื่อกลับไปหน้า product





#   step 4 :Add product to cart

#       step 4.1 : Click product name Sauce Labs Onesie

#         step 4.1.1 : Verify that product name Sauce Labs Onesie is show

#         step 4.1.2 : Verify that product price is show

#   @@@@@      step 4.1.3 : Verify that product Sauce Labs Onesie is show on page just one item

#         step 4.1.4 : Verify that Back to products  is show on page

#       step 4.2 : Click Add to cart button

#         step 4.2.1 : Verify that Add to cart  button change to Remove button

#         step 4.2.2 : Verify that cart plus one item

#   step 5 :Checkouts

#       step 5.1 : Click cart icon

#       step 5.2 : Verify is product same product list

#         step 5.2.1 : Verify that product name Sauce Labs Onesie is show

#         step 5.2.2 : Verify that product price is show

#         step 5.2.3 : Verify that product QTY = 1

#         step 5.2.4 : Verify that Remove button is show

#       step 5.3 : Click Checkout button

#         step 5.3.1 : Verify form Your Information is show

#   step 6 :Input your informations

#       step 6.1 : input your First Name

#         step 6.1.1 : Verify that input First Name has a value

#       step 6.2 : input your Last Name

#         step 6.2.1 : Verify that input Last Name has a value

#       step 6.3 : input your Zip/Postal Code

#         step 6.3.1 : Verify that input Zip/Postal Code has a value

#       step 6.4 : Click continue button

#         step 6.3.1 : Verify that “Checkout: Overview” is show

#   step 7 :Verify that checkouts page

#       step 7.1 : Verify that product Description is show

#         step 7.1.1 : Verify that product name Sauce Labs Onesie is show

#         step 7.1.2 : Verify that product price is show

#         step 7.1.3 : Verify that product QTY = 1

#       step 7.2 : Verify that Payment Information Description is show

#       step 7.3 : Verify that Shipping Information Description is show

#       step 7.4 : Verify that Price Total Description is show

#         step 7.4.1 : Verify that Item total = _______

#         step 7.4.1 : Verify that Tax = _______

#         step 7.4.1 : Verify that Total = _______

#       step 7.5 : Click Finish button

#         step 7.5.1 : Verify that “Checkout: Complete!” is show

#   step 8 :Verify that thank you page

#       step 8.1 : Verify that “Thank you for your order!” is show

#       step 8.2 : Verify that Empty cart

#       step 8.3 : Verify that Back Home button is show on page
