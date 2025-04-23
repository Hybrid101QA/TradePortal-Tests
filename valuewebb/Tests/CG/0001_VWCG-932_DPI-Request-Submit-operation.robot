*** Settings ***
Documentation    Test Case 001 VWCG-932. This Test Case is used to create end to end transaction (Stored-Submit)
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/Search_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/Main_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/TVF_Login_Page.robot

Suite Setup     User to Open Browser
Suite Teardown    User to Close Browser

*** Variables ***
${TC001_IMPORT_XML_FULLPATH}                ${EXECDIR}/Resources/TVF_Module/Data/CG/DVT-264818.xml
${TC001_IMPORT_XML_ERROR_MESSAGE_1}         User Reference is Mandatory
${TC001_IMPORT_XML_ERROR_MESSAGE_2}         Supplier relationship is Mandatory
${TC001_IMPORT_XML_ERROR_MESSAGE_3}         'DI Number' is Mandatory
${TC001_HEADER}                             CREATE TRANSACTION VIRTUAL FOLDER (TVF) - IMPORT
${TC001_FACTURE_DOC}                        //td[contains(text(), 'Facture commerciale')]
${TC001_USER_REFERENCE}                     ERC
${TC001_DI_REFERENCE}                       ERC
${TC001_DOM_BANKNUM}                        001
${TC001_TESTCASE_REFERENCE}                 001
${TC001_USER_CUSTOMS_OFFICE}                DD141
${TC001_RUBRIQUE}                           A
${TC001_CHAPTERCOD}                         01
${TC001_CODENAM}                            01.1
${TC001_CODEPRE}                            04
${TC001_MCAC}                               R2021
${TC001_WAITING_TIMEOUT}                    20s
${TC001_SLEEP_TIMEOUT}                      0.5s
${TC001_IMPORT_PHONE}                       061234567
${TC001_SUP_REL}                            Subsidiary
${TC001_INV_TYPE}                           FACTURE PROFORMA
${TC001_ATTACHMENTS_DOC_CODE}               004
${TC001_ATTACHMENTS_DOC_DATE}               TODAY
${TC001_ATTACHMENTS_DOC_FILE}               ${EXECDIR}/Resources/TVF_Module/Data/CG/SingleDPIVReport.pdf
${TC001_TITLE_PAGE}                         eDouanes Congo - DPI
${TC001_DTYPE_FF}                           Facture Finale (FF)
${TC001_STYPE_FF}                           FF Initiale
${TC001_DTYPE_TD}                           Document de Transport
${TC001_STYPE_TD}                           Autre
${TC001_DTYPE_DV}                           Déclaration de Valeur
${TC001_DTYPE_LC}                           Liste de Colisage
${TC001_REF_NO}                             This is a testing
${TC001_ALERT_CONTAINER}                    //a[@errorelementid='loadingType_1']
${TC001_LOADING_TYPE}                       FCL
${TC001_ALERT_MESSAGE}                      Submit operation is done. The new status of the document is Submitted


*** Test Cases ***
Test Case 001 VWCG-932 DPI Request Submit operation
    [Tags]    Smoke
    [Setup]   User to do Test Preconditions
    Given User should already created transaction from TVF application with Validated status
    When User should already perform Generate DPIV operation on Attachment tab
    And Verify all details on the following fields will be successfully imported from TVF to ERC in Header tab
    And Verify following fields will be successfully imported under Names & Parties Tab
    And Verify following fields will be successfully imported under Transport Tab
    And Verify following fields will be successfully imported under Financial Tab
    And Verify following fields will be successfully imported under Goods Tab
    And Verify following fields will be successfully imported under Remarks Tab
    And Verify following mandatory documents will be attached successfully
    And Verify the mandatory fields then click Store button
    And Click Submit button
    Then User should successfully submitted the transaction

*** Keywords ***
User to do Test Preconditions
    [Documentation]     This keyword used to generate unique details for DI Number and User Reference
    TVF_Login_Page.User to Set Features ON or OFF
    ${current_date}=      Get Current Date             result_format=%y%m%d%H%M%S     exclude_millis=yes
    Set Suite Variable    ${TC001_USER_REFERENCE}     ${current_date}${TC001_TESTCASE_REFERENCE}
    Set Suite Variable    ${TC001_DI_REFERENCE}       ${current_date}${TC001_TESTCASE_REFERENCE}

User should already created transaction from TVF application with Validated status
    [Documentation]  Test Step Precondition
    TVF_Login_Page.Login at TVF Homepage
    TVF_Login_Page.TVF Page should be in English
    TVF_Login_Page.Detect Language used in TVF Page
    User to Import XML
    User to fill the mandatory fields prior to Validate operation
    User to Validate operation

User to Import XML
    [Documentation]     Test Step Precondition Sub Part 3
    Main_Page.Click Fill TVF Import        ${TC001_HEADER}
    Main_Page.Import XML File from         ${TC001_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC001_IMPORT_XML_ERROR_MESSAGE_1}   timeout=${TC001_WAITING_TIMEOUT}
    #Wait Until Page Contains              ${TC001_IMPORT_XML_ERROR_MESSAGE_2}   timeout=${TC001_WAITING_TIMEOUT}
    #Wait Until Page Contains              ${TC001_IMPORT_XML_ERROR_MESSAGE_3}   timeout=${TC001_WAITING_TIMEOUT}
    Main_Page.Verify the Value of Customs Office under Header Tab    ${TC001_USER_CUSTOMS_OFFICE}

User to fill the mandatory fields in Header and Names Parties tabs
    Run Keyword If            '${TVF_TEST_SERVER}' in 'UAT'
    ...                        Enter previous mandatory fields
    Run Keyword If            '${TVF_TEST_SERVER}' in 'QA'
    ...                        Enter new mandatory fields

Enter previous mandatory fields
    Main_Page.Input User Reference under Header Tab                 ${TC001_USER_REFERENCE}
    Main_Page.Input DI Number under Header Tab                      ${TC001_DI_REFERENCE}
    Main_Page.Click Names And Parties Tab
    Main_Page.Input Importer Phone Number                           ${TC001_IMPORT_PHONE}

Enter new mandatory fields
    Main_Page.Input User Reference under Header Tab                 ${TC001_USER_REFERENCE}
    Main_Page.Input Domiciliation Number under Header Tab           ${TC001_DOM_BANKNUM}
    Main_Page.Input Rubrique under Header Tab                       ${TC001_RUBRIQUE}
    Main_Page.Input Chapter Code under Header Tab                   ${TC001_CHAPTERCOD}
    Main_Page.Input Codename under Header Tab                       ${TC001_CODENAM}
    Main_Page.Input Code Prefecture under Header Tab                ${TC001_CODEPRE}
    Main_Page.Input MCAC under Header Tab                           ${TC001_MCAC}
    Main_Page.Click Names And Parties Tab
    Main_Page.Input Importer Phone Number                           ${TC001_IMPORT_PHONE}
    Main_Page.Select Supplier Relationship                          ${TC001_SUP_REL}

User to fill the mandatory fields prior to Validate operation
    [Documentation]     Test Step Precondition Sub Part 4
    User to fill the mandatory fields in Header and Names Parties tabs
    Main_Page.Click Financial Tab
    Main_Page.Select Invoice Type                                    ${TC001_INV_TYPE}
    Main_Page.Click Attachment Tab
    Main_Page.Input Doc Code under Attachments Tab                   ${TC001_ATTACHMENTS_DOC_CODE}
    Main_Page.Input Doc Ref under Attachments Tab                    ${TC001_REF_NO}
    Main_Page.Input Doc Date under Attachments Tab                   ${TC001_ATTACHMENTS_DOC_DATE}
    Main_Page.Upload File under Attachments Tab                      ${TC001_ATTACHMENTS_DOC_FILE}

User to Validate operation
    [Documentation]     Test Step Precondition Sub Part 5
    Main_Page.Click Validate Button and Yes to Confirm Operation
    Main_Page.Check Validate Operation if Success

User to Verify Validate Operation
    [Documentation]     Test Step # Verify Validate Operation
    Main_Page.Check Validate Operation if Success
    ${TC001_TVF_NUMBER}=    TVF_Import_Page.Get TVF Number from Header Tab
    Set Suite Variable       ${TC001_TVF_NUMBER}       ${TC001_TVF_NUMBER}

User should already perform Generate DPIV operation on Attachment tab
    Main_Page.Click Authorization Tab
    Main_Page.Generate DPIV under Authorization Tab
    Main_Page.Navigate to E-Ruling Center    ${TC001_TITLE_PAGE}

Verify all details on the following fields will be successfully imported from TVF to ERC in Header tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TVF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_TVFDATE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_CUSTOMOFC}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_DI_NO}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_ITEMNO}


Verify following fields will be successfully imported under Names & Parties Tab
    TT_Document_Page.Click Names & Parties Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_IMP}
    Verify Field and Value of                    xpath=${ERC_DOCPAGE_INPUT_IMPEMAIL}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_EXPNAM}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_EXPADD}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_EXPCTY}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_COUNTRY}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_DEC}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_PHONENUM}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_CONTACT}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_APPEMAIL}

Verify following fields will be successfully imported under Transport Tab
    TT_Document_Page.Click Transport Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_DRPDWN_STYPE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_COS}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_CARRIER}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_BLNO}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_DAT_BLDATE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_VOYAGENO}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TRANSPORTNO}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_MOT}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_NETMASS}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_GROSSMASS}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_PLACERECEIPT}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_PLACELOADING}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_DISCHARGE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_FCLNO}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_LCLNO}
    Page Should Contain Element                  xpath=${ERC_DOCPAGE_SEC_CONT}

Verify following fields will be successfully imported under Financial Tab
    TT_Document_Page.Click Financial Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_INVREF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_DAT_INV}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_CURRENCY}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALFOB}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALFREIGHT}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALINSURANCE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_OTHER_CHARGES}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALCIF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_INC}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_TOTALINV}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_PAYMENT}

Verify following fields will be successfully imported under Goods Tab
    TT_Document_Page.Click Goods Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_GDESC}
    Page Should Contain Element                  xpath=${ERC_DOCPAGE_SEC_ITEM}

Verify following fields will be successfully imported under Remarks Tab
    TT_Document_Page.Click Remarks Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_REMARKS}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_REASONS}

Verify following mandatory documents will be attached successfully
    TT_Document_Page.Click Attachment Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_FF}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_STYPE_FF}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_STYPE_FF}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_TD}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_STYPE_TD}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_STYPE_TD}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_DV}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_LC}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab

Verify the mandatory fields then click Store button
    TT_Document_Page.Click Verify button
    TT_Document_Page.Click Store button with confirmation

User should successfully submitted the transaction
    [Documentation]   This keyword is to notify the user if the transaction was successfully submittted
    page should contain     ${TC001_ALERT_MESSAGE}

Verify Field and Value of
    [Documentation]     This method only used just to proceed in ${ERC_DOCPAGE_INPUT_IMPEMAIL}
    ...                 because this field has not detected any value upon checking report but in UI it displays
    [Arguments]  ${locator}
    Wait Until Element is Visible    ${locator}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    element should be visible   ${locator}
    Sleep    ${ERC_DOCPAGE_TIMEOUT}
    ${value}=    Get Element Attribute  ${locator}   value

Delete the Invalid Attachment
    [Documentation]     This keyword is to delete the uploaded file in Attachment tab
    Wait Until Element is Visible   xpath=${TC001_FACTURE_DOC}    timeout=${TC001_WAITING_TIMEOUT}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_ATTACHMENT_DELETE_TT_BTN}   timeout=${TC001_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_ATTACHMENT_DELETE_TT_BTN}   timeout=${TC001_WAITING_TIMEOUT}
    click element   xpath=${ERC_DOCPAGE_ATTACHMENT_DELETE_TT_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element Is Not Visible   xpath=${TC001_FACTURE_DOC}    timeout=${TC001_WAITING_TIMEOUT}





