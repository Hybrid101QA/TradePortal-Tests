*** Settings ***
Documentation     This resource file is used for keywords in TVF Search Page
Library           SeleniumLibrary
Library           BuiltIn
Library           String
Library           OperatingSystem

*** Variables ***
${TVF_SEARCHPAGE_SLEEP_TIMEOUT}                    0.5s
${TVF_SEARCHPAGE_WAITING_TIMEOUT}                  20s
${TVF_SEARCHPAGE_BASIC_SEARCH_TVF_STATUS}          //select[@id="status"]
${TVF_SEARCHPAGE_BASIC_SEARCH_TVF_NUMBER}          //input[@id="trNumber"]
${TVF_SEARCHPAGE_DI_NO}                            //input[@id="diNumber"]
${TVF_SEARCHPAGE_SEARCH_BTN}                       //button[@name="search"]
${TVF_SEARCHPAGE_VIEW_BTN}                         //span[contains(@class, "glyphicon-eye-open")]
${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}                  //span[contains(@class, "glyphicon-pencil")]
${TVF_SEARCHPAGE_AUTHORIZATION_TAB}                //a[@href="#authorizations"]


*** Keywords ***
Enter DI Number
    [Documentation]     This keyword used to input based on DI Number
    [Arguments]     ${DI_NO}
    Wait Until Element is Visible    xpath=${TVF_SEARCHPAGE_DI_NO}  timeout=${TVF_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${TVF_SEARCHPAGE_DI_NO}  timeout=${TVF_SEARCHPAGE_WAITING_TIMEOUT}
    input text      xpath=${TVF_SEARCHPAGE_DI_NO}    ${DI_NO}
    Press Keys      xpath=${TVF_SEARCHPAGE_DI_NO}       RETURN

Enter TVF Number under Basic Search Tab
    [Documentation]     This keyword used to search for specific transaction based on TVF Number
    [Arguments]        ${tvf_number_input}
    Input Text         xpath=${TVF_SEARCH_PAGE_BASIC_SEARCH_TVF_NUMBER}       ${tvf_number_input}
    Press Keys         xpath=${TVF_SEARCH_PAGE_BASIC_SEARCH_TVF_NUMBER}       RETURN

Select TVF Status under Basic Search Tab
    [Documentation]     This keyword used to select status of the transaction
    [Arguments]                  ${tvf_status_input}
    ${tvf_status_input}=         Convert to Upper Case      ${tvf_status_input}
    Select From List By Value    xpath=${TVF_SEARCHPAGE_BASIC_SEARCH_TVF_STATUS}    ${tvf_status_input}

Click Search Button
    [Documentation]     This keyword used to display search results
    Scroll Element Into View        xpath=${TVF_SEARCHPAGE_SEARCH_BTN}
    Click Element                   xpath=${TVF_SEARCHPAGE_SEARCH_BTN}

Click View Icon button
    [Documentation]     This keyword used to view and open the transaction
    Wait Until Element is Visible   xpath=${TVF_SEARCHPAGE_VIEW_BTN}
    Wait Until Element Is Enabled   xpath=${TVF_SEARCHPAGE_VIEW_BTN}
    click element   xpath=${TVF_SEARCHPAGE_VIEW_BTN}
    Page Should Contain Element     ${TVF_SEARCHPAGE_AUTHORIZATION_TAB}    timeout=${TVF_SEARCHPAGE_WAITING_TIMEOUT}

Click Edit Icon Button
    [Documentation]     his keyword used to edit and open the transaction
    Wait Until Element is Enabled   xpath=${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}         timeout=${TVF_SEARCHPAGE_WAITING_TIMEOUT}
    Scroll Element Into View        xpath=${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}
    Set Focus To Element            xpath=${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}
    Wait Until Element is Visible   xpath=${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}         timeout=${TVF_SEARCHPAGE_WAITING_TIMEOUT}
    Click Element                   xpath=${TVF_SEARCHPAGE_EDIT_PENCIL_BTN}


