*** Settings ***
Library           SeleniumLibrary  


*** Variables ***  

&{information}                              Firstname=Bupphakon                 Lastname=Silarat                postode=24160  


*** Keywords ***

#step 6 :Input your informations
Input information and finish

    #step 5.5.1 : Verify that "Checkout: Your Information" is show
    Wait Until Element Is Visible               //span[@class='title'][text()='Checkout: Your Information']
    #step 5.5.2 Verify that textfield firstname is show
    Wait Until Element Is Visible               //input[@id='first-name']
    #step 5.5.3 Verify that textfield lastname is show
    Wait Until Element Is Visible               //input[@id='last-name']
    #step 5.5.4 Verify that textfield Zip/Postal Code is show
    Wait Until Element Is Visible               //input[@id='postal-code']

#step 6.1 : input your First Name
    Input Text		                        //input[@id='first-name']			        ${information}[Firstname]                        #input Firstname

#step 6.1.1 : Verify that input First Name has a value
    Textfield Value Should Be               //input[@id='first-name']			        ${information}[Firstname]                       #ตรวจสอบว่ามีค่า input Firstname

#step 6.2 : input your Last Name
	Input Text		                        //input[@id='last-name']					${information}[Lastname]                         #input Lastname

#step 6.2.1 : Verify that input Last Name has a value
    Textfield Value Should Be               //input[@id='last-name']					${information}[Lastname]                         #ตรวจสอบว่ามีค่า input Lastname

#step 6.3 : input your Zip/Postal Code
    Input Text		                        //input[@id='postal-code']			        ${information}[postode]                          #input postode

#step 6.3.1 : Verify that input Zip/Postal Code has a value
    Textfield Value Should Be               //input[@id='postal-code']			        ${information}[postode]                          #ตรวจสอบว่ามีค่า input postode

# #step 6.4 : Click continue button
#     Click Element                           //input[@id='continue']			                                                   #click continue


