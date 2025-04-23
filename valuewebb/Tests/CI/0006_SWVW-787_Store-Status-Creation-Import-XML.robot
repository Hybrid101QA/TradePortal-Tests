*** Settings ***
Documentation    Test Case 006 SWVW-787. This Test Case is used to create Stored transaction using Import XML operation
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
${TC006_IMPORT_XML_FULLPATH}   ${EXECDIR}/Resources/ERC_Module/Data/TT-179.xml
${TC006_TC_TIMEOUT}                   20s
${TC006_IMPORT_XML_ERROR_MESSAGE}     Country of supply : Country of supply cannot be empty while Port of Loading/Place of Receipt is not empty!
${TC006_ERROR_MESSAGE}                //a[@errorelementid='ctySupp']
${TC006_CTY_SUPPLY}                   CI
${TC006_STORED_STATUS}                //td[contains(text(), 'Stored')]
${TC006_WAITING_TIMEOUT}              20s
${TC006_ALERT_MESSAGE_STORED}         Store operation is done.

*** Test Cases ***
Test Case 006 SWVW-787 Store status creation using Import XML
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And Click Create TT link
    And User to Click Import XML
    And User to validate all required fields has been correctly supplied
    And Click Store button
    And Searched for the newly created TT ID by entering TT ID on TT field then hit Search button
    Then Verify Status for the searched TT ID will be Stored

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

User to Click Import XML
    [Documentation]      Test Step 2 Click Import XML
    TT_Document_Page.Import XML File from   ${TC006_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC006_IMPORT_XML_ERROR_MESSAGE}   timeout=${TC006_TC_TIMEOUT}

User to validate all required fields has been correctly supplied
     Wait Until Element is Enabled    xpath=${TC006_ERROR_MESSAGE}  timeout=${TC006_WAITING_TIMEOUT}
     click element   xpath=${TC006_ERROR_MESSAGE}
     TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_COS}    ${TC006_CTY_SUPPLY}

User should successfully stored the transaction with imported .xml file
    Wait Until Page Contains    ${TC006_ALERT_MESSAGE_STORED}    timeout=${TC006_WAITING_TIMEOUT}

Searched for the newly created TT ID by entering TT ID on TT field then hit Search button
   Wait Until Element is Visible    xpath=${ERC_DOCPAGE_TTID_LOCATOR}       timeout=${TC006_WAITING_TIMEOUT}
   element should be visible   xpath=${ERC_DOCPAGE_TTID_LOCATOR}
   ${value}=    Get Text  xpath=${ERC_DOCPAGE_TTID_LOCATOR}
   Should Not Be Empty  ${value}
   SearchTT_Requests_Page.Click Search link
   SearchTT_Requests_Page.Enter Request ID  ${value}

Verify Status for the searched TT ID will be Stored
     Wait Until Page Contains Element     ${TC006_STORED_STATUS}    timeout=${TC006_WAITING_TIMEOUT}






