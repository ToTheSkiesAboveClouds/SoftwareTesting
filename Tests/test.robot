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
        ${os}=    Set Variable    OS X
        ${os_version}=    Set Variable    Sonoma
    ELSE
        ${os}=    Set Variable    Windows
        ${os_version}=    Set Variable    11
    END

    ${bstack_options}=    Create Dictionary
    ...    os=${os}
    ...    osVersion=${os_version}
    ...    buildName=RF Crossbrowser Build
    ...    sessionName=DemoBlaze Tests

    ${options}=    Create Dictionary
    ...    browserName=${browser}
    ...    browserVersion=latest
    ...    bstack:options=${bstack_options}

    ${remote_url}=    Set Variable    https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

    Open Browser    ${URL}    remote_url=${remote_url}    options=${options}
    Maximize Browser Window

Close Browser Session
    Close Browser


Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}


Close Any Modal If Present
    ${is_open}=    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath=//div[contains(@class,'modal') and contains(@class,'show')]

    IF    ${is_open}
        Click Element    xpath=//div[contains(@class,'modal') and contains(@class,'show')]//button[@class='close']
        Wait Until Element Does Not Contain
        ...    xpath=//div[contains(@class,'modal')]
        ...    show
        ...    5s
    END


*** Test Cases ***

Sign Up
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username   7s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    1s
    Handle Possible Alert
    Close Any Modal If Present
    Sleep    1s


Log In
    Close Any Modal If Present
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername   3s
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains Element    id=logout2
    Log To Console    Logged in OK
    Handle Possible Alert
    Sleep    2s


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
    Sleep    1s

    Wait Until Page Contains    Thank you for your purchase!
    Log To Console    Purchase OK

    Click Button    xpath=//button[text()='OK']
    Sleep    2s


Open And Close About Us
    Click Element    xpath=//a[text()='About us']
    Wait Until Element Is Visible    id=videoModal    5s
    Sleep    1s
    Click Element    xpath=//div[@id='videoModal']//button[@class='close']
    Sleep    1s


Buy Product
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page C
