*** Settings ***
Library    SeleniumLibrary    timeout=10s
Library    Collections
Library    String

Variables      ${CURDIR}/../test_data/prefs.yaml


*** Variables ***
&{product_01}    name=La Mousse OFF/ON Foaming Cleanser 150 mL    price=${1845}    qty=1
&{product_02}    name=Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL    price=${5085}    qty=1    #TODO: 20240724 -  2 whitespace
${discount}        ${0}

${count_of_bag}    0

*** Keywords ***
Scroll Into View
    [Arguments]    ${locator} 
    ${temp_id}    Get Element Attribute    ${locator}    id

    Assign Id To Element    ${locator}    id=id_for_scroll

    Execute Javascript    document.querySelector('#id_for_scroll').scrollIntoView({ behavior: "instant", block: "center", inline: "center" })

    Assign Id To Element    //*[@id='id_for_scroll']    ${temp_id}


Input Text For Auto Complate
    [Arguments]    ${locator}    ${text}
    ${text_list}    Convert To List    dior

    Input Text    ${locator}   ${text_list}[0]
    FOR    ${index}    IN RANGE   1   len(${text_list})
        Sleep    0.5s
        Input Text    ${locator}   ${text_list}[${index}]    clear=${False}
    END


*** Test Cases ***
# POC_Convert_To_List
#     ${result}    Convert To List    dior
#     Log    ${result}


# POC_Format_String_Price
#     ${sub_total}    Evaluate    1845 + 990
#     ${sub_total_with_format}    Format String    ฿{:,}    ${sub_total} 

#     Log    ${sub_total_with_format}


TC_01
    Open Browser    https://www.central.co.th/ 
    ...       gc    
    ...     options=binary_location=r"C:\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True);add_experimental_option("prefs",${prefs});add_argument("--disable-notifications")   
    ...     executable_path=C:\\chromedriver\\chromedriver.exe
    Maximize Browser Window
    
    # step 0 Select frame for close banner
    Wait Until Page Contains Element    //iframe[@title='Modal Message']
    Select Frame    //iframe[@title='Modal Message']


    # step 1 choose language en
    # step 1.1 close banner when we see it
    
    Wait Until Element Is Visible    //*[@page-id='email-capture']//button[@aria-label='Close Message']
    Click Element    //*[@page-id='email-capture']//button[@aria-label='Close Message']


    # step 1.1.1 Unselect frame
    Unselect Frame

    # step 1.2 choose language en 
    Wait Until Element Is Visible    //button[@id='siteLangNavbtn'][normalize-space(text())='English']
    Click Element    //button[@id='siteLangNavbtn'][normalize-space(text())='English']

    Wait Until Element Is Visible    //img[@alt='ENG-Lang-Logo']
    Click Element    //img[@alt='ENG-Lang-Logo']

    # Wait Until Element Is Visible    //*[@page-id='email-capture']//button[@aria-label='Close Message']
    # Click Element    //*[@page-id='email-capture']//button[@aria-label='Close Message']

    # step 1.3 Verify that "Search for products and brands" is show
    Wait Until Element Is Visible    //input[@data-testid='txt-searchProductList-searchQuery']
    Element Attribute Value Should Be    //input[@data-testid='txt-searchProductList-searchQuery']    placeholder    Search for products and brands

    # step 1.4 Verify that https://www.central.co.th/en is show

    ${current_url}    Get Location
    Should Be Equal As Strings     https://www.central.co.th/en       ${current_url}
    
    
    # step 2.1 Verify detail of index page
    # step 2.1.1 Verify that Hamberger is show
    # Wait Until Element Is Visible    //*[@id='hamMenuIcon']

    # step 2.1.2 Verify that Central logo is show
    Page Should Contain Element    //*[@alt='CentralLogo']

    # step 2.1.3 Verify that wish list icon is show
    Page Should Contain Element    //*[@alt='CentralLogo']

    # step 2.1.4 Verify that bag icon is show
    Page Should Contain Element    //*[@id='userOutWishlist']
    

    # step 2.2 Search "dior" product
    # step 2.2.1 Input "dior" on Search box
    Input Text For Auto Complate    //input[@data-testid='txt-searchProductList-searchQuery']    dior
    
    # step 2.2.2 Verify that "dior" on Search box
    Textfield Value Should Be        //input[@data-testid='txt-searchProductList-searchQuery']    dior

    # step 2.2.3 Verify that  "Search Result" label is show
    Wait Until Element Is Visible    //span[text()='Search Result']    10s

    # step 2.2.4 Verify that "DIOR" image is show
    Wait Until Element Is Visible    //*[@id='bannerImageView']/a[@href='/en/dior']


    # TODO: 20240710 - maybe ab test

    # step 2.2.5 Verify that "Sort: Recommended" button is show
    # Wait Until Element Is Visible    //*[@data-testid='btn-viewProductFilter-filterSort']//span[text()='Sort: Recommended']
    
    # step 2.2.6 Verify that "Brand Name" button is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewSearchFilterOnFilterBrand']    Brand Name

    # step 2.2.7 Verify that "Color" button is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewProductFilter-filterColor']    Color

    # step 2.2.8 Verify that "Price" button is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewProductFilter-filterPrice']    Price

    # step 2.2.9 Verify that "Size" button is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewProductFilter-filterSize']    Size

    # step 2.2.10 Verify that "Gender" button is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewProductFilter-filterGender']    Gender

    # step 2.2.10 Verify that "Delivery Method" is show
    # Element Text Should Be    //*[@class='filters-list']//*[@data-testid='btn-viewProductFilter-filterDelivery']    Delivery Method

    # step 2.2.10 Verify that "All Filters" button is show
    # Page Should Contain Element    //*[@data-testid='mnu-viewSearchFilterOnAllFilter']//span[normalize-space(text())='Filter']
    

    # step 2.3 Choose product "La Mousse OFF/ON Foaming Cleanser 150 mL"
    # step 2.3.0 get count of bag
    # step 2.3.0.1 if has d-none  then set count_of_bag = 0
    # step 2.3.0.2 if has not d-none then get count of bag from xpath
    # step 2.3.0.1 if cartCountInHeader is visible     then get count of bag from xpath 
    # step 2.3.0.2 if cartCountInHeader is invisible   set count_of_bag = 0

    

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    ELSE
        ${count_of_bag}    Set Variable    0
    END
    
    # step 2.3.1 Scroll in to this product
    Scroll Into View         //*[@class='flip-card-front']//a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']

    # step 2.3.1.1 Verify that Image is show
    Page Should Contain Element    //*[@data-product-sku="CDS89295700"]//img
    
    # step 2.3.1.2 Verify that Price is show
    # Element Should Be Visible    //*[@data-product-sku='CDS89295700']//h4[@class='finalPrice'][text()='฿1,305']

    ${price_with_format}    Format String    ฿{:,}    ${product_01}[price]
    Element Should Be Visible    //*[@data-product-sku='CDS89295700']//h4[@class='finalPrice'][text()='${price_with_format}']
    
    # step 2.3.1.3 Verify that Brand is show
    Element Should Be Visible    //*[@data-product-sku='CDS89295700']//a[@class='sliderTitle'][text()= 'DIOR']
    Element Text Should Be       //*[@data-product-sku='CDS89295700']//a[@class='sliderTitle']    DIOR

    # step 2.3.1.3 Verify that Name is show
    Element Should Be Visible    //*[@data-product-sku='CDS89295700']//a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']
    

    # step 2.3.1.3 Verify that Home Delivery is show
    Element Should Be Visible    //*[@data-product-sku='CDS89295700']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']
    
    # step 2.3.2 Mouse Over on product 
    Mouse Over    //*[@data-product-sku="CDS89295700"]

    # step 2.3.2.1 Verify that "Wish list" button is show
    Wait Until Element Is Visible    //*[@data-product-sku="CDS89295700"]//button/label[text()='WISHLIST']

    # step 2.3.2.2 Verify that "Add to bag" button is show
    Element Should Be Visible    //*[@data-product-sku="CDS89295700"]//button/span[text()='ADD TO BAG']


    # step 2.3.3 Click "Add to bag" button
    # Click Element    //*[@data-product-sku="CDS89295700"]//button/span[text()='ADD TO BAG']
    Click Button    //*[@data-product-sku="CDS89295700"]//button[./span[text()='ADD TO BAG'] ]

    # step 2.3.4 get last count of bag 

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        
        # step 2.3.5 Verify that "get count of bag" + 1  == "get last count of bag"
        ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    END



    #---------------------------------

    # step 2.4 Choose product "Miss Dior Rose N'Roses  Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL"
    # step 2.4.0 get count of bag

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    ELSE
        ${count_of_bag}    Set Variable    0
    END

    # step 2.4.1 Scroll in to this product
    Scroll Into View         //*[@class='flip-card-front']//a[text()="Dior Homme Intense \ Eau de Parfum intense 100 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.4.1.1 Verify that Image is show
    Page Should Contain Element    //*[@data-product-sku="CDS6340728"]//img

    # step 2.4.1.2 Verify that Price is show

    ${price_with_format}    Format String    ฿{:,}    ${product_02}[price]
    # Element Should Be Visible    //*[@data-product-sku='CDS6340728']//h4[@class='finalPrice'][text()='฿1,935']
    Element Should Be Visible    //*[@data-product-sku='CDS6340728']//h4[@class='finalPrice'][text()='${price_with_format}']

    # step 2.4.1.3 Verify that Brand is show
    Element Should Be Visible    //*[@data-product-sku='CDS6340728']//a[@class='sliderTitle'][text()= 'DIOR']

    # step 2.4.1.3 Verify that Name is show
    Element Should Be Visible    //*[@data-product-sku='CDS6340728']//a[text()="Dior Homme Intense \ Eau de Parfum intense 100 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.4.1.3 Verify that Home Delivery is show
    Element Should Be Visible    //*[@data-product-sku='CDS6340728']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']

    # step 2.4.2 Mouse Over on product 
    Mouse Over    //*[@data-product-sku="CDS6340728"]

    # step 2.4.2.1 Verify that "Wish list" button is show
    Wait Until Element Is Visible    //*[@data-product-sku="CDS6340728"]//button/label[text()='WISHLIST']

    # step 2.4.2.2 Verify that "Add to bag" button is show
    Element Should Be Visible    //*[@data-product-sku="CDS6340728"]//button/span[text()='ADD TO BAG']

    # step 2.4.3 Click "Add to bag" button
    Click Button    //*[@data-product-sku="CDS6340728"]//button[./span[text()='ADD TO BAG'] ]

    # step 2.4.4 get last count of bag 

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        
        # step 2.4.5 Verify that "get count of bag" + 1  == "get last count of bag"
        ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    END

    #-------------------------------------------

    # step 2.5 Click Bag icon
    Click Element    //a[@data-testid='btn-viewCart-bag']
    
    # step 2.5.1 Verify that "Shopping Bag" title is show
    Wait Until Element Is Visible   //h2[text()='Shopping Bag']

    # step 2.6 Verify that "Sold by Central Department Store" label is show
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
    Input Text    //input[@id='firstNameTxtbx']      First

    # step 5.2.1.3 Verify that "First Name" input = Book
    Textfield Value Should Be     //input[@id='firstNameTxtbx']   First

    # step 5.2.2 Input last name
    # step 5.2.2.1 Verify that "Last Name" input is empty
    Textfield Value Should Be     //input[@id='lastNameTxtbx']   ${EMPTY}   

    # step 5.2.2.2 Input "Last Name" = Pen
    Input Text    //input[@id='lastNameTxtbx']    Last

    # step 5.2.2.3 Verify that "Last Name" input = Pen
    Textfield Value Should Be     //input[@id='lastNameTxtbx']    Last

    # step 5.2.3 Input Phone Number
    # step 5.2.3.1 Verify that "Phone Number" input is empty
    Textfield Value Should Be    //input[@id='phoneNoTxtbx']    ${EMPTY}

    # step 5.2.3.2 Input "Phone Number" = 0833333333
    Input Text    //input[@id='phoneNoTxtbx']    0912345678

    # step 5.2.3.3 Verify that "Phone Number" input = 0833333333
    Textfield Value Should Be    //input[@id='phoneNoTxtbx']    0912345678

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
    Input Text    //input[@id='addressTxtbx']        11/35 Lotus

    # step 5.2.5.3 Verify that "Address" input = 109/38 BigC
    Textfield Value Should Be    //input[@id='addressTxtbx']    11/35 Lotus

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



    




     
    


    

    


    




     
    


    

    




    




     
    


    

    














    
# # =====================================================
#     # step 2.3 Choose product "La Mousse OFF/ON Foaming Cleanser 150 mL"
#     # step 2.3.0 get count of bag

#     ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s     #code ole brother

#     IF  ${is_cart_count_visible} == ${True}
#         Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
#     ELSE
#         ${count_of_bag}    Set Variable    0
#     END

#     # ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=2s

#     # IF  ${is_cart_count_visible} == ${True}
#     #     ${count_of_bag}   Get Text    //span[contains(@class, 'cartCountInHeader')]    # TODO: 20240703 - not test data from web
#     # ELSE
#     #     ${count_of_bag}    Set Variable    0
#     # END




#     # step 2.3.1 Scroll in to this product
#     # Sleep                                           2s     

#     Scroll Into View                            //*[@class='flip-card-front']//a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']
#     # Scroll Element Into View                    //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]
#     # Scroll Element Into View                     //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700' and //div[@class='priceBlock' and //h4[text()='฿1,845']]]]//a[@class='sliderDesc' and //a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]
    
#     # step 2.3.1.1 Verify that Image is show
#     Wait Until Element Is Visible               //*[@data-product-sku="CDS89295700"]//img
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//img[@src='https://assets.central.co.th//adobe/dynamicmedia/deliver/dm-aid--7494a3b5-d149-42e4-b605-893e48a6bdcc/dior-lamousseoffonfoamingcleanser150ml-cds89295700-1.jpg?preferwebp=true&quality=60&width=199']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700' and //img[@src='https://assets.central.co.th//adobe/dynamicmedia/deliver/dm-aid--7494a3b5-d149-42e4-b605-893e48a6bdcc/dior-lamousseoffonfoamingcleanser150ml-cds89295700-1.jpg?preferwebp=true&quality=60&width=199']]]
    
#     # step 2.3.1.2 Verify that Price is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS89295700']//h4[@class='finalPrice'][text()='฿2,050']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//div[@class='priceBlock' and //h4[text()='฿2,050']]

#     # step 2.3.1.3 Verify that Brand is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS89295700']//a[@class='sliderTitle'][text()= 'DIOR']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//a[@class='sliderTitle' and //a[text()='DIOR']]
    
#     # step 2.3.1.3 Verify that Name is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS89295700']//a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//a[@class='sliderDesc' and //a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]
#     # Mouse Over                                  ${dict_product_page}[wish_list_icon]
#     # Mouse Over                                   //*[@data-product-sku="CDS89295700"]   


#     # step 2.3.1.3 Verify that Home Delivery is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS89295700']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//span[text()='Home Delivery']


#     # step 2.3.2 Mouse Over on product

#     Mouse Over                                  //*[@data-product-sku="CDS89295700"]
    
#     # step 2.3.2.1 Verify that "Wish list" button is show
#     Wait Until Element Is Visible               //*[@data-product-sku="CDS89295700"]//button/label[text()='WISHLIST']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addWishlist-productListCDS89295700' and //button[@aria-label='Add to Wishlist' and //label[text()='WISHLIST']]]

#     # step 2.3.2.2 Verify that "Add to bag" button is show
#     Wait Until Element Is Visible               //*[@data-product-sku="CDS89295700"]//button/span[text()='ADD TO BAG']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addCart-productListCDS89295700' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]


#     # step 2.3.3 Click "Add to bag" button
#     # Mouse Over                   //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addCart-productListCDS89295700' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]
#     # Click Element    //*[@data-product-sku="CDS89295700"]//button/span[text()='ADD TO BAG']
#     Click Button                    //*[@data-product-sku="CDS89295700"]//button[./span[text()='ADD TO BAG'] ]

#     # step 2.3.4 get last count of bag 


#     ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

#     IF  ${is_cart_count_visible} == ${True}
        
#         # step 2.3.5 Verify that "get count of bag" + 1  == "get last count of bag"
#         ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
#         Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
#     END


#     # ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    # //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']       
#     # IF    ${ver_count_of_cart} == ${True}
#     #       ${ver_cart}     Get Text            //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    #  //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']     
#     # ELSE
#     #       ${ver_cart}     Set Variable    0                                                           # TODO Count of cart
#     # END

# #  =============================================







# # ============================================
#     # ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    # //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']       
#     # IF    ${ver_count_of_cart} == ${True}
#     #       ${ver_cart}     Get Text            //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    #  //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']     
#     # ELSE
#     #       ${ver_cart}     Set Variable    0   #TODO Count of cart
#     # END

#     ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

#     IF  ${is_cart_count_visible} == ${True}
#         Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
#     ELSE
#         ${count_of_bag}    Set Variable    0
#     END



#     # step 2.4.1 Scroll in to this product 
#     # Sleep                                           2s     
#     Scroll Into View                            //*[@class='flip-card-front']//a[text()='Dior Forever Cushion Case Couture Compact for Matte or Glow Foundation Refill Embroidered Cannage']
#     # Scroll Element Into View                    //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]


#     # step 2.4.1.1 Verify that Image is show
#     Page Should Contain Element               //*[@data-product-sku="CDS97098683"]//img
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//img[@src='https://assets.central.co.th//adobe/dynamicmedia/deliver/dm-aid--22dbffb5-4144-449e-87aa-68a28a665c6a/dior-diorforevercushioncasecouturecompactformatteorglowfoundationrefill-cds97098683-1.jpg?quality=85&preferwebp=true&width=199']

#     # step 2.4.1.2 Verify that Price is show
#     Wait Until Element Is Visible                //*[@data-product-sku='CDS97098683']//h4[@class='finalPrice'][text()='฿1,100']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//div[@class='priceBlock' and //h4[text()='฿1,100']]

#     # step 2.4.1.3 Verify that Brand is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS97098683']//a[@class='sliderTitle'][text()= 'DIOR']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//a[@class='sliderTitle' and //a[text()='DIOR']]

#     # step 2.4.1.3 Verify that Name is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS97098683']//a[text()='Dior Forever Cushion Case Couture Compact for Matte or Glow Foundation Refill Embroidered Cannage']

#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//a[@class='sliderDesc' and //a[text()='Dior Forever Cushion Case Couture Compact for Matte or Glow Foundation Refill Embroidered Cannage']]
#     # Mouse Over                                  ${dict_product_page}[wish_list_icon]
#     # Mouse Over                                  //*[@data-product-sku="CDS97098683"]

#     # step 2.4.1.3 Verify that Home Delivery is show
#     Wait Until Element Is Visible               //*[@data-product-sku='CDS97098683']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//span[text()='Home Delivery']


    
#     # step 2.4.2 Mouse Over on product 
#     Mouse Over                                  //*[@data-product-sku="CDS97098683"]
#     # Mouse Over                                  //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]

#     # step 2.4.2.1 Verify that "Wish list" button is show
#     Wait Until Element Is Visible               //*[@data-product-sku="CDS97098683"]//button/label[text()='WISHLIST']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//button[@data-testid='btn-addWishlist-productListCDS97098683' and //button[@aria-label='Add to Wishlist' and //label[text()='WISHLIST']]]

#     # step 2.4.2.2 Verify that "Add to bag" button is show
#     Wait Until Element Is Visible               //*[@data-product-sku="CDS97098683"]//button/span[text()='ADD TO BAG']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//button[@data-testid='btn-addCart-productListCDS97098683' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]


#     # step 2.4.3 Click "Add to bag" button
    
#     # Mouse Over                   //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//button[@data-testid='btn-addWishlist-productListCDS97098683' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]
#     Click Button                                //*[@data-product-sku="CDS97098683"]//button[./span[text()='ADD TO BAG'] ]
#     # Click Button                 //div[@class='sliderItem productCard' and .//a[@href='/en/dior-dior-forever-cushion-case-couture-compact-for-matte-or-glow-foundation-refill-embroidered-cannage-cds97098683']]//button[@data-testid='btn-addCart-productListCDS97098683' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]

#     # step 2.4.4 get last count of bag 
#     # step 2.4.5 Verify that "get count of bag" + 1  == "get last count of bag"

#     ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

#     IF  ${is_cart_count_visible} == ${True}
        
#         # step 2.4.5 Verify that "get count of bag" + 1  == "get last count of bag"
#         ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
#         Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
#     END

#     # ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    # //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']       
#     # IF    ${ver_count_of_cart} == ${True}
#     #       ${ver_cart}     Get Text            //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    #  //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']     
#     # ELSE
#     #       ${ver_cart}     Set Variable    0   #TODO Count of cart
#     # END


# # ============================================