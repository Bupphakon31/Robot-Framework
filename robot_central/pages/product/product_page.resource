*** Variables ***

&{dict_product_page}
    ...     wish_list_icon=//div[@class='headerWishList' and .//i[@class='icon icon-wish-list']]

    ...     search_result_label=//span[@itemprop='name'][text()='Search Result']
    ...     img_dior=//div[@id='bannerImageView' and //a[@href='/en/dior']]
    ...     filter_sort_dropdown=//a[@data-testid='mnu-viewSearchFilterOnAllFilter' and .//span[@class='icon icon-material-filter1']]
    ...     brand_name_filter=//button[@data-testid='btn-viewSearchFilterOnFilterBrand' and //div[@class='ais-Panel-header' and //span[text()='Brand Name']]]
    ...     color_filter=//button[@data-testid='btn-viewProductFilter-filterColor' and //span[text()='Color']]
    ...     price_filter=//button[@data-testid='btn-viewProductFilter-filterPrice' and //span[text()='Price']]
    ...     size_filter=//button[@data-testid='btn-viewProductFilter-filterSize' and //span[text()='Size']]
    ...     category_filter=//button[@data-testid='btn-viewProductFilter-filterBtn' and //span[text()='Category']]
    ...     delivery_method_filter=//button[@data-testid='btn-viewProductFilter-filterDelivery' and //span[text()='Delivery Method']]
    ...     sort_recommended_filter=//button[@data-testid='btn-viewProductFilter-filterSort' and //span[text()='Sort: Recommended']]


# ${count_of_bag}    0


*** Keywords ***

Verify Page After Search dior
    # step 2.2.3 Verify that  "Search Result" label is show
    # Sleep                                            2s
    Wait Until Element Is Visible                   ${dict_product_page}[search_result_label]       10s

    # step 2.2.4 Verify that "DIOR" image is show
    Wait Until Element Is Visible                   ${dict_product_page}[img_dior]     

    # step 2.2.5 Verify that "Sort By:Recommended" button is show
    # Wait Until Element Is Visible               //div[@id='dynamic-widgets-main--sort-by' and //span[text()='Sort By:']]//span[text()='Recommended']         timeout=15s 
    Wait Until Element Is Visible               //div[@class='search-overflow sort-value' and //span[text()='Sort By:']]//span[text()='Recommended']
    # step 2.2.6 Verify that "Brand Name" button is show
#     Wait Until Element Is Visible                   ${dict_product_page}[brand_name_filter]     #TODO  Edit because  Web Update

    # step 2.2.7 Verify that "Color" button is show
    Wait Until Element Is Visible                     //div[@id='dynamic-widget--filter-main-color_group' and //button[text()='Color']]

    # step 2.2.8 Verify that "Price" button is show
    Wait Until Element Is Visible                   //div[@id='dynamic-widget--filter-main-final_price' and //button[text()='Price']]

    # step 2.2.9 Verify that "Size" button is show
    Wait Until Element Is Visible                   //div[@id='dynamic-widget--filter-main-size' and //button[text()='Size']]

    # step 2.2.10 Verify that "Gender" button is show
    Wait Until Element Is Visible                   //div[@id='dynamic-widget--filter-main-gender' and //button[text()='Gender']]

    # step 2.2.10 Verify that "Category" button is show
    Wait Until Element Is Visible                   //div[@id='dynamic-widget--filter-main-category_uids' and //button[text()='Categories']]

    # step 2.2.10 Verify that "Delivery Method" button is show
    # Wait Until Element Is Visible               //button[@data-testid='btn-viewProductFilter-filterDelivery' and //div[@class='ais-Panel-header' and //span[text()='Delivery Method']]]

    # step 2.2.10 Verify that "All Filters" button is show
    Wait Until Element Is Visible                   //a[@class='SearchFilters__StyledAllFilterButton-sc-1lw6ol3-1 fcgUke filter-toggle']//span[normalize-space(text())='All Filters']\

    # //a[@class='SearchFilters__StyledAllFilterButton-sc-1lw6ol3-1 fcgUke filter-toggle']








# Choose Product La Mousse              test

Choose Product La Mousse and Dior Forever Cushion

 # step 2.3 Choose product "La Mousse OFF/ON Foaming Cleanser 150 mL"
 # step 2.3.0 get count of bag
    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    ELSE
        ${count_of_bag}    Set Variable    0
    END
    
    # step 2.3.1 Scroll in to this product
    Scroll Into View         //*[@class='flip-card-front']//a[text()='Dior Homme Deodorant stick']

    # step 2.3.1.1 Verify that Image is show
    Page Should Contain Element    //*[@data-product-sku="CDS23369689"]//img
    
    # step 2.3.1.2 Verify that Price is show
    # Element Should Be Visible    //*[@data-product-sku='CDS23369689']//h4[@class='finalPrice'][text()='฿1,305']

    ${price_with_format}    Format String    ฿{:,}    ${product_01}[price]
    Element Should Be Visible    //*[@data-product-sku='CDS23369689']//h4[@class='finalPrice'][text()='${price_with_format}']
    
    # step 2.3.1.3 Verify that Brand is show
    Element Should Be Visible    //*[@data-product-sku='CDS23369689']//a[@class='sliderTitle'][text()= 'DIOR']
    Element Text Should Be       //*[@data-product-sku='CDS23369689']//a[@class='sliderTitle']    DIOR

    # step 2.3.1.3 Verify that Name is show
    Element Should Be Visible    //*[@data-product-sku='CDS23369689']//a[text()='Dior Homme Deodorant stick']
    

    # step 2.3.1.3 Verify that Home Delivery is show
    Element Should Be Visible    //*[@data-product-sku='CDS23369689']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']
    
    # step 2.3.2 Mouse Over on product 
    Mouse Over    //*[@data-product-sku="CDS23369689"]

    # step 2.3.2.1 Verify that "Wish list" button is show
    Wait Until Element Is Visible    //*[@data-product-sku="CDS23369689"]//button/label[text()='WISHLIST']

    # step 2.3.2.2 Verify that "Add to bag" button is show
    Element Should Be Visible    //*[@data-product-sku="CDS23369689"]//button/span[text()='ADD TO BAG']


    # step 2.3.3 Click "Add to bag" button
    # Click Element    //*[@data-product-sku="CDS23369689"]//button/span[text()='ADD TO BAG']
    Click Button    //*[@data-product-sku="CDS23369689"]//button[./span[text()='ADD TO BAG'] ]

    # step 2.3.4 get last count of bag 

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        
        # step 2.3.5 Verify that "get count of bag" + 1  == "get last count of bag"
        ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    END




# Choose Product Dior Forever Cushion       test

    #-------------------------------------------
     # step 2.4 Choose product "Miss Dior Rose N'Roses  Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL"
    # step 2.4.0 get count of bag

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 
    ELSE
        ${count_of_bag}    Set Variable    0
    END

    # step 2.4.1 Scroll in to this product
    Scroll Into View         //*[@class='flip-card-front']//a[text()="Miss Dior Rose N'Roses \ Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.4.1.1 Verify that Image is show
    Page Should Contain Element    //*[@data-product-sku="CDS70346923"]//img

    # step 2.4.1.2 Verify that Price is show

    ${price_with_format}    Format String    ฿{:,}    ${product_02}[price]
    # Element Should Be Visible    //*[@data-product-sku='CDS70346923']//h4[@class='finalPrice'][text()='฿1,935']
    Element Should Be Visible    //*[@data-product-sku='CDS70346923']//h4[@class='finalPrice'][text()='${price_with_format}']

    # step 2.4.1.3 Verify that Brand is show
    Element Should Be Visible    //*[@data-product-sku='CDS70346923']//a[@class='sliderTitle'][text()= 'DIOR']

    # step 2.4.1.3 Verify that Name is show
    Element Should Be Visible    //*[@data-product-sku='CDS70346923']//a[text()="Miss Dior Rose N'Roses \ Eau de Toilette Roller-Pearl - Roll-On Fragrance 20 mL"]    #TODO: 20240724 -  2 whitespace

    # step 2.4.1.3 Verify that Home Delivery is show
    Element Should Be Visible    //*[@data-product-sku='CDS70346923']//span[contains(@class,'home-delivery-badge')][text()='Home Delivery']

    # step 2.4.2 Mouse Over on product 
    Mouse Over    //*[@data-product-sku="CDS70346923"]

    # step 2.4.2.1 Verify that "Wish list" button is show
    Wait Until Element Is Visible    //*[@data-product-sku="CDS70346923"]//button/label[text()='WISHLIST']

    # step 2.4.2.2 Verify that "Add to bag" button is show
    Element Should Be Visible    //*[@data-product-sku="CDS70346923"]//button/span[text()='ADD TO BAG']

    # step 2.4.3 Click "Add to bag" button
    Click Button    //*[@data-product-sku="CDS70346923"]//button[./span[text()='ADD TO BAG'] ]

    # step 2.4.4 get last count of bag 

    ${is_cart_count_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')]    timeout=5s

    IF  ${is_cart_count_visible} == ${True}
        
        # step 2.4.5 Verify that "get count of bag" + 1  == "get last count of bag"
        ${count_of_bag}    Evaluate    ${count_of_bag} + ${product_01}[qty]
        Wait Until Element Is Visible    //span[contains(@class, 'cartCountInHeader')][text()='${count_of_bag}'] 

    END

    #-------------------------------------------



Click Bag Icon
    # step 2.5 Click Bag icon
    Click Element                                   //a[@data-testid='btn-viewCart-bag']
    # Wait Until Page Contains        Shopping Bag
    Wait Until Page Contains Element               //h2[text()='Shopping Bag']                  


# Verify Shopping Bag Page


#     Wait Until Element Is Visible    //section[.//a[@data-testid='lnk-viewCart-SellerCentral Department Store'] and .//p[.='Sold by Central Department Store']]
        
#     # step 2.7 Verify that product "La Mousse OFF/ON Foaming Cleanser 150 mL" same product list page
#     # step 2.7.0 Scroll into this product
#     Scroll Into View    //section[@id='CDS13060404']

#     # step 2.7.1 Verify that brand label is show
#     # Wait Until Element Is Visible    //section[@id='CDS89295700']//a[@class='spc-product-card__card-brand-name'][text()='DIOR']
#     Element Text Should Be    //section[@id='CDS13060404']//a[@class='spc-product-card__card-brand-name']    DIOR

#     # step 2.7.2 Verify that name label is show
#     Page Should Contain Element    //section[@id='CDS13060404']//a[starts-with(@class,'spc-product-card__card-nam')][text()='Lip Sugar Scrub Self-vanishing sweet exfoliating lip balm - color awakening']

#     # step 2.7.3 Verify that price label is show
#     Page Should Contain Element    //section[@id='CDS13060404']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿1,485']

#     # step 2.7.4 Verify that qty label is show
#     Element Text Should Be    //section[@id='CDS13060404']//span[starts-with(@class,'spc-product-card__card-quantity')]    1
    

#     # step 2.8 Verify that product "Dior Forever Cushion Case Couture Compact for Matte or Glow Foundation Refill Embroidered Cannage" same product list page
    
#     # step 2.8.0 Scroll into this product
#     Scroll Into View    //section[@id='CDS10172049']

#     # step 2.8.1 Verify that brand label is show
#     Element Text Should Be    //section[@id='CDS10172049']//a[@class='spc-product-card__card-brand-name']    DIOR

#     # step 2.8.2 Verify that name label is show
#     Page Should Contain Element    //section[@id='CDS10172049']//a[starts-with(@class,'spc-product-card__card-nam')][text()='Miss Dior Eau de Parfum Mini Miss Solid Perfume Alcohol-Free Fragrance Stick 3.2 g']

#     # step 2.8.3 Verify that price label is show
#     Page Should Contain Element    //section[@id='CDS10172049']//*[@class='spc-product-card__card-price-wrap']/*[starts-with(@class,'spc-product-card__card-price')][normalize-space(.)='฿2,970']

#     # step 2.8.4 Verify that qty label is show
#     Element Text Should Be    //section[@id='CDS10172049']//span[starts-with(@class,'spc-product-card__card-quantity')]    1

    
#     # step 2.9.1 Scroll into "Free Gifts and Gift Wrapping" label
#     # Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
#     Scroll Into View    //section[@class='spc-section-title']//h3[text()='Free Gifts and Gift Wrapping']

#     # step 2.10 Verify that "2 Free gift(s) with this order" section
#     Wait Until Element Is Visible    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__gift-count'][text()='2']
#     Page Should Contain Element    //section[@id='freeGiftsBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Free gift(s) with this order']

#     # step 2.11 Verify that "Gift Wrapping Available" section
#     Page Should Contain Element    //section[@id='giftWrappingBtn']/span[@class='spc-feature-list-item__list-label'][normalize-space(text())='Gift Wrapping Available']


#     # step 2.12 Verify that "You may also like" label is show
#     Scroll Into View    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']
#     Wait Until Element Is Visible    //*[@id='spcPersonalizedProductSlider']//h2[text()='You may also like']

#     # step 2.12.1 Scroll into "Easy Returns" label
#     Scroll Into View    //*[@id='spcCouponsPricing']

#     # step 2.13 Verify that "You can earn 114 Points"
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//p[@class='spc-feature-list-item__redeem-title'][normalize-space(.)='You can earn 114 Points']


# # Verify Coupons and Voucher


#     # step 2.14 Verify that "Coupons and Vouchers" 
#     # step 2.14.1 Verify that "Coupons and Vouchers" label
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//h3[@class='spc-section-title__title'][text()='Coupons and Vouchers']

#     # step 2.14.2 Verify that "Coupon code" input
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//input[@data-testid='txt-formCart-applyCoupon'][@placeholder='Enter a coupon code']

#     # step 2.14.3 Verify that "Apply" button 
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//button[@data-testid='btn-addCart-applyCoupon'][text()='Apply']

#     # step 2.15 Verify that "Easy Returns"

#     # step 2.15.0 Scroll Into Easy Returns label
#     Scroll Into View    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Easy Returns']

#     # step 2.15.1 Verify that "Easy Returns" icon
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Easy Returns']

#     # step 2.15.2 Verify that "Easy Returns" label
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Easy Returns']


#     # step 2.15 Verify that "Quality Assured"
#     # step 2.15.1 Verify that "Quality Assured" icon
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Quality Assured']

#     # step 2.15.2 Verify that "Quality Assured" label
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Quality Assured']
    

#     # step 2.15 Verify that "Original Brands"
#     # step 2.15.1 Verify that "Original Brands" icon
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Original Brands']

#     # step 2.15.2 Verify that "Original Brands" label
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Original Brands']


#     # step 2.15 Verify that "Best Prices"
#     # step 2.15.1 Verify that "Best Prices" icon
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/img[@alt='Best Prices']

#     # step 2.15.2 Verify that "Best Prices" label
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//*[contains(@class,'spc-quality-badges__badges')]/span[text()='Best Prices']



# # Verify Product Pricing

# # step 2.16 Verify that "Product Pricing"

#     # step 2.16.0 Scroll into Sub Total (2 Items)
#     Scroll Into View    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__order-total-text'][text()='Order Total']

#     # step 2.16.1 Verify that "Sub Total (2 Items)" label    # 2 Items
#     Wait Until Element Is Visible    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[text()='Sub Total (2 Items)']

#     # step 2.16.2 sub total = product price + product price
#     ${sub_total}    Evaluate    1485 + 2970
#     ${sub_total_with_format}    Format String    ฿{:,}    ${sub_total} 
    
 
#     # step 2.16.3 Verify that "Sub Total (2 Items)" value = sub total
#     # //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]/div[normalize-space(.)='฿2,835']
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[text()='Sub Total (2 Items)']]/div[normalize-space(.)='${sub_total_with_format}']

#     # step 2.16.4.1 Verify that "Discount" label   
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(text())='Discount']

#     # step 2.16.4.2 Verify that "Discount" value
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//*[@id='discountAccordion']//*[normalize-space(.)='฿0']

#     # step 2.16.5 Verify that "Congratulation! You get FREE Standard Delivery" label
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//*[.='Congratulation! You get FREE Standard Delivery']]

#     # step 2.16.6 Verify that "Order Total incl. VAT" label 
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__order-total-text'][text()='Order Total']
    
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']//span[@class='spc-product-pricing__incl-tax-text'][text()='incl. VAT']

#     # step 2.16.7 order total = sub total + discount
#     ${order_total}    Evaluate   ${sub_total} + 0 
#     ${order_total_with_format}    Format String    ฿{:,}    ${sub_total} 
#     ${order_total_without_Symbol_format}    Format String    {:,}    ${sub_total}

#     # step 2.16.8 Verify that "Order Total incl. VAT" value = order total   
#     # Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='฿2,835']
#     Page Should Contain Element    //*[@id='spcCouponsPricing']//section[@class='spc-product-pricing']/*[.//span[text()='Order Total']]/*[normalize-space(.)='${order_total_with_format}']



# # Verify Checkout

# # step 2.17 Verify that "Checkout"
#     # step 2.17.1 Verify that "Checkout" button
#     Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]

#     # step 2.17.2 Verify that "Checkout" value  = order total
#     # Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]//span[@id='spcBagGrandTotal'][text()='2,835']
#     Page Should Contain Element    //a[@data-testid='btn-saveCart-checkout' and .//span[text()='Checkout']]//span[@id='spcBagGrandTotal'][text()='${order_total_without_Symbol_format}']

