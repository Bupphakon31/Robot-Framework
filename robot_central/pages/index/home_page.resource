*** Variables ***

&{dict_home_page}
    ...     close_banner=//div[@id='close-button-1454703513202']
    ...     language_dropdown=//div[@class='dropdown' and .//button[@id='siteLangNavbtn']]
    ...     switch_language=//a[@href='https://www.central.co.th/en'][text()='English']
    ...     input_search=//input[@id='autocomplete-0-input' and //input[@placeholder='Search for products and brands']]
    ...     central_logo=//div[@class='logoLayout' and .//img[@src='https://assets.central.co.th/is/content/cenergy/logo-1?$SVGXML$']]
    ...     wish_list_icon=//div[@class='headerWishList' and .//i[@class='icon icon-wish-list']]
    ...     bag_icon=//div[@class='headerCart' and .//i[@class='icon icon-bag']]
    ...     search_box=//div[@id='searchBox' and .//input[@placeholder='Search for products and brands']]

    # ...     search_result_label=//span[@itemprop='name'][text()='Search Result']
    # ...     img_dior=//a[@href='/dior' and //img[@src='/content/dam/cds/brand-search/20220207_Logo_Dior2_d.jpg']]
    # ...     filter_sort_dropdown=//a[@data-testid='mnu-viewSearchFilterOnAllFilter' and .//span[@class='icon icon-material-filter1']]
    # ...     brand_name_filter=//button[@data-testid='btn-viewSearchFilterOnFilterBrand' and //div[@class='ais-Panel-header' and //span[text()='Brand Name']]]
    # ...     color_filter=//button[@data-testid='btn-viewProductFilter-filterColor' and //span[text()='Color']]
    # ...     price_filter=//button[@data-testid='btn-viewProductFilter-filterPrice' and //span[text()='Price']]
    # ...     size_filter=//button[@data-testid='btn-viewProductFilter-filterSize' and //span[text()='Size']]
    # ...     category_filter=//button[@data-testid='btn-viewProductFilter-filterBtn' and //span[text()='Category']]
    # ...     delivery_method_filter=//button[@data-testid='btn-viewProductFilter-filterDelivery' and //span[text()='Delivery Method']]
    # ...     sort_recommended_filter=//button[@data-testid='btn-viewProductFilter-filterSort' and //span[text()='Sort: Recommended']]

*** Keywords ***

Close First Banner
    # step 1.1 close banner when we see it
    Click Element                                   ${dict_home_page}[close_banner]

    # step 1 choose language en
    Click Element                                   ${dict_home_page}[language_dropdown]     
    Click Element                                   ${dict_home_page}[switch_language]  

    # step 1.1 close banner when we see it
    Click Element                                   ${dict_home_page}[close_banner]

Verify URL
   # step 1.2 Verify that https://www.central.co.th/en is show
    ${tempURL}=    Get Location
    Log    URL is ${tempURL}

    Wait Until Location Contains        ${tempURL}
    Wait Until Location Is              ${tempURL}

Verify Input Search
    # step 1.3 Verify that "Search for products and brands" is show
    Wait Until Element Is Visible                   ${dict_home_page}[input_search]   


    # step 2.1 Verify detail of index page
Verify Detail of Index Page

    # step 2.1.1 Verify that Hamberger is show
    # Wait Until Element Is Visible                   //div[@id='hamMenuIcon']

    # step 2.1.2 Verify that Central logo is show
    Wait Until Element Is Visible                     ${dict_home_page}[central_logo]     
    
    # step 2.1.3 Verify that wish list icon is show
    Wait Until Element Is Visible                     ${dict_home_page}[wish_list_icon]     
    # step 2.1.4 Verify that bag icon is show

    Wait Until Element Is Visible                     ${dict_home_page}[bag_icon]     

    # step 2.1.5 verify that Search box is show
    Wait Until Element Is Visible                     ${dict_home_page}[search_box]     

Input Search dior

    # step 2.2 Search "dior" product
    # step 2.2.1 Input "dior" on Search box
    Input Text For Auto Complate                      ${dict_home_page}[input_search]           dior

    # step 2.2.2 Verify that "dior" on Search box
    Textfield Value Should Be                         ${dict_home_page}[input_search]           dior
    # Press keys                                        ${dict_home_page}[input_search]           ENTER

# Verify Page After Search dior
#     # step 2.2.3 Verify that  "Search Result" label is show
#     Wait Until Element Is Visible                     ${dict_home_page}[search_result_label]

#     # step 2.2.4 Verify that "DIOR" image is show
#     Wait Until Element Is Visible                   ${dict_home_page}[img_dior]

#     # step 2.2.5 Verify that "Filter & Sort" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[filter_sort_dropdown]

#     # step 2.2.6 Verify that "Brand Name" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[brand_name_filter]

#     # step 2.2.7 Verify that "Color" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[color_filter]

#     # step 2.2.8 Verify that "Price" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[price_filter]

#     # step 2.2.9 Verify that "Size" button is show
#     Wait Until Element Is Visible                  ${dict_home_page}[size_filter]

#     # step 2.2.10 Verify that "Category" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[category_filter]

#     # step 2.2.10 Verify that "Delivery Method" button is show
#     Wait Until Element Is Visible                  ${dict_home_page}[delivery_method_filter]

#     # step 2.2.10 Verify that "Sort: Recommended" button is show
#     Wait Until Element Is Visible                   ${dict_home_page}[sort_recommended_filter]









# Choose Product La Mousse
#     # step 2.3 Choose product "La Mousse OFF/ON Foaming Cleanser 150 mL"
#     # step 2.3.0 get count of bag

#     ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']       
#     IF    ${ver_count_of_cart} == ${True}
#           ${ver_cart}     Get Text             //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']     
#     ELSE
#           ${ver_cart}     Set Variable    0
#     END

#     # step 2.3.1 Scroll in to this product
#     Scroll Element Into View                    //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]
#     # Scroll Element Into View                     //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700' and //div[@class='priceBlock' and //h4[text()='฿1,845']]]]//a[@class='sliderDesc' and //a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]
    
#     # step 2.3.1.1 Verify that Image is show
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//img[@src='https://assets.central.co.th//adobe/dynamicmedia/deliver/dm-aid--7494a3b5-d149-42e4-b605-893e48a6bdcc/dior-lamousseoffonfoamingcleanser150ml-cds89295700-1.jpg?preferwebp=true&quality=60&width=199']
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700' and //img[@src='https://assets.central.co.th//adobe/dynamicmedia/deliver/dm-aid--7494a3b5-d149-42e4-b605-893e48a6bdcc/dior-lamousseoffonfoamingcleanser150ml-cds89295700-1.jpg?preferwebp=true&quality=60&width=199']]]
    
#     # step 2.3.1.2 Verify that Price is show
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//div[@class='priceBlock' and //h4[text()='฿1,845']]

#     # step 2.3.1.3 Verify that Brand is show
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//a[@class='sliderTitle' and //a[text()='DIOR']]
    
#     # step 2.3.1.3 Verify that Name is show
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//a[@class='sliderDesc' and //a[text()='La Mousse OFF/ON Foaming Cleanser 150 mL']]
#     Mouse Over                                  ${dict_home_page}[wish_list_icon]

#     # step 2.3.1.3 Verify that Home Delivery is show
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//span[text()='Home Delivery']


#     # step 2.3.2 Mouse Over on product
#     Mouse Over                                  //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]
    
#     # step 2.3.2.1 Verify that "Wish list" button is show
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//div[@class='hoverItem' and //button[@aria-label='Add to Wishlist' and //label[text()='WISHLIST']]]
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addWishlist-productListCDS89295700' and //button[@aria-label='Add to Cart' and //label[text()='WISHLIST']]]

#     # step 2.3.2.2 Verify that "Add to bag" button is show
#     # Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//div[@class='hoverItem' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]
#     Wait Until Element Is Visible               //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addCart-productListCDS89295700' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]


#     # step 2.3.3 Click "Add to bag" button
#     Mouse Over                   //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addCart-productListCDS89295700' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]
#     Click Button                 //div[@class='sliderItem productCard' and .//a[@href='/en/dior-la-mousse-offon-foaming-cleanser-150-ml-cds89295700']]//button[@data-testid='btn-addCart-productListCDS89295700' and //button[@aria-label='Add to Cart' and //span[text()='ADD TO BAG']]]


#     # step 2.3.4 get last count of bag 
#     ${ver_count_of_cart}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    # //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']       
#     IF    ${ver_count_of_cart} == ${True}
#           ${ver_cart}     Get Text            //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/span    #  //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']    #  //span[@class='position-absolute translate-middle badge cartCountInHeader d-none']     
#     ELSE
#           ${ver_cart}     Set Variable    0
#     END

#     # step 2.3.5 Verify that "get count of bag" + 1  == "get last count of bag"
#     # ${last_count_of_cart}                   Get Text       //*[@id="container-ab835c7cd9"]/div/div[1]/header/div[2]/div/div/div[4]/div/div[3]/a     # //span[@class='position-absolute translate-middle badge cartCountInHeader rounded-pill']     

#     # Should Be True    ${ver_count_of_cart} + 1 == ${last_count_of_cart}    TODO
