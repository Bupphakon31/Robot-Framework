*** Keywords ***

Checkout Page
    your_cart_page.Click Cart Icon
    your_cart_page.Verify Your Cart Page And Product Same Product List     &{Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_backpack}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_backpack.title}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_backpack.price}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_backpack.qty}

    your_cart_page.Verify Your Cart Page And Product Same Product List     &{Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_fleece_jacket}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_fleece_jacket.title}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_fleece_jacket.price}
    # ...     ${Test_Data.verify_your_cart_page.data_test.expected_data.sauce_labs_fleece_jacket.qty}

    your_cart_page.Click Checkout Button
