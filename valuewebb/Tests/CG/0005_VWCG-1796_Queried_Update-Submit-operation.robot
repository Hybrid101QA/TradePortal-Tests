*** Settings ***
Documentation    Test Case 005 VWCG-1796. This Test Case is used for to update and submit Queried Transactions
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Resource    ../../Resources//ERC_Module//ERC_Setup_Teardown.robot
Resource    ../../Resources//ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources//ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Suite Setup     User to Open Browser
Suite Teardown    User to Close Browser

*** Variables ***
${TC005_EXP_NAME}           HMR Trading
${TC005_EXP_ADDRESS}        HY Singa St. Avenue Cmp
${TC005_EXP_CITY}           Navotas
${TC005_EXP_COUNTRY}        PH
${TC005_CONTACT_PERSON}     Edmundo
${TC005_EMAIL}              dan.bacarra@webbfontaine.com
${TC005_AW_BL_CM_NO}        LH02202
${TC005_AW_BL_CM_DATE}      01/01/2020
${TC005_FL_VO_TR_NO}        PR-256
${TC005_TRANSPORT_NO}       FERM EXPRESS
${TC005_MOT}                12
${TC005_MARKS}              Marksmen Enterprise
${TC005_INV_REF}            2020A992-INV
${TC005_INV_DATE}           01/01/2020
${TC005_INV_CURRENCY}       PHP
${TC005_INV_TOTAL}          5,000.00
${TC005_SUGGEST_PAYMENT}    30
${TC005_AUTOGENERATED}      Auto-generated details
${TC005_ALERT_MESSAGE_UPDATED}      Update operation is done. The new status of the document is Queried
${TC005_ALERT_MESSAGE_SUBMITTED}    Submit operation is done. The new status of the document is Submitted
${TC005_TT_STATUS}          Queried

*** Test Cases ***
Test Case 005 VWCG-1796 Update and Submit Queried Transaction
    [Tags]    Smoke
    Given Login at ERC Homepage
    When User to change the French Translation to English
    And In Search page, open for Queried status of transaction by clicking Edit button
    And Modify the some of the details in the tabs then click Update button
    And Open again the recently updated transaction
    And Verify the mandatory fields then click Submit button
    Then Prompt message displays that the transaction was submitted

*** Keywords ***
User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

In Search page, open for Queried status of transaction by clicking Edit button
    SearchTT_Requests_Page.Select Status of Transaction    ${TC005_TT_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click Edit Icon button

Modify the some of the details in the tabs then click Update button
    TT_Document_Page.Click Names & Parties Tab
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_EXPNAM}        ${TC005_EXP_NAME}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_EXPADD}        ${TC005_EXP_ADDRESS}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_EXPCTY}        ${TC005_EXP_CITY}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_COUNTRY}     ${TC005_EXP_COUNTRY}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_CONTACT}       ${TC005_CONTACT_PERSON}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_APPEMAIL}      ${TC005_EMAIL}
    TT_Document_Page.Click Transport Tab
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_BLNO}          ${TC005_AW_BL_CM_NO}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_DAT_BLDATE}          ${TC005_AW_BL_CM_DATE}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_VOYAGENO}      ${TC005_FL_VO_TR_NO}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_TRANSPORTNO}   ${TC005_TRANSPORT_NO}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_MOT}         ${TC005_MOT}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_MARKS}         ${TC005_MARKS}
    TT_Document_Page.Click Financial Tab
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_INVREF}        ${TC005_INV_REF}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_DAT_INV}             ${TC005_INV_DATE}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_CURRENCY}    ${TC005_INV_CURRENCY}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_TOTALINV}    ${TC005_INV_TOTAL}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_PAYMENT}     ${TC005_SUGGEST_PAYMENT}
    TT_Document_Page.Click Goods Tab
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_GDESC}         ${TC005_AUTOGENERATED}
    TT_Document_Page.Click Remarks Tab
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_REMARKS}       ${TC005_AUTOGENERATED}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_REASONS}       ${TC005_AUTOGENERATED}
    TT_Document_Page.Update operation for Stored/Queried
    page should contain     ${TC005_ALERT_MESSAGE_UPDATED}

Open again the recently updated transaction
    [Documentation]     This keyword is to refresh the list of transaction in Search page
    Go Back
    Go Back
    click button    xpath=${ERC_SEARCHPAGE_TT_BTN}
    Click Edit Icon button

Prompt message displays that the transaction was submitted
    [Documentation]   This keyword is to notify the user if the transaction was successfully submittted
    page should contain     ${TC005_ALERT_MESSAGE_SUBMITTED}

Verify the mandatory fields then click Submit button
    TT_Document_Page.Click Verify button
    TT_Document_Page.Click Submit button

Verify the entered details on the field was updated
    [Documentation]   This keyword is to verify details were updated on the fields after the operation
    [Arguments]  ${locator}     ${expectedString}
    ${value}=    Get Element Attribute  ${locator}   value
    Should Be Equal     ${value}    ${expectedString}
