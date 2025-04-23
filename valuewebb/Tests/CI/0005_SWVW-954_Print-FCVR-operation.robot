*** Settings ***
Documentation    Test Case 005 SWVW-954. This Test Case is used to print PDF for FCVR Issued transaction
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Resource    ../../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Suite Setup     Open Chrome Browser with preferred options
Suite Teardown    User to Close Browser

*** Variables ***
${TC005_PDF_DOWNLOAD}   FCVR.pdf
${TC005_DOWNLOADS_DIRECTORY}    ${EXECDIR}/Results
${TC005_TT_STATUS}      FCVR Issued

*** Test Cases ***
Test Case 005 SWVW-954 Print FCVR operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Search for the transaction based on the criteria by clicking the Eye button
    And Click Print button
    Then User should successfully downloaded the FCVR Report .pdf file

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Search for the transaction based on the criteria by clicking the Eye button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC005_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click View Icon button

User should successfully downloaded the FCVR Report .pdf file
    [Documentation]      Test Step 4 after Click Print Button
    TT_Document_Page.Wait File Download to Finish   ${TC005_PDF_DOWNLOAD}   ${TC005_DOWNLOADS_DIRECTORY}
    TT_Document_Page.File Should Exists in Downloads Directory  ${TC005_PDF_DOWNLOAD}   ${TC005_DOWNLOADS_DIRECTORY}