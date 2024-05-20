# *** Keywords ***

# # Open Browser by chrome

# #     Log Variables
# #     Log Environment Variables
# #     ${Home_Path}     Get Environment Variable        HOMEDRIVE 
# #     # Log    ${Home_Path}

# #     # step 1 :Open Browser  https://www.saucedemo.com/
# #     Open Browser        ${SERVER} 	    ${BROWSER}      
# #     ...     options=binary_location=r"${Home_Path}\\chromedriver\\chrome-win64\\chrome.exe";add_experimental_option("detach", True)    
# #     ...     executable_path=${Home_Path}\\chromedriver\\chromedriver.exe
    
# #     Maximize Browser Window

# Screenshot
#      Set Screenshot Directory    ./screenshot
#      Capture Page Screenshot     test_{index}.png