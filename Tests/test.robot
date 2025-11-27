*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser On BrowserStack
Suite Teardown    Close Browser Session

*** Variables ***
${URL}            https://www.demoblaze.com/

${BROWSERSTACK_USERNAME}    tothesky_9SuHMA
${BROWSERSTACK_ACCESS_KEY}  6rBkZAsYEGwB4LXsnyqJ

${BS_BROWSER}    ${BROWSER}

${USERNAME}       dasdmmkedfmk213213
${PASSWORD}       awdmlg;213123

*** Keywords ***
Open Browser On BrowserStack
    ${browser}=    Set Variable    ${BS_BROWSER}
    IF    '${browser}' == 'safari'
        ${platform}=    Set Variable    OS X Sonoma
    ELSE
        ${platform}=    Set Variable    Windows 11
    END

    ${caps}=    Create Dictionary
    ...    browserName=${browser}
    ...    browserVersion=latest
    ...    platformName=${platform}
    ...    name=DemoBlaze Robot Test
    ...    build=RF Crossbrowser Build

    ${remote_url}=    Set Variable    https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

    Open Browser    ${URL}    remote_url=${remote_url}    desired_capabilities=${caps}
    Maximize Browser Window

Close Browser Session
    Close Browser

Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}

Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Click Element    ${locator}

*** Test Cases ***
Sign Up
    Wait And Click Element    id=signin2
    Sleep    3s
    Wait Until Element Is Visible    id=sign-username   7s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    3s
    Run Keyword And Ignore Error    Handle Alert
    Sleep    2s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    2s

Log In
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    1s
    Wait And Click Element    id=login2
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    Logged in OK
    Run Keyword And Ignore Error    Handle Alert
    Sleep    2s

Place Order
    Wait And Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']
    Sleep    2s
    Input Text    id=name      gabennagibatoranime
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025
    Click Button    xpath=//button[text()='Purchase']
    Sleep    2s
    Wait Until Page Contains    Thank you for your purchase!
    Log To Console    Purchase OK
    Click Button    xpath=//button[text()='OK']
    Sleep    2s

Open And Close About Us
    Wait And Click Element    xpath=//a[text()='About us']
    Wait Until Element Is Visible    id=videoModal    5s
    Sleep    2s
    Click Element    xpath=//div[@id='videoModal']//button[@class='close']
    Sleep    2s

Buy Product
    Wait And Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=//a[text()='MacBook air']
    Wait And Click Element    xpath=//a[text()='MacBook air']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']
    Click Element    xpath=//a[text()='Add to cart']
    Sleep    3s
    Handle Possible Alert
    Wait And Click Element    id=cartur
    Wait Until Page Contains    MacBook air    5s
    Log To Console    Product added OK

Log Out
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    1s
    Wait And Click Element    id=logout2
    Wait Until Page Contains Element    id=login2   3s
    Log To Console    Logged out OK

# *** Settings ***
# Library    SeleniumLibrary
# Suite Setup    Open Browser On BrowserStack
# Suite Teardown    Close Browser Session

# *** Variables ***
# ${URL}     https://www.demoblaze.com/

# ${BROWSERSTACK_USERNAME}    tothesky_9SuHMA
# ${BROWSERSTACK_ACCESS_KEY}  6rBkZAsYEGwB4LXsnyqJ

# ${USERNAME}    dasdmmkedfmk213213
# ${PASSWORD}    awdmlg;213123


# *** Keywords ***
# Open Browser On BrowserStack
#     ${browser}=    Get Variable Value    ${BROWSER}    chrome

#     IF    '${browser}'=='safari'
#         ${platform}=    Set Variable    OS X Sonoma
#     ELSE
#         ${platform}=    Set Variable    Windows 11
#     END

#     # BrowserStack capabilities
#     ${caps}=    Create Dictionary
#     ...    browserName=${browser}
#     ...    browserVersion=latest
#     ...    platformName=${platform}
#     ...    name=Demoblaze Test - ${browser}
#     ...    build=RobotFramework Crossbrowser demo

#     ${remote_url}=    Set Variable    https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

#     Open Browser    ${URL}    remote_url=${remote_url}    desired_capabilities=${caps}
#     Maximize Browser Window


# Close Browser Session
#     Close All Browsers


# Wait And Click
#     [Arguments]    ${locator}
#     Wait Until Element Is Visible    ${locator}    10s
#     Click Element    ${locator}


# Handle Possible Alert
#     Run Keyword And Ignore Error    Handle Alert


# *** Test Cases ***

# Sign Up
#     Wait And Click    id=signin2
#     Wait Until Element Is Visible    id=sign-username   10s
#     Input Text    id=sign-username    ${USERNAME}
#     Input Text    id=sign-password    ${PASSWORD}
#     Click Element    xpath=//button[text()='Sign up']
#     Sleep    2s
#     Handle Possible Alert

# Log In
#     Wait And Click    id=login2
#     Input Text    id=loginusername    ${USERNAME}
#     Input Text    id=loginpassword    ${PASSWORD}
#     Click Element    xpath=//button[text()='Log in']
#     Wait Until Page Contains Element    id=logout2
#     Log To Console    LOGIN OK

# Place Order
#     Wait And Click    id=cartur
#     Wait And Click    xpath=//button[text()='Place Order']
#     Input Text    id=name      gabennagibatoranime
#     Input Text    id=country   Kazakhstan
#     Input Text    id=city      Almaty
#     Input Text    id=card      4111111111111111
#     Input Text    id=month     12
#     Input Text    id=year      2025
#     Click Element    xpath=//button[text()='Purchase']
#     Wait Until Page Contains    Thank you for your purchase!
#     Log To Console    PURCHASE OK
#     Click Element    xpath=//button[text()='OK']

# Open And Close About Us
#     Wait And Click    xpath=//a[text()='About us']
#     Wait Until Element Is Visible    id=videoModal    5s
#     Click Element    xpath=//div[@id='videoModal']//button[@class='close']

# Buy Product
#     Wait And Click    xpath=//a[text()='Laptops']
#     Wait And Click    xpath=//a[text()='MacBook air']
#     Wait And Click    xpath=//a[text()='Add to cart']
#     Sleep    3s
#     Handle Possible Alert
#     Wait And Click    id=cartur
#     Wait Until Page Contains    MacBook air
#     Log To Console    PRODUCT ADDED OK

# Log Out
#     Wait And Click    id=logout2
#     Wait Until Page Contains Element    id=login2   5s
#     Log To Console    LOGOUT OK
