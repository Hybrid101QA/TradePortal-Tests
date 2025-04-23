*** Settings ***
Documentation    Test Case 004 VWCG-1393. This Test Case is used for Import and Export of .xls file
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
${TC004_DOWNLOADS_DIRECTORY}   ${EXECDIR}/Results
${TC004_XLS_DOWNLOAD}          TT*.xls
${TC004_IMPORT_XLS_FULLPATH}   ${EXECDIR}/Results/TT*.xls
${TC004_IMPORT_XLS_REF_VALUE}  //p[contains(text(),'Successfully Imported')]
${TC004_TT_STATUS}             Processing
${TC004_ALERT_MESSAGE}         Update operation is done. The new status of the document is Processing



*** Test Cases ***
Test Case 004 VWCG-1392 Import and Export XLS operation
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Search for the transaction based on the criteria by clicking the Edit button
    And Click Goods Tab
    And Verify the Items indicated in the table then click Export Items button
    And User to Click Import Items
    And Click Update button
    Then User should successfully updated the Processing status transaction with imported .xls file

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Search for the transaction based on the criteria by clicking the Edit button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC004_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click Edit Icon button

Verify the Items indicated in the table then click Export Items button
    [Documentation]      Test Step 4 Click Export XLS
    TT_Document_Page.Click Export Items
    TT_Document_Page.Wait File Download to Finish   ${TC004_XLS_DOWNLOAD}   ${TC004_DOWNLOADS_DIRECTORY}
    TT_Document_Page.File Should Exists in Downloads Directory  ${TC004_XLS_DOWNLOAD}   ${TC004_DOWNLOADS_DIRECTORY}

User to Click Import Items
    [Documentation]      Test Step 5 Click Import XLS
    TT_Document_Page.Import XLS File from   ${TC004_IMPORT_XLS_FULLPATH}
    Wait Until Page Contains Element    ${TC004_IMPORT_XLS_REF_VALUE}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

User should successfully updated the Processing status transaction with imported .xls file
    TT_Document_Page.Prompt display message should appear
    page should contain    ${TC004_ALERT_MESSAGE}

Click Update Button
    TT_Document_Page.Update operation for Processing



