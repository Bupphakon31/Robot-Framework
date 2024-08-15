*** Keywords ***

Open Browser by chrome
    
    Log Variables
    Log     ${TEST_NAME}
    Log     ${Data.Buy_2_Product_Success}
    ${test_data}     Set Variable    ${Data.${TEST_NAME}}
    Log     ${test_data}
    Set Test Variable       ${Test_Data}    ${test_data}

    Log Variables
    Log Environment Variables
    ${Home_Path}     Get Environment Variable        HOMEDRIVE 
    # Log    ${Home_Path}

    # step 1 :Open Browser  https://www.saucedemo.com/
    Open Browser        ${SERVER} 	    ${BROWSER}      
    ...     options=binary_location=r"${Home_Path}\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True)    
    ...     executable_path=${Home_Path}\\chromedriver\\chromedriver.exe
    
    Maximize Browser Window
