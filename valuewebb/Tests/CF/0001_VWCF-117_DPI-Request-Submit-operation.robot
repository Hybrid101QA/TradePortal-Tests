*** Settings ***
Documentation    Test Case 001 VWCF-117. This Test Case is used to create end to end transaction (Stored-Submit)
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
${TC001_WAITING_TIMEOUT}  20s
${TC001_SLEEP_TIMEOUT}  0.5s
${TC001_IMPORT_XML_FULLPATH}                ${EXECDIR}/Resources/TVF_Module/Data/CF/DVT-84443.xml
${TC001_IMPORT_XML_ERROR_MESSAGE_1}         User Reference is Mandatory
${TC001_HEADER}                             CREATE TRANSACTION VIRTUAL FOLDER (TVF) - IMPORT
${TC001_USER_REFERENCE}                     ERC
${TC001_TESTCASE_REFERENCE}                 001
${TC001_USER_CUSTOMS_OFFICE}                GU005
${TC001_IMPORT_PHONE}                       70012345
${TC001_ATTACHMENTS_DOC_CODE}               \#01
${TC001_ATTACHMENTS_DOC_REF}                M2
${TC001_ATTACHMENTS_AMOUNT_PAID}            10000
${TC001_ATTACHMENTS_DOC_DATE}               TODAY
${TC001_ATTACHMENTS_DOC_FILE}               ${EXECDIR}/Resources/TVF_Module/Data/CF/SingleDPIVReport.pdf
${TC001_TITLE_PAGE}                         eDouanes Central Africa - DPI
${TC001_FACTURE_DOC}                        //td[contains(text(), 'Facture commerciale' )]
${TC001_DTYPE_FF}                           FACTURE FINALE
${TC001_STYPE_FF}                           FI Initial
${TC001_DTYPE_TD}                           Transport Document
${TC001_STYPE_TD}                           Master BL Initial
${TC001_DTYPE_DV}                           DECLARATION DE VALEUR
${TC001_REF_NO}                             This is a testing
${TC001_ALERT_MESSAGE}                      Submit operation is done. The status of the document is Submitted


*** Test Cases ***
Test Case 001 VWCF-117 DPI Request Submit operation
    [Tags]    Smoke
    [Setup]   Auto-generate of specific details
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
Auto-generate of specific details
    [Documentation]     This keyword used to generate unique details for User Reference
    ${current_date}=      Get Current Date             result_format=%H%M%S%y%m%d     exclude_millis=yes
    Set Suite Variable    ${TC001_USER_REFERENCE}       ${current_date}${TC001_TESTCASE_REFERENCE}
    Set Suite Variable    ${TC001_ATTACHMENTS_DOC_REF}  ${current_date}${TC001_TESTCASE_REFERENCE}

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
    Main_Page.Click Fill TVF Import        ${TC001_HEADER}
    Main_Page.Import XML File from         ${TC001_IMPORT_XML_FULLPATH}
    Wait Until Page Contains               ${TC001_IMPORT_XML_ERROR_MESSAGE_1}   timeout=${TC001_WAITING_TIMEOUT}
    Main_Page.Verify the Value of Customs Office under Header Tab    ${TC001_USER_CUSTOMS_OFFICE}

User to fill the mandatory fields prior to Validate operation
    [Documentation]     Test Step Precondition Sub Part 3
    Main_Page.Input User Reference under Header Tab                  ${TC001_USER_REFERENCE}
    Main_Page.Click Attachment Tab
    Main_Page.Input Doc Code under Attachments Tab                   ${TC001_ATTACHMENTS_DOC_CODE}
    Main_Page.Input Doc Ref under Attachments Tab                    ${TC001_ATTACHMENTS_DOC_REF}
    Main_Page.Input Doc Date under Attachments Tab                   ${TC001_ATTACHMENTS_DOC_DATE}
    Main_Page.Upload File under Attachments Tab                      ${TC001_ATTACHMENTS_DOC_FILE}  ${TC001_ATTACHMENTS_AMOUNT_PAID}

User to Validate operation
    [Documentation]     Test Step Precondition Sub Part 5
    Main_Page.Click Validate Button and Yes to Confirm Operation
    Main_Page.Check Validate Operation if Success

User should already perform Generate DPIV operation on Attachment tab
    Main_Page.Click Authorization Tab
    Main_Page.Generate DPIV under Authorization Tab
    Main_Page.Navigate to E-Ruling Center    ${TC001_TITLE_PAGE}
    TT_Document_Page.Switch ERC Application to English
    TT_Document_Page.Detect Language used in ERC Application Page

Verify all details on the following fields will be successfully imported from TVF to ERC in Header tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TVF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_TVFDATE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_ITEMNO}

Verify following fields will be successfully imported under Names & Parties Tab
    TT_Document_Page.Click Names & Parties Tab
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_IMP}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_IMPEMAIL}
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
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_PLACELOADING}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_SUGGEST_DISCHARGE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTAL_PACKING}
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
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALCIF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TOTALDUTIABLE}
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
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_TD}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_STYPE_TD}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab           ${TC001_DTYPE_DV}
    TT_Document_Page.Input Reference Number under Attachments Tab   ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab

Verify the mandatory fields then click Store button
    TT_Document_Page.Click Verify button
    TT_Document_Page.Enter/Modify Field Details of   xpath=${ERC_DOCPAGE_INPUT_IMPTEL}   ${TC001_IMPORT_PHONE}
    TT_Document_Page.Click Store button with confirmation


User should successfully submitted the transaction
    [Documentation]   This keyword is to notify the user if the transaction was successfully submittted
    page should contain     ${TC001_ALERT_MESSAGE}



