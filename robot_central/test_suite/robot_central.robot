*** Settings ***

# Variables      ${CURDIR}/../test_data/prefs.yaml


Resource         ${CURDIR}/../configs/import.resource



*** Test Cases ***

# Convert_To_List
#     ${result}    Convert To List    dior
#     Log    ${result}

# Format_String_Price
#     ${sub_total}    Evaluate    1845 + 990
#     ${sub_total_with_format}    Format String    ฿{:,}    ${sub_total} 

#     Log    ${sub_total_with_format}

TC_01
    #TC01 : 

    common.Open Browser by chrome
    home_page_keyword.Close Banner
    home_page_keyword.Verify URL
    home_page_keyword.Verify Input Search
    home_page_keyword.Verify Detail of Index Page
    home_page_keyword.Input Search dior
    
    product_page_keyword.Verify Page After Search dior
    # product_page_keyword.Choose Product La Mousse                             test
    # product_page_keyword.Choose Product Dior Forever Cushion                  test
    product_page_keyword.Choose Product La Mousse and Dior Forever Cushion
    product_page_keyword.Click Bag Icon
    # product_page_keyword.Verify Shopping Bag Page


    shopping_cart_page_keyword.Verify Shopping Bag Page
    shopping_cart_page_keyword.Verify Coupons and Voucher
    shopping_cart_page_keyword.Verify Product Pricing
    shopping_cart_page_keyword.Verify Checkout
