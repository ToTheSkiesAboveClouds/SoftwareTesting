*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To DemoBlaze
Suite Teardown    Close Browser Session

*** Variables ***
${URL}                      https://www.demoblaze.com/
${USERNAME}                 myuser123
${PASSWORD}                 mypass123

${BROWSERSTACK_USERNAME}    tothesky_9SuHMA
${BROWSERSTACK_ACCESS_KEY}  6rBkZAsYEGwB4LXsnyqJ
${REMOTE_URL}               https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub

# Этот словарь содержит настройки BrowserStack
&{CAPABILITIES}
...    browserName=${BROWSER}
...    browserVersion=latest
...    os=Windows
...    osVersion=11
...    name=DemoBlaze Tests
...    build=RobotFramework Homework

*** Keywords ***
Open Browser To DemoBlaze
    [Arguments]    ${BROWSER}=chrome
    Open Browser    ${URL}    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=&{CAPABILITIES}

Close Browser Session
    Close Browser

Handle Possible Alert
    ${result}=    Run Keyword And Ignore Error    Handle Alert
    Log To Console    Alert handled or not present: ${result}

*** Test Cases ***
Sign Up
    Click Element    id=signin2
    Sleep    2s
    Wait Until Element Is Visible    id=sign-username    7s
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click But
