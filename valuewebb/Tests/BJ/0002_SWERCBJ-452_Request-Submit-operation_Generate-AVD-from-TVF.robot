*** Settings ***
Documentation    Test Case 002 SWERCBJ-452. This Test Case is used for Submit Trade Transaction with loaded TVF
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../../Resources/ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/Search_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/Main_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/TVF_Login_Page.robot
Suite Setup     User to Open Browser
Suite Teardown    User to Close Browser

*** Variables ***
${TC002_SLEEP_TIMEOUT}                      0.5s
${TC002_IMPORT_XML_FULLPATH}                ${EXECDIR}/Resources/TVF_Module/Data/BJ/TVF-130551.xml
${TC002_ATTACHMENTS_DOC_FILE}               ${EXECDIR}/Resources/TVF_Module/Data/BJ/SingleDPIVReport.pdf
${TC002_HEADER}                             CREATE TRANSACTION VIRTUAL FOLDER (TVF) - IMPORT
${TC002_USER_REFERENCE}                     ERC
${TC002_IMPORT_XML_ERROR_MESSAGE_1}         User Reference is Mandatory
${TC002_TESTCASE_REFERENCE}                 001
${TC002_INSURANCE_VAL}                      2,000.00
${TC002_WAITING_TIMEOUT}                    20s
${TC002_USER_CUSTOMS_OFFICE}                BJA04
${TC002_IMPORT_PHONE}                       61234567
${TC002_ATTACHMENTS_DOC_CODE}               325
${TC002_ATTACHMENTS_DOC_DATE}               TODAY
${TC002_ALERT_CUSTOMS_OFC}                  //a[contains(text(), 'Customs Office: Value is required')]
${TC002_ALERT_HSC_PCKNO}                    //a[contains(text(), 'Item #1: Package Number should be greater than 0')]
${TC002_ALERT_SUBMITTED}                    Submit operation is done.
${TC002_SAVEPD_BTN}                         //a[@id='updatePd']
${TC002_STATUS}                             Stored
${TC002_CUSTOM_OFC}                         BJB01
${TC002_PHONE}                              +22990011245
${TC002_PACKAGE_NO}                         1
${TC002_PACKAGE_TYPE}                       AE
${TC002_REF_NO}                             AutoSWERCBJ28
${TC002_FF}                                 FI
${TC002_FF_STYPE}                           FI Revised
${TC002_TD}                                 Transport Document
${TC002_TD_STYPE}                           LTA Revised
${TC002_DAF}                                DV


*** Test Cases ***
Test Case 002 SWERCBJ-452 Request Submit operation Generate AVD from TVF
    [Tags]    Smoke
    [Setup]   Auto-generate of specific details
    Given User should already created transaction from TVF application with Validated status
    When User should already perform Generate AVD operation on Attachment tab
    And Enter the details of the following mandatory fields:
    And Click Store button
    Then Open again the recently Stored transaction
    And Verify following mandatory documents will be attached successfully
    And Click Submit button
    Then User should successfully submitted the transaction with Load TVF Data

*** Keywords ***
Auto-generate of specific details
    [Documentation]     This keyword used to generate unique details for User Reference
    ${current_date}=      Get Current Date             result_format=%H%M%S%y%m%d     exclude_millis=yes
    Set Suite Variable    ${TC002_USER_REFERENCE}       ${current_date}${TC002_TESTCASE_REFERENCE}


User should already created transaction from TVF application with Validated status
    [Documentation]  Test Step Precondition
    TVF_Login_Page.Login at TVF Homepage
    TVF_Login_Page.TVF Page should be in English
    TVF_Login_Page.Detect Language used in TVF Page
    User to Import XML
    User to fill the mandatory fields prior to Validate operation
    User to Validate operation

User to Import XML
    [Documentation]     Test Step Precondition Sub Part 2
    Main_Page.Click Fill TVF Import        ${TC002_HEADER}
    Main_Page.Import XML File from         ${TC002_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC002_IMPORT_XML_ERROR_MESSAGE_1}   timeout=${TC002_WAITING_TIMEOUT}
    Main_Page.Verify the Value of Customs Office under Header Tab    ${TC002_USER_CUSTOMS_OFFICE}

User to fill the mandatory fields prior to Validate operation
    [Documentation]     Test Step Precondition Sub Part 3
    Main_Page.Input User Reference under Header Tab                  ${TC002_USER_REFERENCE}
    Main_Page.Click Names And Parties Tab
    Main_Page.Input Importer Phone Number                            ${TC002_IMPORT_PHONE}
    Main_Page.Click Attachment Tab
    Main_Page.Input Doc Code under Attachments Tab                   ${TC002_ATTACHMENTS_DOC_CODE}
    Main_Page.Input Doc Ref under Attachments Tab                    ${TC002_REF_NO}
    Main_Page.Input Doc Date under Attachments Tab                   ${TC002_ATTACHMENTS_DOC_DATE}
    Main_Page.Upload File under Attachments Tab                      ${TC002_ATTACHMENTS_DOC_FILE}

User to Validate operation
    [Documentation]     Test Step Precondition Sub Part 4
    Main_Page.Click Validate Button and Yes to Confirm Operation
    Main_Page.Check Validate Operation if Success

User should already perform Generate AVD operation on Attachment tab
    Main_Page.Click Authorization Tab
    Main_Page.Click Generate AVD Under Authorizations Tab
    Switch Window   NEW   timeout=${TC002_WAITING_TIMEOUT}
    TT_Document_Page.Switch ERC Application to English
    TT_Document_Page.Detect Language used in ERC Application Page

Enter the details of the following mandatory fields:
    Enter details for Customs Office
    #Enter Package Number for the HSC item

Enter details for Customs Office
    TT_Document_Page.Click Verify button
    Wait Until Element is Visible   xpath=${TC002_ALERT_CUSTOMS_OFC}   timeout=${TC002_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TC002_ALERT_CUSTOMS_OFC}   timeout=${TC002_WAITING_TIMEOUT}
    Scroll Element Into View  xpath=${TC002_ALERT_CUSTOMS_OFC}
    click element   ${TC002_ALERT_CUSTOMS_OFC}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}   timeout=${TC002_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}   timeout=${TC002_WAITING_TIMEOUT}
    click element                    xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}
    TT_Document_Page.Enter/Modify Field Details of  xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}  ${TC002_CUSTOM_OFC}

Enter Package Number for the HSC item
    TT_Document_Page.Click Verify button
    Wait Until Element is Visible   xpath=${TC002_ALERT_HSC_PCKNO}   timeout=${TC002_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TC002_ALERT_HSC_PCKNO}   timeout=${TC002_WAITING_TIMEOUT}
    Sleep   ${TC002_SLEEP_TIMEOUT}
    Scroll Element Into View        xpath=${TC002_ALERT_HSC_PCKNO}
    click element   ${TC002_ALERT_HSC_PCKNO}
    Wait Until Page Contains Element                   xpath=${ERC_DOCPAGE_INPUT_PACKNO}   timeout=${TC002_WAITING_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_PACKNO}   ${TC002_PACKAGE_NO}
    Wait Until Element is Visible                      xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC002_WAITING_TIMEOUT}
    Wait Until Element is Enabled                      xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC002_WAITING_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}    ${TC002_PACKAGE_TYPE}
    click element   ${TC002_SAVEPD_BTN}

Click Store button
    TT_Document_Page.Store operation
    TT_Document_Page.Close the Confirmation Dialog box

Open again the recently Stored transaction
    SearchTT_Requests_Page.Click Search link
    SearchTT_Requests_Page.Select Status of Transaction     ${TC002_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click Edit Icon button

Verify following mandatory documents will be attached successfully
    TT_Document_Page.Click Attachment Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC002_TD}
    TT_Document_Page.Input Reference Number by Selection under Attachments Tab   ${TC002_TD_STYPE}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC002_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC002_FF}
    TT_Document_Page.Input Reference Number by Selection under Attachments Tab   ${TC002_FF_STYPE}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC002_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC002_DAF}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC002_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Click Verify button

User should successfully submitted the transaction with Load TVF Data
    [Documentation]   This keyword is to notify the user if the transaction was successfully submittted
    page should contain     ${TC002_ALERT_SUBMITTED}
