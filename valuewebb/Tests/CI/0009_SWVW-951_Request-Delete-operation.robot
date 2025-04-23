*** Settings ***
Documentation    Test Case 009 SWVW-851. This Test Case is used to delete created transaction
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
${TC009_STATUS}     Stored


*** Test Cases ***
Test Case 009 SWVW-951 Request Delete operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And In Search TT Request page, select Stored option in Status dropdown then click Search button
    And Click Edit Icon button
    And Click Delete button
    And Click Yes Confirmation button
    And In Search TT Request page, select Stored option in Status dropdown then click Search button
    And Click Delete Icon button
    Then User should successfully deleted the transaction

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

In Search TT Request page, select Stored option in Status dropdown then click Search button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC009_STATUS}
    SearchTT_Requests_Page.Click Search button

User should successfully deleted the transaction
    TT_Document_Page.Prompt display message should appear