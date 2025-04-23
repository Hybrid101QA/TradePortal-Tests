*** Settings ***
Documentation    Test Case 004 SWVW-952. This Test Case is used to cancel created transaction
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Resource    ../../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Suite Setup     User to Open Browser
Suite Teardown    User to Close Browser

*** Variables ***
${TC005_TT_STATUS}  Queried

*** Test Cases ***
Test Case 005 SWERCBJ-347 Request Cancel operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Search for the transaction based on the criteria by clicking the Pencil button
    And User to Cancel the transaction
    Then User should successfully cancelled the transaction

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Search for the transaction based on the criteria by clicking the Pencil button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC005_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click Edit Icon button

User to Cancel the transaction
    [Documentation]     This keyword used only to cancel transaction on Queried document without confirmation dialog box
    ...                 confirmation dialog box in ERC Benin
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CANCEL_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CANCEL_BTN}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click button    xpath=${ERC_DOCPAGE_CANCEL_BTN}

User should successfully cancelled the transaction
    TT_Document_Page.Prompt display message should appear