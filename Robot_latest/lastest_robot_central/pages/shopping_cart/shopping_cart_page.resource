*** Variables ***

# &{dict_product_page}
#     ...     wish_list_icon=//div[@class='headerWishList' and .//i[@class='icon icon-wish-list']]

#     ...     search_result_label=//span[@itemprop='name'][text()='Search Result']
#     ...     img_dior=//a[@href='/dior' and //img[@src='/content/dam/cds/brand-search/20220207_Logo_Dior2_d.jpg']]
#     ...     filter_sort_dropdown=//a[@data-testid='mnu-viewSearchFilterOnAllFilter' and .//span[@class='icon icon-material-filter1']]
#     ...     brand_name_filter=//button[@data-testid='btn-viewSearchFilterOnFilterBrand' and //div[@class='ais-Panel-header' and //span[text()='Brand Name']]]
#     ...     color_filter=//button[@data-testid='btn-viewProductFilter-filterColor' and //span[text()='Color']]
#     ...     price_filter=//button[@data-testid='btn-viewProductFilter-filterPrice' and //span[text()='Price']]
#     ...     size_filter=//button[@data-testid='btn-viewProductFilter-filterSize' and //span[text()='Size']]
#     ...     category_filter=//button[@data-testid='btn-viewProductFilter-filterBtn' and //span[text()='Category']]
#     ...     delivery_method_filter=//button[@data-testid='btn-viewProductFilter-filterDelivery' and //span[text()='Delivery Method']]
#     ...     sort_recommended_filter=//button[@data-testid='btn-viewProductFilter-filterSort' and //span[text()='Sort: Recommended']]

*** Keywords ***

Verify Shopping Bag Page


    Wait Until Element Is Visible    //section[.//a[@data-testid='lnk-viewCart-SellerCentral Department Store'] and .//p[.='Sold by Central Department Store']]
        
    # step 2.7 Verify that product "La Mousse OFF/ON Foaming Cleanser 150 mL" same product list page
    # step 2.7.0 Scroll into this product
    Scroll Into View    //section[@id='CDS89295700']

    # step 2.7.1 Verify that brand label is show
    # Wait Until Element Is Visible    //section[@id='CDS89295700']//a[@class='spc-product-card__card-brand-name'][text()='DIOR']
    Element Text Should Be    //section[@id='CDS89295700']//a[@class='spc-product-card__card-brand-name']    DIOR

    # step 2.7.2 Verify that name label is show
    Page Should Contain Element    //section[@id='CDS89295700']//a[starts-with(@class,'spc-product-card__card-nam')][text()='La Mousse OFF/ON Foaming Cleanser 150 mL']

    # step 2.7.3 Verify that price label is show
    ${price_with_format}    Format String    ฿{:,}    ${product_01}[price]
    # Page Should Contain Element    //section[@id='CDS89295700']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿1,305']
    Page Should Contain Element    //section[@id='CDS89295700']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='${price_with_format}']

    # step 2.7.4 Verify that qty label is show
    Element Text Should Be    //section[@id='CDS89295700']//span[starts-with(@class,'spc-product-card__card-quantity')]    1
    

    # step 2.8 Verify that product "Miss Dior Rose N'Roses  Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL" same product list page
    
    # step 2.8.0 Scroll into this product
    Scroll Into View    //section[@id='CDS6340728']

    # step 2.8.1 Verify that brand label is show
    Element Text Should Be    //section[@id='CDS6340728']//a[@class='spc-product-card__card-brand-name']    DIOR

    # step 2.8.2 Verify that name label is show
    Page Should Contain Element    //section[@id='CDS6340728']//a[starts-with(@class,'spc-product-card__card-nam')][text()="Dior Homme Intense \ Eau de Parfum intense 100 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.8.3 Verify that price label is show
    ${price_with_format}    Format String    ฿{:,}    ${product_02}[price]
    # Page Should Contain Element    //section[@id='CDS6340728']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿1,935']
    Page Should Contain Element    //section[@id='CDS6340728']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='${price_with_format}']

    # step 2.8.4 Verify that qty label is show
    Element Text Should Be    //section[@id='CDS6340728']//span[starts-with(@class,'spc-product-card__card-quantity')]    1

    
    # step 2.9.1 Scroll into "Free Gifts and Gift Wrapping" label
    # Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
    Scroll Into View    //section[@class='spc-section-title']//h3[text()='Free Gifts and Gift Wrapping']

    # step 2.10 Verify that "2 Free gift(s) with this order" section
    Wait Until Element Is Visible    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__gift-count'][text()='4']
    Page Should Contain Element    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Free gift(s) with this order']

    # step 2.11 Verify that "Gift Wrapping Available" section
    Page Should Contain Element    //section[@id='giftWrappingBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Gift Wrapping Available']


    # step 2.12 Verify that "You may also like" label is show
    # Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
    # Wait Until Element Is Visible    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']

    # step 2.12.1 Scroll into "Easy Returns" label
    Scroll Into View      //*[@id='spcCouponsPricing']//p[@class='spc-feature-list-item__redeem-title'][normalize-space(.)='You can earn 278 Points']             #TODO: 20240724 - Dynamic data

    # step 2.13 Verify that "You can earn 130 Points"
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//p[@class='spc-feature-list-item__redeem-title'][normalize-space(.)='You can earn 278 Points']    #TODO: 20240724 - Dynamic data


Verify Coupons and Voucher


 # step 2.14 Verify that "Coupons and Vouchers" 
    # step 2.14.1 Verify that "Coupons and Vouchers" label
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//h3[@class='spc-section-title__title'][text()='Coupons and Vouchers']

    # step 2.14.2 Verify that "Coupon code" input
    Page Should Contain Element    //*[@id='spcCouponsPricing']//input[@data-testid='txt-formCart-applyCoupon'][@placeholder='Enter a coupon code']

    # step 2.14.3 Verify that "Apply" button 
    Page Should Contain Element    //*[@id='spcCouponsPricing']//button[@data-testid='btn-addCart-applyCoupon'][text()='Apply']

    # step 2.15 Verify that "Easy Returns"

    # step 2.15.0 Scroll Into Easy Returns label
    Scroll Into View    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Easy Returns']

    # step 2.15.1 Verify that "Easy Returns" icon
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Easy Returns']

    # step 2.15.2 Verify that "Easy Returns" label
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Easy Returns']


    # step 2.15 Verify that "Quality Assured"
    # step 2.15.1 Verify that "Quality Assured" icon
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Quality Assured']

    # step 2.15.2 Verify that "Quality Assured" label
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Quality Assured']
    

    # step 2.15 Verify that "Original Brands"
    # step 2.15.1 Verify that "Original Brands" icon
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Original Brands']

    # step 2.15.2 Verify that "Original Brands" label
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Original Brands']


    # step 2.15 Verify that "Best Prices"
    # step 2.15.1 Verify that "Best Prices" icon
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Best Prices']

    # step 2.15.2 Verify that "Best Prices" label
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Best Prices']





Verify Product Pricing

    # step 2.16 Verify that "Product Pricing"

    # step 2.16.0 Scroll into Sub Total (2 Items)
    Scroll Into View    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__order-total-text'][text()='Order Total']

    # step 2.16.1 Verify that "Sub Total (2 Items)" label    # 2 Items
    # if has one item --> then "X Item"
    # if have two of more item --> then "X Items"

    IF    '${count_of_bag}' == '1'
        ${count_of_bag_with_format}    Format String    {count_of_bag} Item    count_of_bag=${count_of_bag}
    ELSE
        ${count_of_bag_with_format}    Format String    {count_of_bag} Items    count_of_bag=${count_of_bag}
    END
    
    # Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[text()='Sub Total (2 Items)']
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[text()='Sub Total (${count_of_bag_with_format})']

    # step 2.16.2 sub total = product price + product price
    ${sub_total}    Evaluate    ${product_01}[price] + ${product_02}[price]
    ${sub_total_with_format}    Format String    ฿{:,}    ${sub_total} 
    
 
    # step 2.16.3 Verify that "Sub Total (2 Items)" value = sub total
    # //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]/div[normalize-space(.)='฿2,835']
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (${count_of_bag_with_format})']]/div[normalize-space(.)='${sub_total_with_format}']

    # step 2.16.4.1 Verify that "Discount" label   
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(text())='Discount']

    # step 2.16.4.2 Verify that "Discount" value

    
    ${discount_with_format}    Format String   ฿{:,}    ${discount}
    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(.)='฿0']
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(.)='${discount_with_format}']

    # step 2.16.5 Verify that "Congratulation! You get FREE Standard Delivery" label
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[.='Congratulation! You get FREE Standard Delivery']]

    # step 2.16.6 Verify that "Order Total incl. VAT" label 
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__order-total-text'][text()='Order Total']

    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__incl-tax-text'][text()='incl. VAT']

    # step 2.16.7 order total = sub total + discount

    ${order_total}    Evaluate   ${sub_total} + ${discount}
    ${order_total_with_format}    Format String    ฿{:,}    ${order_total}
    ${order_total_without_Symbol_format}    Format String    {:,}    ${order_total}

    # step 2.16.8 Verify that "Order Total incl. VAT" value = order total   
    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='฿2,835']
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='${order_total_with_format}']



Verify Checkout

    # step 2.17 Verify that "Checkout"
    # step 2.17.1 Verify that "Checkout" button
    Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]

    # step 2.17.2 Verify that "Checkout" value  = order total
    # Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]//span[@id='spcBagGrandTotal'][text()='2,835']
    Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]//span[@id='spcBagGrandTotal'][text()='${order_total_without_Symbol_format}']

    # step 3 Bag page
    # step 3.1 Click checkout button
    Click Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]

    # step 3.1.1 Verify that "Log in or Sign up" title is show
    Wait Until Element Is Visible    //*[contains(@class, 'spc-log-in spc-login-register')]//h2[text()='Log in or Sign up']

    # step 3.1.2 Verify that "Continue as guest" button is show 
    Wait Until Element Is Visible    //*[contains(@class, 'spc-log-in spc-login-register')]//span[text()='Continue as Guest']

    # step 4 login page
    # step 4.1 Click "Continue as guest" button
    Click Element    //*[contains(@class, 'spc-log-in spc-login-register')]//span[text()='Continue as Guest']

    # step 4.2 Verify that Checkout page is show 
    Wait Until Element Is Visible    //span[text()='Back to shopping bag']
    Wait Until Element Is Visible    //h2[normalize-space(text())='Secure Checkout']






# step 5 checkout
    # step 5.0 Verify that product in bag same product list
    # step 5.0.1 Click "View Items" button

    Wait Until Element Is Visible    //a[@data-testid='lnk-viewCheckout-items1']//span[text()='View Items']
    Click Element    //a[@data-testid='lnk-viewCheckout-items1']//span[text()='View Items']
    
    # step 5.0.1.0 Verify that "Shipment 1 of 1" title is show
    Wait Until Element Is Visible    //h2[text()='Shipment 1 of 1']

    # step 5.0.1.1 Verify that product "La Mousse OFF/ON Foaming Cleanser 150 mL" same product list page

    # step 5.0.1.1.0     scroll to element
    Scroll Into View    //section[@class='spc-product-card' and .//*[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]

    # step 5.0.1.1.1 Verify that band
    Wait Until Element Is Visible    //section[@class='spc-product-card' and .//*[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]//*[text()='DIOR']

    # step 5.0.1.1.2 Verify that name
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]


    # step 5.0.1.1.3 Verify that price
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]//*[normalize-space(.)='฿1,845']

    # step 5.0.1.1.4 Verify that qty
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]//*[normalize-space(text())='Quantity: 1']


    # step 5.0.1.2 Verify that product "Miss Dior Rose N'Roses  Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL" same product list page
    
    # step 5.0.1.2.0     scroll to element
    Scroll Into View    //section[@class='spc-product-card' and .//*[text()="Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL"]]

    # step 5.0.1.2.1 Verify that band
    Wait Until Element Is Visible    //section[@class='spc-product-card' and .//*[text()="Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL"]]//*[text()='DIOR']
    
    # step 5.0.1.2.2 Verify that name
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()="Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL"]]
    
    # step 5.0.1.2.3 Verify that price
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()="Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL"]]//*[normalize-space(.)='฿5,085']
    
    # step 5.0.1.2.4 Verify that qty
    Page Should Contain Element    //section[@class='spc-product-card' and .//*[text()="Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL"]]//*[normalize-space(text())='Quantity: 1']

    # step 5.0.2 Click "Back" button

    Scroll Element Into View    //*[@id='spcShipmentDetailsWrap']//i[@class='icon icon-spc-back-arrow']
    Wait Until Element Is Visible    //*[@id='spcShipmentDetailsWrap']//i[@class='icon icon-spc-back-arrow']
    Click Element    //*[@id='spcShipmentDetailsWrap']//i[@class='icon icon-spc-back-arrow']


    # step 5.0.2.1 Verify that "Shipment 1 of 1" title is not  show
    # Wait Until Element Is Not Visible    //h2[text()='Shipment 1 of 1']
    Wait Until Page Contains Element   //*[@class='spc-modal-backdrop']


    # step 5.1 Delivery To 
    Wait Until Element Is Visible    //*[@id='spcShipmentGroupsWrap']//h3[@id='deliveryTitle'][text()='Delivery To']
    
    # step 5.1.1 Click "Delivery To" button 
    Click Element    //*[@id='spcShipmentGroupsWrap']//p[normalize-space(.)='Add your delivery address']

    # step 5.1.1.1 Verify that "Add Delivery Details" title is show
    Wait Until Element Is Visible    //*[@id='spcAddDeliveryDetails']//h2[text()='Add Delivery Details']
    
    # step 5.1.1.2 Verify that "Add new address" section is show
    Page Should Contain Element    //*[@id='spcAddDeliveryDetails']//span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Add new address']

    # step 5.1.2 Click "Add new address" section
    Click Element    //*[@id='spcAddDeliveryDetails']//span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Add new address']

    # step 5.1.2.1 Verify that "Add Address" title is show
    Wait Until Element Is Visible    //*[@id='spcAddAddress']//h2[text()='Add Address']

    # step 5.2 Input Address
    Wait Until Element Is Visible      //input[@id='firstNameTxtbx']

    # step 5.2.1 Input first name
    # step 5.2.1.1 Verify that "First Name" input is empty
    Textfield Value Should Be     //input[@id='firstNameTxtbx']   ${EMPTY}   

    # step 5.2.1.2 Input "First Name" = Book
    Input Text    //input[@id='firstNameTxtbx']      Book

    # step 5.2.1.3 Verify that "First Name" input = Book
    Textfield Value Should Be     //input[@id='firstNameTxtbx']   Book

    # step 5.2.2 Input last name
    # step 5.2.2.1 Verify that "Last Name" input is empty
    Textfield Value Should Be     //input[@id='lastNameTxtbx']   ${EMPTY}   

    # step 5.2.2.2 Input "Last Name" = Pen
    Input Text    //input[@id='lastNameTxtbx']    Pen

    # step 5.2.2.3 Verify that "Last Name" input = Pen
    Textfield Value Should Be     //input[@id='lastNameTxtbx']    Pen

    # step 5.2.3 Input Phone Number
    # step 5.2.3.1 Verify that "Phone Number" input is empty
    Textfield Value Should Be    //input[@id='phoneNoTxtbx']    ${EMPTY}

    # step 5.2.3.2 Input "Phone Number" = 0833333333
    Input Text    //input[@id='phoneNoTxtbx']    0833333333

    # step 5.2.3.3 Verify that "Phone Number" input = 0833333333
    Textfield Value Should Be    //input[@id='phoneNoTxtbx']    0833333333

    # step 5.2.4 Input Email Address

    # step 5.2.4.1 Verify that "Email Address" input is empty
    Textfield Value Should Be    //input[@id='emailTxtbx']    ${EMPTY}

    # step 5.2.4.2 Input "Email Address" = info@gmail.com
    Input Text    //input[@id='emailTxtbx']        info@gmail.com

    # step 5.2.4.3 Verify that "Email Address" input = info@gmail.com
    Textfield Value Should Be    //input[@id='emailTxtbx']    info@gmail.com

    # step 5.2.5 Input Address
    # step 5.2.5.1 Verify that "Address" input is empty
    Textfield Value Should Be    //input[@id='addressTxtbx']    ${EMPTY}

    # step 5.2.5.2 Input "Address" = 109/38 BigC
    Input Text    //input[@id='addressTxtbx']        109/38 BigC

    # step 5.2.5.3 Verify that "Address" input = 109/38 BigC
    Textfield Value Should Be    //input[@id='addressTxtbx']    109/38 BigC

    # step 5.2.6 Input Postcode
    # step 5.2.6.1 Verify that "Postcode" input is empty
    Textfield Value Should Be    //input[@id='postcodeTxtbx']    ${EMPTY}

    # step 5.2.6.2 Input "Postcode" = 10260
    Input Text    //input[@id='postcodeTxtbx']    10260

    # step 5.2.6.3 Verify that "Postcode" input = 10260
    Textfield Value Should Be    //input[@id='postcodeTxtbx']    10260

    # step 5.2.6.4.0  Scroll to 'selectSubDistrict'
    Scroll Into View    //select[@id='selectSubDistrict']

    # step 5.2.6.4 Verify that "Province" dropdown = Bangkok
    Wait Until Element Is Visible    //select[@id='selectProvience']
    Wait Until Page Contains Element    (//select[@id='selectProvience']/option)[1][text()='Bangkok']

    # step 5.2.6.5 Scroll into view "Sub District"

    # step 5.2.8 Choose District
    # step 5.2.8.1 Verify that "District" input is not empty
    # step 5.2.8.2 Choose "District" = Bang Na
    # step 5.2.8.3 Verify that "District" input = Bang Na

    # step 5.2.9 Choose Sub District
    # step 5.2.9.1 Verify that "Sub District" input is not empty
    # step 5.2.9.2 Choose "Sub District" = Bang Na Tai
    # step 5.2.9.3 Verify that "Sub District" input = Bang Na Tai


    # step 5.2.6.5 Verify that "District" dropdown = Phra Khanong
    Wait Until Page Contains Element    (//select[@id='selectDistrict']/option)[1][text()='Phra Khanong']

    # step 5.2.6.6 Verify that "Sub District" dropdown = Bang Chak
    Wait Until Page Contains Element    (//select[@id='selectSubDistrict']/option)[1][text()='Bang Chak']


    # step 5.2.9.4 Scroll into view "Address Label"
    Scroll Into View    //input[@id='addressLabelTxtbx']
    Wait Until Element Is Visible    //input[@id='addressLabelTxtbx']

    # step 5.2.10 Input Address Label
    # step 5.2.10.1 Verify that "Address Label" input is empty
    Textfield Value Should Be    //input[@id='addressLabelTxtbx']    ${EMPTY}

    # step 5.2.10.2 Input "Address Label" = Office
    Input Text    //input[@id='addressLabelTxtbx']    Office

    # step 5.2.10.3 Verify that "Address Label" input = Office
    Textfield Value Should Be    //input[@id='addressLabelTxtbx']    Office

    # step 5.2.11 Click "Use This Address" button
    Click Element    //a[@id='submitAddAddress']//span[text()='Use This Address']
    

    # step 5.2.11.1 Verify that "Office" lable is show
    # step 5.2.11.2 Verify that "Office" Radio button is checked

    # step 5.3 Click "Use This Address" button
    # step 5.3.1 Verify that "First Name", "Last Name" and "Phone Number"
    # step 5.3.2 Verify that "Address" 

    # step 5.4 Choose Home Delivery
    # step 5.4.1 Verify that "Home Delivery" is checked
        
    # step 5.5 Payment Method
    # step 5.5.1 Choose "Credit/Debit Card" 
    # step 5.5.1.1 Verify that "Credit/Debit Card" is checked

    # step 5.5.2 Input "Name on Card"
    # step 5.5.2.1 Verify that "Name on Card" input is empty
    # step 5.5.2.2 Input "Name on Card" = B.pen
    # step 5.5.2.3 Verify that "Name on Card" input = B.pen

    # step 5.5.3 Input "Card Number"
    # step 5.5.3.1 Verify that "Card Number" input is empty
    # step 5.5.3.2 Input "Card Number" = 4442594103424800
    # step 5.5.3.3 Verify that "Card Number" input = 4442 5941 0342 4800
    # step 5.5.3.4 Verify that "Card type" image = VISA

    # step 5.5.4 Input "Expiry Date"
    # step 5.5.4.1 Verify that "Card Number" input is empty
    # step 5.5.4.2 Input "Card Number" = 1125
    # step 5.5.4.3 Verify that "Card Number" input = 11 / 25

    # step 5.5.5 Input CVV
    # step 5.5.5.1 Verify that "CVV" input is empty
    # step 5.5.5.2 Input "CVV" = 759
    # step 5.5.5.3 Verify that "CVV" input = 759

    # step 5.6 Verify that "Price summary" same "Product Pricing" 
    # step 5.6.1 Verify that "Sub Total (2 Items)"
    # step 5.6.1.1 Verify that "Sub Total (2 Items)" label is show
    # step 5.6.1.2 Verify that "Sub Total (2 Items)" value = ฿2,150

    # step 5.6.2 Verify that "Discount"
    # step 5.6.2.1 Verify that "Discount" label is show
    # step 5.6.2.2 Verify that "Discount" value = ฿0

    # step 5.6.3 Verify that "Delivery Fee"
    # step 5.6.3.1 Verify that "Delivery Fee" label is show
    # step 5.6.3.2 Verify that "Delivery Fee" value = FREE

    # step 5.6.3 Verify that "Order Total incl. VAT"
    # step 5.6.3.1 Verify that "Order Total incl. VAT" label is show
    # step 5.6.3.2 Verify that "Order Total incl. VAT" value = ฿2,150


    # step 5.7 Verify that "Place Order" button is show















































