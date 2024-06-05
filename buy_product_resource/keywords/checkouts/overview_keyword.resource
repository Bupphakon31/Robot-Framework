*** Keywords ***

Verify Checkouts page and click finish
    overview_page.Verify Checkouts Label And Cart       
    overview_page.Verify Product Same Product List      &{Test_Data.verify_overview_page.data_test.expected_data.sauce_labs_backpack}
    overview_page.Verify Product Same Product List      &{Test_Data.verify_overview_page.data_test.expected_data.sauce_labs_fleece_jacket}
    overview_page.Verify All Payment Label              ${Test_Data.verify_overview_page.data_test.expected_data}
    overview_page.Click Finish Button