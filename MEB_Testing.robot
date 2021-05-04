*** Settings ***
Library    SeleniumLibrary
Test Setup    Open MEB
Test Teardown    Close Browser

*** Test Cases ***
TC1 ทดสอบการค้นหาในชั้นหนังสือ Test To Pass
    Search Shelf on MEB     Jujutsu kaisen    มหาเวทย์ผนึกมาร เล่ม 08
TC2 Check See all list after Search Test To Pass
    Search Shelf on MEB     Jujutsu kaisen    มหาเวทย์ผนึกมาร เล่ม 08
    Click Link    //*[@id="container"]/div[1]/div/ul/li[1]/a
    Page Should Contain     slime
TC3 Check rating at shelf Test To Fail
    Maximize Browser Window
    Click Element    //*[@id="top_bar_left"]/div/div
    Wait Until Element Is Visible    //*[@id="modal_login"]/div/div/div[2]/fieldset/div[2]/button    10
    Input Text     username    gamemaipak
    Input Password    password   Game9794
    Click Button    //*[@id="btn-login"]
    sleep     1s
    Click Image    //*[@id="dropdown_menu_user"]/div/img
    sleep     1s
    Click Link    //*[@id="dropdown_menu_user_list"]/ul/li[13]/div[2]/a[7]
    sleep     1s
    Page Should Contain    No Rating

*** Keywords ***
Open MEB
    Open Browser    https://www.mebmarket.com   chrome 
Search Shelf on MEB
    [Arguments]    ${Input_text}    ${result_text}
    Maximize Browser Window
    Click Element    //*[@id="top_bar_left"]/div/div
    Wait Until Element Is Visible    //*[@id="modal_login"]/div/div/div[2]/fieldset/div[2]/button    10
    Input Text     username    gamemaipak
    Input Password    password   Game9794
    Click Button    //*[@id="btn-login"]
    sleep     1s
    Click Image    //*[@id="dropdown_menu_user"]/div/img
    sleep     1s
    Click Link    //*[@id="dropdown_menu_user_list"]/ul/li[13]/div[2]/a[7]
    Input Text    text_search    ${Input_text}
    Press keys    text_search    RETURN
    Wait Until Page Contains     ${result_text}
    Page Should Contain    ${result_text}
    Clear Element Text  text_search