*** Settings ***
Documentation    Test Case 010 SWERCBJ-152. This Test Case is used to create Stored transaction
...              using Export Import XML operation
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Resource    ../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../Resources/ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../Resources/ERC_Module/Page_Objects/Login_Page.robot
Suite Setup     Open Chrome Browser with preferred options
Suite Teardown    User to Close Browser

*** Variables ***
${TC010_IMPORT_XML_FULLPATH}   ${EXECDIR}/Resources/ERC_Module/Data/TT-122776.xml
${TC010_XML_DOWNLOAD}   TT*.xml
${TC010_DOWNLOADS_DIRECTORY}    ${EXECDIR}/Results
${TC010_TC_TIMEOUT}     20s
${TC010_IMPORT_XML_ERROR_MESSAGE}   Item #1: Package Number should be greater than 0
${TC010_IMPORTXML_ERROR_LOCATOR}    //a[contains(text(), 'Item #1: Package Number should be greater than 0')]
${TC010_PACKAGE_NO}    1
${TC010_PACKAGE_TYPE}   AE
${TC010_SAVEPD_BTN}     //a[@id='updatePd']
${TC010_CTY_SUPPLY}   ID
${TC010_STORED_STATUS}    //td[contains(text(), 'Stored')]
${TC010_ALERT_MESSAGE_STORED}     Store operation is done.
${TC010_WAITING_TIMEOUT}    20s
${TC010_ALERT_MESSAGE_STORED}   Store operation is done.
${TC010_TT_STATUS}  FCVR Issued
${TC010_SLEEP_TIMEOUT}  0.5s

*** Test Cases ***
Test Case 010 SWERCBJ-152 Verify Store Status Creation Export and Import XML
    [Tags]    ERC   Smoke Test
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Click on Request AVD link at the Trade Transactions Navigation at the Left Navigation
    And User to Click Import XML
    Then User to validate all required fields has been correctly supplied
    And Click Store button
    And Searched for the newly created TT ID by entering TT ID on TT field then hit Search button
    Then Verify Status for the searched TT ID will be Stored

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Search and open for AVD Issued status transaction by clicking the 👁️ button
    SearchTT_Requests_Page.Select Status of Transaction   ${TC010_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click View Icon button

User should successfully downloaded the .xml file
    [Documentation]      Test Step 3 after Click Export XML Button
    TT_Document_Page.Wait File Download to Finish   ${TC010_XML_DOWNLOAD}   ${TC010_DOWNLOADS_DIRECTORY}
    TT_Document_Page.File Should Exists in Downloads Directory  ${TC010_XML_DOWNLOAD}   ${TC010_DOWNLOADS_DIRECTORY}

Click on Request AVD link at the Trade Transactions Navigation at the Left Navigation
    Sleep   ${TC010_SLEEP_TIMEOUT}
    SearchTT_Requests_Page.Click Request AVD

User to Click Import XML
    [Documentation]      Test Step 2 Click Import XML
    TT_Document_Page.Import XML File from   ${TC010_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC010_IMPORT_XML_ERROR_MESSAGE}   timeout=${TC010_TC_TIMEOUT}

Click on Import XML button
    [Documentation]      Test Step 5 Click Import XML
    Import XML File from the downloaded XML   ${TC010_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC010_IMPORT_XML_ERROR_MESSAGE}   timeout=${TC010_TC_TIMEOUT}

User to validate all required fields has been correctly supplied
    Clear Element Text              id=${ERC_DOCPAGE_INPUT_TVF}
    Clear Element Text              id=${ERC_DOCPAGE_TVFDATE}
    Wait Until Element is Visible   xpath=${TC010_IMPORTXML_ERROR_LOCATOR}   timeout=${TC010_TC_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TC010_IMPORTXML_ERROR_LOCATOR}   timeout=${TC010_TC_TIMEOUT}
    Scroll Element Into View  xpath=${TC010_IMPORTXML_ERROR_LOCATOR}
    click element   xpath=${TC010_IMPORTXML_ERROR_LOCATOR}
    Wait Until Page Contains Element  id=${ERC_DOCPAGE_INPUT_PACKNO}   timeout=${TC010_TC_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of     id=${ERC_DOCPAGE_INPUT_PACKNO}   ${TC010_PACKAGE_NO}
    Wait Until Element is Visible   id=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC010_TC_TIMEOUT}
    Wait Until Element is Enabled   id=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC010_TC_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of    id=${ERC_DOCPAGE_SUGGEST_PACKTYPE}    ${TC010_PACKAGE_TYPE}
    click element   ${TC010_SAVEPD_BTN}

Click on Verify button to validate all required fields has been correctly supplied
    TT_Document_Page.Click Verify button

Click Store button
    TT_Document_Page.Store operation
    TT_Document_Page.Close the Confirmation Dialog box

User should successfully stored the transaction with imported .xml file
    Wait Until Page Contains    ${TC010_ALERT_MESSAGE_STORED}    timeout=${TC010_WAITING_TIMEOUT}

Searched for the newly created TT ID by entering TT ID on TT field then hit Search button
   Wait Until Element is Visible    xpath=${ERC_DOCPAGE_TTID_LOCATOR}       timeout=${TC010_WAITING_TIMEOUT}
   element should be visible   xpath=${ERC_DOCPAGE_TTID_LOCATOR}
   ${value}=    Get Text  xpath=${ERC_DOCPAGE_TTID_LOCATOR}
   Should Not Be Empty  ${value}
   SearchTT_Requests_Page.Click Search link
   SearchTT_Requests_Page.Enter Request ID  ${value}

Verify Status for the searched TT ID will be Stored
     Wait Until Page Contains Element     ${TC010_STORED_STATUS}    timeout=${TC010_WAITING_TIMEOUT}






