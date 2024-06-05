*** Variables ***  

&{dict_complete_page} 
...     title_Complete=//span[@class='title'][text()='Checkout: Complete!'] 
...     image=//img[@data-test='pony-express']
...     complete_header=//h2[@class='complete-header'][text()='Thank you for your order!'] 
...     back_home_btn=//button[@id='back-to-products'][text()='Back Home']


*** Keywords ***

#step 8 :Verify that thank you page
Verify thank you page

    #step 8.1 : Verify that “Checkout: Complete!” is show
    Wait Until Element Is Visible           ${dict_complete_page}[title_Complete]   

    #step 8.2 : Verify that image is show
    Wait Until Element Is Visible           ${dict_complete_page}[image]  

    #step 8.3 : Verify that “Thank you for your order!” is show
    Wait Until Element Is Visible           ${dict_complete_page}[complete_header]   

    #step 8.4 : Verify that Back Home button is show on page
    Wait Until Element Is Visible           ${dict_complete_page}[back_home_btn]   