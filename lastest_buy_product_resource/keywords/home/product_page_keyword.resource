*** Keywords ***

Verify that page and Add product to cart

    product_page.Verify Product Page
    product_page.Filter Product
    product_page.Add Product To Cart  
    ...     ${Test_Data.verify_product_page.input_data.sauce_labs_backpack.title}
    ...     ${Test_Data.verify_product_page.input_data.sauce_labs_backpack.price}

    product_page.Add Product To Cart   
    ...     ${Test_Data.verify_product_page.input_data.sauce_labs_fleece_jacket.title}
    ...     ${Test_Data.verify_product_page.input_data.sauce_labs_fleece_jacket.price}