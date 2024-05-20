
*** Variables ***  

&{dict_information_page} 
...     title_information=//span[@class='title'][text()='Checkout: Your Information']
...     firstname=//input[@id='first-name']
...     lastname=//input[@id='last-name']
...     potal_code=//input[@id='postal-code']
...     continue_btn=//input[@id='continue']






# ...     Firstname=Bupphakon                 Lastname=Silarat                postode=24160  


*** Keywords ***

#step 6 :Input your informations
Input information and finish

    #step 5.5.1 : Verify that "Checkout: Your Information" is show
    Wait Until Element Is Visible               ${dict_information_page}[title_information]   #//span[@class='title'][text()='Checkout: Your Information']
    #step 5.5.2 Verify that textfield firstname is show
    Wait Until Element Is Visible               ${dict_information_page}[firstname]  #//input[@id='first-name']
    #step 5.5.3 Verify that textfield lastname is show
    Wait Until Element Is Visible               ${dict_information_page}[lastname]  #//input[@id='last-name']
    #step 5.5.4 Verify that textfield Zip/Postal Code is show
    Wait Until Element Is Visible               ${dict_information_page}[potal_code]  #//input[@id='postal-code']

#step 6.1 : input your First Name
    Input Text		                        ${dict_information_page}[firstname]			        ${Test_Data.information.firstname}   #${information}[Firstname]                        #input Firstname

#step 6.1.1 : Verify that input First Name has a value
    Textfield Value Should Be               ${dict_information_page}[firstname]			        ${Test_Data.information.firstname}    #${information}[Firstname]                       #ตรวจสอบว่ามีค่า input Firstname

#step 6.2 : input your Last Name
	Input Text		                        ${dict_information_page}[lastname]					${Test_Data.information.lastname}     #${information}[Lastname]                         #input Lastname

#step 6.2.1 : Verify that input Last Name has a value
    Textfield Value Should Be               ${dict_information_page}[lastname]					${Test_Data.information.lastname}     # ${information}[Lastname]                         #ตรวจสอบว่ามีค่า input Lastname

#step 6.3 : input your Zip/Postal Code
    Input Text		                        ${dict_information_page}[potal_code]  			    ${Test_Data.information.potal_code}    #${information}[postode]                          #input postode

#step 6.3.1 : Verify that input Zip/Postal Code has a value
    Textfield Value Should Be               ${dict_information_page}[potal_code] 		        ${Test_Data.information.potal_code}   # ${information}[postode]                          #ตรวจสอบว่ามีค่า input postode

# #step 6.4 : Click continue button
     Click Element                          ${dict_information_page}[continue_btn]   #//input[@id='continue']			                                                   #click continue


