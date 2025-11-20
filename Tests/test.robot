*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To DemoBlaze
Suite Teardown    Close Browser Session

*** Variables ***
${URL}          https://www.demoblaze.com/
${BROWSER}      chrome

${USERNAME}     testuser123
${PASSWORD}     testpass123

*** Keywords ***
Open Browser To DemoBlaze
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//a[text()='Home']    10s

Close Browser Session
    Close Browser

Add First Laptop To Cart
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=(//a[contains(text(),'MacBook')])[1]    10s
    Click Element    xpath=(//a[contains(text(),'MacBook')])[1]
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']    5s
    Click Element    xpath=//a[text()='Add to cart']
    Sleep    2s
    Run Keyword And Ignore Error    Handle Alert

Place Simple Order
    Click Element    id=cartur
    Wait Until Page Contains Element    xpath=//button[text()='Place Order']    10s
    Click Button    xpath=//button[text()='Place Order']
    Input Text    id=name      Test User
    Input Text    id=country   Kazakhstan
    Input Text    id=city      Almaty
    Input Text    id=card      4111111111111111
    Input Text    id=month     12
    Input Text    id=year      2025
    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!    10s
    Click Button    xpath=//button[text()='OK']

*** Test Cases ***
Check Home Page
    [Documentation]    Проверяем, что главная страница загрузилась и содержит товары
    Page Should Contain Element    xpath=//div[@id='tbodyid']//a

Buy Laptop
    [Documentation]    Покупаем первый попавшийся ноутбук
    Add First Laptop To Cart
    Place Simple Order
