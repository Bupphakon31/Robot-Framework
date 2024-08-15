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



Click Bag Icon
    # step 2.5 Click Bag icon
    Click Element                                   //a[@data-testid='btn-viewCart-bag']
    # Wait Until Page Contains        Shopping Bag
    Wait Until Page Contains Element               //h2[text()='Shopping Bag']                  


