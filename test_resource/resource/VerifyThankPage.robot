*** Settings ***
Library           SeleniumLibrary  

*** Keywords ***

#step 8 :Verify that thank you page
Verify thank you page
    #step 8.1 : Verify that “Checkout: Complete!” is show
    Wait Until Element Is Visible           //span[@class='title'][text()='Checkout: Complete!'] 

    #step 8.2 : Verify that image is show
    Wait Until Element Is Visible           //img[@data-test='pony-express']


    #step 8.3 : Verify that “Thank you for your order!” is show
    Wait Until Element Is Visible           //h2[@class='complete-header'][text()='Thank you for your order!'] 

    #step 8.4 : Verify that Back Home button is show on page
    Wait Until Element Is Visible           //button[@id='back-to-products'][text()='Back Home'] 