
*** Variables ***

&{dict_login_page}
    ...     login_logo=//div[@class='login_logo'][text()='Swag Labs']
    ...     username_input=//input[@id='user-name']
    ...     password_input=//input[@id='password']
    ...     login_button=//input[@id='login-button']



# &{Login}                                    username=standard_user              password=secret_sauce

*** Keywords ***

Login


# Verify Login Page

#step 1.1 : Verify page title  Swag labs is show
    Wait Until Page Contains Element        ${dict_login_page}[login_logo]
#step 1.2 : Verify textfield Username is show
    Wait Until Element Is Visible           ${dict_login_page}[username_input]
#step 1.3 : Verify textfield Username is show
    Wait Until Element Is Visible           ${dict_login_page}[password_input]
#step 1.4 : Verify login button is show
    Page Should Contain Button              ${dict_login_page}[login_button]

#step 2 :Login
# Input Login
#step 2.1 : input your Username
    # Input Text		                        ${dict_login_page}[username_input]			${Data.TC01.user.username}                                    #input username
    Input Text		                        ${dict_login_page}[username_input]			${Test_Data.user.username}                                    #input username




#step 2.1.1 : Verify that input Username has a value
    Textfield Value Should Be               ${dict_login_page}[username_input]          ${Test_Data.user.username}

# #step 2.2 : input your Password
    Input Text		                        ${dict_login_page}[password_input]			${Test_Data.user.pwd}                                    #input password

#step 2.2.1 : Verify that input Username has a value
    Textfield Value Should Be               ${dict_login_page}[password_input]          ${Test_Data.user.pwd}    

# #step 2.3 : Click login button
    Click Element			                ${dict_login_page}[login_button]
#     Click Element			                //input[@type='submit']
