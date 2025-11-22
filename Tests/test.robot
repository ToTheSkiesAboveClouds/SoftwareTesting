*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser On BrowserStack
Suite Teardown    Close Browser

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

    # auto OS switch
    IF    '${browser}' == 'safari'
        ${platform}=    Set Variable    OS X Sonoma
    ELSE
        ${platform}=    Set Variable    Windows 11
    END

    ${bstack_options}=    Create Dictionary
    ...    os=${platform}
    ...    seleniumVersion=4.22.0
    ...    userName=${BROWSERSTACK_USERNAME}
    ...    accessKey=${BROWSERSTACK_ACCESS_KEY}
    ...    buildName=RF Crossbrowser Build
    ...    sessionName=DemoBlaze Test

    ${caps}=    Create Dictionary
    ...    browserName=${browser}
    ...    browserVersion=latest
    ...    bstack:options=${bstack_options}

    ${remote_url}=    Set Variable    https://hub.browserstack.com/wd/hub

    Open Browser    ${URL}    browser=${browser}    remote_url=${remote_url}    options=${caps}
    Maximize Browser Window


Close Browser Session
    Close Browser


Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}


*** Test Cases ***
Sign Up
    Click Element    id=signin2
    Sleep    2s
    Wait Until Element Is Visible    id=sign-username    10s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    2s
    Run Keyword And Ignore Error    Handle Alert
    Sleep    2s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Wait Until Element Is Not Visible    id=signInModal    5s


Log In
    # гарантия, что модалка НЕ мешает
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Wait Until Element Is Not Visible    id=signInModal    5s

    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername    5s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    Logged in OK


Place Order
    Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']
    Sleep    1s

    Input Text    id=name      gabennagibatoranime
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025

    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!
    Click Button    xpath=//button[text()='OK']


Buy Product
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=//a[text()='MacBook air']
    Click Element    xpath=//a[text()='MacBook air']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']
    Click Element    xpath=//a[text()='Add to cart']
    Sleep    2s
    Handle Possible Alert
    Click Element    id=cartur
    Wait Until Page Contains    MacBook air


Log Out
    Click Element    id=logout2
    Wait Until Page Contains Element    id=login2
*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser On BrowserStack
Suite Teardown    Close Browser

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

    # auto OS switch
    IF    '${browser}' == 'safari'
        ${platform}=    Set Variable    OS X Sonoma
    ELSE
        ${platform}=    Set Variable    Windows 11
    END

    ${bstack_options}=    Create Dictionary
    ...    os=${platform}
    ...    seleniumVersion=4.22.0
    ...    userName=${BROWSERSTACK_USERNAME}
    ...    accessKey=${BROWSERSTACK_ACCESS_KEY}
    ...    buildName=RF Crossbrowser Build
    ...    sessionName=DemoBlaze Test

    ${caps}=    Create Dictionary
    ...    browserName=${browser}
    ...    browserVersion=latest
    ...    bstack:options=${bstack_options}

    ${remote_url}=    Set Variable    https://hub.browserstack.com/wd/hub

    Open Browser    ${URL}    browser=${browser}    remote_url=${remote_url}    options=${caps}
    Maximize Browser Window


Close Browser Session
    Close Browser


Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}


*** Test Cases ***
Sign Up
    Click Element    id=signin2
    Sleep    2s
    Wait Until Element Is Visible    id=sign-username    10s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    2s
    Run Keyword And Ignore Error    Handle Alert
    Sleep    2s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Wait Until Element Is Not Visible    id=signInModal    5s


Log In
    # гарантия, что модалка НЕ мешает
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Wait Until Element Is Not Visible    id=signInModal    5s

    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername    5s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    Logged in OK


Place Order
    Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']
    Sleep    1s

    Input Text    id=name      gabennagibatoranime
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025

    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!
    Click Button    xpath=//button[text()='OK']


Buy Product
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=//a[text()='MacBook air']
    Click Element    xpath=//a[text()='MacBook air']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']
    Click Element    xpath=//a[text()='Add to cart']
    Sleep    2s
    Handle Possible Alert
    Click Element    id=cartur
    Wait Until Page Contains    MacBook air


Log Out
    Click Element    id=logout2
    Wait Until Page Contains Element    id=login2
