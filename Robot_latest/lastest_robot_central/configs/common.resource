    
*** Variables ***
&{product_01}    name=La Mousse OFF/ON Foaming Cleanser 150 mL    price=${2050}    qty=1
&{product_02}    name=Dior Homme Intense${SPACE * 2}Eau de Parfum intense 100 mL    price=${5085}    qty=1    #TODO: 20240724 -  2 whitespace
${discount}        ${0}
${count_of_bag}    0

# ${discount}      0


*** Keywords ***

    # Log Variables
    # # Log     ${TEST_NAME}
    # # Log     ${Data.Buy_2_Product_Success}
    # # ${test_data}     Set Variable    ${Data.${TEST_NAME}}
    # # Log     ${test_data}
    # # Set Test Variable       ${Test_Data}    ${test_data}

    # # Log Variables
    # # Log Environment Variables
    # # ${Home_Path}     Get Environment Variable        HOMEDRIVE 

Open Browser by chrome
    
    Open Browser        ${SERVER} 	    ${BROWSER}      
    ...     options=binary_location=r"C:\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True);add_experimental_option("prefs",${prefs});add_argument("--disable-notifications")   
    ...     executable_path=C:\\chromedriver\\chromedriver.exe
    
    Maximize Browser Window


Input Text For Auto Complate
    [Arguments]    ${locator}    ${text}
    ${text_list}    Convert To List    dior

    Input Text    ${locator}   ${text_list}[0]
    FOR    ${index}    IN RANGE   1   len(${text_list})
        Sleep    0.5s
        Input Text    ${locator}   ${text_list}[${index}]    clear=${False}
    END


# Scroll Into View
#     [Arguments]    ${locator} 
#     ${temp_id}    Get Element Attribute    ${locator}    id

#     Assign Id To Element    ${locator}    id=id_for_scroll

#     Execute Javascript    document.querySelector('#id_for_scroll').scrollIntoView({block: "center", inline: "center", behavior: "instant"})

#     Assign Id To Element    ${locator}    ${temp_id}

Scroll Into View
    [Arguments]    ${locator} 
    ${temp_id}    Get Element Attribute    ${locator}    id

    Assign Id To Element    ${locator}    id=id_for_scroll

    Execute Javascript    document.querySelector('#id_for_scroll').scrollIntoView({ behavior: "instant", block: "center", inline: "center" })

    Assign Id To Element    //*[@id='id_for_scroll']    ${temp_id}