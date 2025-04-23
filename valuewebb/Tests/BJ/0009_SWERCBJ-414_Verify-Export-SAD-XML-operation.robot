*** Settings ***
Documentation    Test Case 009 SWERCBJ-414. This Test Case is used to download .xml file
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
${TC009_XML_DOWNLOAD}   SAD*.xml
${TC009_DOWNLOADS_DIRECTORY}    ${EXECDIR}/Results
${TC009_TT_STATUS}      FCVR Issued

*** Test Cases ***
Test Case 009 SWERCBJ-414 Verify Export SAD XML operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When ERC Page should be in English
    Then Detect Language used in ERC Page
    And Search for the transaction based on the criteria by clicking the Eye button
    And Click Export SAD XML button
    Then User should successfully downloaded the .xml file

*** Keywords ***
Search for the transaction based on the criteria by clicking the Eye button
    SearchTT_Requests_Page.Select Status of Transaction   ${TC009_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click View Icon button

User should successfully downloaded the .xml file
    [Documentation]      Test Step 6 after Click Print Button
    TT_Document_Page.Wait File Download to Finish   ${TC009_XML_DOWNLOAD}   ${TC009_DOWNLOADS_DIRECTORY}
    TT_Document_Page.File Should Exists in Downloads Directory  ${TC009_XML_DOWNLOAD}   ${TC009_DOWNLOADS_DIRECTORY}