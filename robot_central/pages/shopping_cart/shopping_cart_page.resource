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
    Scroll Into View    //section[@id='CDS23369689']

    # step 2.7.1 Verify that brand label is show
    # Wait Until Element Is Visible    //section[@id='CDS23369689']//a[@class='spc-product-card__card-brand-name'][text()='DIOR']
    Element Text Should Be    //section[@id='CDS23369689']//a[@class='spc-product-card__card-brand-name']    DIOR

    # step 2.7.2 Verify that name label is show
    Page Should Contain Element    //section[@id='CDS23369689']//a[starts-with(@class,'spc-product-card__card-nam')][text()='Dior Homme Deodorant stick']

    # step 2.7.3 Verify that price label is show
    ${price_with_format}    Format String    ฿{:,}    ${product_01}[price]
    # Page Should Contain Element    //section[@id='CDS23369689']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿1,305']
    Page Should Contain Element    //section[@id='CDS23369689']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='${price_with_format}']

    # step 2.7.4 Verify that qty label is show
    Element Text Should Be    //section[@id='CDS23369689']//span[starts-with(@class,'spc-product-card__card-quantity')]    1
    

    # step 2.8 Verify that product "Miss Dior Rose N'Roses  Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL" same product list page
    
    # step 2.8.0 Scroll into this product
    Scroll Into View    //section[@id='CDS70346923']

    # step 2.8.1 Verify that brand label is show
    Element Text Should Be    //section[@id='CDS70346923']//a[@class='spc-product-card__card-brand-name']    DIOR

    # step 2.8.2 Verify that name label is show
    Page Should Contain Element    //section[@id='CDS70346923']//a[starts-with(@class,'spc-product-card__card-nam')][text()="Miss Dior Rose N'Roses \ Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.8.3 Verify that price label is show
    ${price_with_format}    Format String    ฿{:,}    ${product_02}[price]
    # Page Should Contain Element    //section[@id='CDS70346923']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿1,935']
    Page Should Contain Element    //section[@id='CDS70346923']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='${price_with_format}']

    # step 2.8.4 Verify that qty label is show
    Element Text Should Be    //section[@id='CDS70346923']//span[starts-with(@class,'spc-product-card__card-quantity')]    1

    
    # step 2.9.1 Scroll into "Free Gifts and Gift Wrapping" label
    # Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
    Scroll Into View    //section[@class='spc-section-title']//h3[text()='Free Gifts and Gift Wrapping']

    # step 2.10 Verify that "2 Free gift(s) with this order" section
    Wait Until Element Is Visible    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__gift-count'][text()='2']
    Page Should Contain Element    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Free gift(s) with this order']

    # step 2.11 Verify that "Gift Wrapping Available" section
    Page Should Contain Element    //section[@id='giftWrappingBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Gift Wrapping Available']


    # step 2.12 Verify that "You may also like" label is show
    Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
    Wait Until Element Is Visible    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']

    # step 2.12.1 Scroll into "Easy Returns" label
    Scroll Into View      //*[@id='spcCouponsPricing']//p[@class='spc-feature-list-item__redeem-title'][normalize-space(.)='You can earn 130 Points']             #TODO: 20240724 - Dynamic data

    # step 2.13 Verify that "You can earn 130 Points"
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//p[@class='spc-feature-list-item__redeem-title'][normalize-space(.)='You can earn 130 Points']    #TODO: 20240724 - Dynamic data


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
    # Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[text()='Sub Total (${count_of_bag_with_format})']     # TODO 23072024  hard code item total   befor
    Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[text()='Sub Total (2 Items)']                           # TODO 23072024  hard code item total   after


    # step 2.16.2 sub total = product price + product price
    ${sub_total}    Evaluate    ${product_01}[price] + ${product_02}[price]
    ${sub_total_with_format}    Format String    ฿{:,}    ${sub_total} 
    
 
    # step 2.16.3 Verify that "Sub Total (2 Items)" value = sub total
    # //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]/div[normalize-space(.)='฿2,835']
    # Scroll Into View                //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]

    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (${count_of_bag_with_format})']]/div[normalize-space(.)='${sub_total_with_format}']           # TODO 23072024  hard code item total  and price total     befor
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]/div[normalize-space(.)='฿3,240']                                                   # TODO 23072024  hard code item total  and price total     after

    # step 2.16.4.1 Verify that "Discount" label   
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(text())='Discount']

    # step 2.16.4.2 Verify that "Discount" value

    
    # ${discount_with_format}    Format String   ฿{:,}    ${discount}
    ${discount_with_format}    Format String    ฿   ${discount}

    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(.)='฿0']
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(.)='${discount_with_format}']

    # step 2.16.5 Verify that "Congratulation! You get FREE Standard Delivery" label
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[.='Congratulation! You get FREE Standard Delivery']]

    # step 2.16.6 Verify that "Order Total incl. VAT" label 
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__order-total-text'][text()='Order Total']
   
    Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__incl-tax-text'][text()='incl. VAT']

    # step 2.16.7 order total = sub total + discount

    # ${order_total}    Evaluate   ${sub_total} +  ${discount}                                          # TODO 23072024  hard code order_total     befor
    ${order_total}    Evaluate   ${sub_total} +  ${discount}                                            # TODO 23072024  hard code order_total     after
    ${order_total_with_format}    Format String    ฿{:,}    ${order_total}
    ${order_total_without_Symbol_format}    Format String    {:,}    ${order_total}

    # step 2.16.8 Verify that "Order Total incl. VAT" value = order total   
    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='฿2,835']
    # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='${order_total_with_format}']
    Wait Until Element Contains     //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='${order_total_with_format}']



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
    Wait Until Location Is    //span[text()='Back to shopping bag']
    Wait Until Element Is Visible    //h2[normalize-space(text())='Secure Checkout']





































































































# Verify Shopping Bag Page

    # # Sleep       2s  
    # # step 2.5.1 Verify that "Shopping Bag" title is show
    # # Wait Until Element Is Visible                //button[@data-testid='btn-viewCart-shoppingBagBackBtn' and //h2[@class='col spc-modal-header__modal-title' and //h2[text()='Shopping Bag']]]  
    # Wait Until Element Is Visible                   xpath=/html/body/div[2]/div/div/div/div[1]/div/div[1]/div[1]/div[3]/section/h2                 

    # # step 2.6 Verify that "Sold by Central Department Store" label is show
    # Wait Until Element Is Visible                //p[text()='Sold by ']//a[text()='Central Department Store']
    
    # # step 2.7 Verify that product "La Mousse OFF/ON Foaming Cleanser 150 mL" same product list page                        #TODO Verify that product
    # # step 2.7.1 Verify that brand label is show
    # # step 2.7.2 Verify that name label is show
    # # step 2.7.3 Verify that price label is show
    # # step 2.7.4 Verify that qty label is show

    # # step 2.8 Verify that product "Dior Forever Cushion Case Couture Compact for Matte or Glow Foundation Refill Embroidered Cannage" same product list page           #TODO Verify that product
    # # step 2.8.1 Verify that brand label is show
    # # step 2.8.2 Verify that name label is show
    # # step 2.8.3 Verify that price label is show
    # # step 2.8.4 Verify that qty label is show


    # # step 2.8.5 Scroll in to "You may also like" label
    # Scroll Element Into View                    //h2[@class='product-carousel__title'][text()='You may also like']
    #                                         # //section[@class='product-carousel prod-carousel'and //h2[@class='product-carousel__title'][text()='You may also like']]]
    #                                         # //section[@class='product-carousel prod-carousel'and //h2[@class='product-carousel__title'and //h2[text()='You may also like']]]
    # # step 2.9 Verify that "Free Gifts and Gift Wrapping" label
    # Wait Until Element Is Visible               //h3[@class='spc-section-title__title'][text()='Free Gifts and Gift Wrapping']

    # # step 2.10 Verify that "2 Free gift(s) with this order" section
    # Wait Until Element Is Visible               //section[@id='freeGiftsBtn']

    # # step 2.11 Verify that "Gift Wrapping Available" section
    # Wait Until Element Is Visible               //section[@id='giftWrappingBtn']
    
    # # step 2.12 Verify that "You may also like" label is show
    # Wait Until Element Is Visible               //h2[@class='product-carousel__title'][text()='You may also like']


    # # step 2.12.1 Scroll in to "Easy Returns" label
    # Wait Until Element Is Visible               //*[@id="spcCouponsPricing"]/section[3]/div[1]/span        #TODO XPATH

    # # //div[@class='spc-quality-badges__badges' and //img[@src='https://assets.central.co.th/adobe/dynamicmedia/deliver/dm-aid--4b398d4d-f6aa-4ba6-8584-edbbacca24b8/shopping-bag-return-arrow-left.png?preferwebp=true&quality=85' and //span[text()='Easy Returns']]]
    # # //div[@id='installationServices']
    # # //div[@class='spc-quality-badges__badges']
    # # //section[@class='d-flex justify-content-center spc-quality-badges spc-mb-44']

    # # step 2.13 Verify that "You can earn 126 Points"
    # Wait Until Element Is Visible               //p[@class='spc-feature-list-item__redeem-title' and //p[text()]]//span[text()='126 Points']



# Verify Coupons and Voucher

    # # step 2.14 Verify that "Coupons and Vouchers" 
    # # step 2.14.1 Verify that "Coupons and Vouchers" label
    # Wait Until Element Is Visible               //h3[@class='spc-section-title__title'][text()='Coupons and Vouchers']

    # # step 2.14.2 Verify that "Coupon code" input
    # Wait Until Element Is Visible               //input[@id='couponTxt' and //input[@placeholder='Enter a coupon code']]

    # # step 2.14.3 Verify that "Apply" button 
    # Wait Until Element Is Visible               //button[@data-testid='btn-addCart-applyCoupon'][text()='Apply']

    # # step 2.15 Verify that "Easy Returns"
    # # step 2.15.1 Verify that "Easy Returns" icon
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[1]/img           #TODO XPATH      //div[@class='spc-quality-badges__badges' and //img[@alt='Easy Returns']]
    # # step 2.15.2 Verify that "Easy Returns" label
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[1]/span          #TODO XPATH
    # # //*[@id='spcCouponsPricing']/section[3]//span[text()='มั่นใจในคุณภาพ']


    # # step 2.15 Verify that "Quality Assured"
    # # step 2.15.1 Verify that "Quality Assured" icon
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[2]/img          #TODO XPATH
    # # step 2.15.2 Verify that "Quality Assured" label
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[2]/span         #TODO XPATH


    # # step 2.15 Verify that "Original Brands"
    # # step 2.15.1 Verify that "Original Brands" icon
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[3]/img              #TODO XPATH
    # # step 2.15.2 Verify that "Original Brands" label
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[3]/span             #TODO XPATH


    # # step 2.15 Verify that "Best Prices"
    # # step 2.15.1 Verify that "Best Prices" icon
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[4]/img              #TODO XPATH
    # # step 2.15.2 Verify that "Best Prices" label
    # Wait Until Element Is Visible                   //*[@id="spcCouponsPricing"]/section[3]/div[4]/span             #TODO XPATH


# Verify Product Pricing

#     # step 2.16 Verify that "Product Pricing"
#     # step 2.16.1 Verify that "Sub Total (2 Items)" label    # 2 Items
#     Wait Until Element Is Visible                   //div[@class='col-8'][text()='Sub Total (2 Items)']


#     # step 2.16.2 sub total = product price + product price                             # TODO product + product
    
#     # step 2.16.3 Verify that "Sub Total (2 Items)" value = sub total                   # TODO Sub Total (2 Items) value = sub total


#     # step 2.16.3 Verify that "Discount" label   
#     Wait Until Element Is Visible                   //div[@id='discountAccordion'][text()]

#     # step 2.16.4 Verify that "Discount" value                                          # TODO  Discount value


#     # step 2.16.5 Verify that "Congratulation! You get FREE Standard Delivery" label
#     Wait Until Element Is Visible                   //div[@class='col-9 spc-product-pricing__express-delivery' and //div[text()='Congratulation! You get ' and //b[text()='FREE' and //div[text()=' Standard Delivery']]]]

#     # step 2.16.6 Verify that "Order Total incl. VAT" label   
#     Wait Until Element Is Visible                   //span[text()='Order Total' and //span[text()='incl. VAT']]

#     # step 2.16.7 order total = sub total + discount                                        # TODO  sub total + discount

#     # step 2.16.8 Verify that "Order Total incl. VAT" value = order total                   # TODO  "Order Total incl. VAT" value = order total 



# Verify Checkout

#     # step 2.17 Verify that "Checkout"
#     # step 2.17.1 Verify that "Checkout" button                 
#     Wait Until Element Is Visible                   xpath=/html/body/div[2]/div/div/div/div[1]/div/div[1]/div[1]/div[3]/div[4]/section/div/a/span/span[1]               #TODO XPATH

#     # step 2.17.2 Verify that "Checkout" value  = order total                               # TODO  "Checkout" value  = order total 
