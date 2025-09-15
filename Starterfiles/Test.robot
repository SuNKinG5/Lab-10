*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}chromedriver-win64${/}chromedriver.exe
${URL}                    http://localhost:7272/Lab10/Registration.html
${BROWSER}				  Chrome

*** Test Cases ***
Open Event Registration Page
    Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration

Register Success
    Input Text    name=firstname   Somsri
	Input Text    name=lastname   Sodsai
	Input Text    name=organization    CS KKU
	Input Text    name=email	somsri@kkumail.com
	Input Text    name=phone	081-001-1234
	
	Click Button    Register
	
	Title Should Be	Success
	Page Should Contain    Success
    Page Should Contain    Thank you for participating in our event
	
	Sleep    2s
    Close Browser
	
#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration
	
Register Success No Organization Info
	Input Text    name=firstname   Somsri
	Input Text    name=lastname   Sodsai
	Input Text    name=email	somsri@kkumail.com
	Input Text    name=phone	081-001-1234
	
	Click Button    Register
	
	Title Should Be	Success
	Page Should Contain    Success
    Page Should Contain    Thank you for participating in our event
	
	Sleep    2s
    Close Browser

#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration
	
Empty First Name
    Input Text    name=lastname    Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com
    Input Text    name=phone    081-001-1234

    Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter your first name!!

    Sleep    2s
    Close Browser
	
#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration

Empty Last Name
    Input Text    name=firstname    Somsri
    Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com
    Input Text    name=phone    081-001-1234

    Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter your last name!!

    Sleep    2s
    Close Browser
	
#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration

Empty First Name and Last Name
    Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com
    Input Text    name=phone    081-001-1234

    Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter your name!!

    Sleep    2s
    Close Browser

Empty Email
	Open Browser    ${URL}    Chrome
	
	Input Text    name=firstname    Somsri
	Input Text    name=firstname    Sodsai
    Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com
    Input Text    name=phone    081-001-1234
	
	Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter your email!!

    Sleep    2s
    Close Browser

#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration

Empty Phone Number
	Input Text    name=firstname    Somsri
	Input Text    name=firstname    Sodsai
	Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com

    Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter your phone number!!

    Sleep    2s
    Close Browser

#----------------------------------------------------------------------------------

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${URL}    Chrome
	Title Should Be    Event Registration

Invalid Phone Number
	Input Text    name=firstname    Somsri
	Input Text    name=firstname    Sodsai
	Input Text    name=organization    CS KKU
    Input Text    name=email    somsri@kkumail.com
	Input Text    name=phone    1234
	
    Click Button    Register

    Title Should Be    Event Registration
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678

    Sleep    2s
    Close Browser