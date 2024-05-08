*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn


*** Variables ***
&{Login}                                    username=standard_user              password=secret_sauce


*** Keywords ***

Verify Login Page

#step 1.1 : Verify page title  Swag labs is show
    Wait Until Page Contains Element        //div[@class='login_logo'][text()='Swag Labs']
#step 1.2 : Verify textfield Username is show
    Wait Until Element Is Visible           //input[@id='user-name']
#step 1.3 : Verify textfield Username is show
    Wait Until Element Is Visible           //input[@id='password']
#step 1.4 : Verify login button is show
    Page Should Contain Button              //input[@id='login-button']


#step 2 :Login
Login
#step 2.1 : input your Username
    Input Text		                        //input[@id='user-name']			${Login}[username]                                     #input username

#step 2.1.1 : Verify that input Username has a value
    Textfield Value Should Be               //input[@id='user-name']            ${Login}[username]

# #step 2.2 : input your Password
    Input Text		                        //input[@id='password']				${Login}[password]                                     #input password

#step 2.2.1 : Verify that input Username has a value
    Textfield Value Should Be               //input[@id='password']            ${Login}[password]

# #step 2.3 : Click login button
#     Click Element			                //input[@type='submit']
