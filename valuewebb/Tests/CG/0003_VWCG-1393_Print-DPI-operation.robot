*** Settings ***
Documentation    Test Case 003 VWCG-1393. This Test Case is used print PDF for DPIV Issued transaction
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
${TC003_PDF_DOWNLOAD}   DPIV.pdf
${TC003_DOWNLOADS_DIRECTORY}    ${EXECDIR}/Results
${TC003_TT_STATUS}      FCVR Issued

*** Test Cases ***
Test Case 003 VWCG-1393 Print DPI operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Search for the transaction based on the criteria by clicking the Eye button
    And Click Print button
    Then User should successfully downloaded the DPIV Report .pdf file


*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Search for the transaction based on the criteria by clicking the Eye button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC003_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click View Icon button

User should successfully downloaded the DPIV Report .pdf file
    [Documentation]      Test Step 4 after Click Print Button
    TT_Document_Page.Wait File Download to Finish   ${TC003_PDF_DOWNLOAD}   ${TC003_DOWNLOADS_DIRECTORY}
    TT_Document_Page.File Should Exists in Downloads Directory  ${TC003_PDF_DOWNLOAD}   ${TC003_DOWNLOADS_DIRECTORY}