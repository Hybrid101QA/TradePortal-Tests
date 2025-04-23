*** Settings ***
Documentation    Test Case 001 SWERCBJ-286. This Test Case is used for Submit Trade Transaction with loaded TVF
...              exist only in QA environment
Library     SeleniumLibrary
Library     BuiltIn
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/ERC_Module/ERC_Setup_Teardown.robot
Resource    ../../Resources/ERC_Module/Page_Objects/TT_Document_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/SearchTT_Requests_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/Main_Page.robot
Resource    ../../Resources/ERC_Module/Page_Objects/Login_Page.robot
Resource    ../../Resources/TVF_Module/Page_Objects/TVF_Login_Page.robot
Suite Setup     User to Open Browser
Suite Teardown    User to Close Browser

*** Variables ***
${TC001_SLEEP_TIMEOUT}  0.5s
${TC001_IMPORT_XML_FULLPATH}              ${EXECDIR}/Resources/TVF_Module/Data/BJ/TVF-128963.xml
${TC001_ATTACHMENTS_DOC_FILE}             ${EXECDIR}/Resources/TVF_Module/Data/BJ/SingleDPIVReport.pdf
${TC001_HEADER}                           CREATE TRANSACTION VIRTUAL FOLDER (TVF) - IMPORT
${TC001_USER_REFERENCE}                   ERC
${TC001_IMPORT_XML_ERROR_MESSAGE_1}       User Reference is Mandatory
${TC001_TESTCASE_REFERENCE}               001
${TC001_ATTACHMENTS_DOC_CODE}             325
${TC001_ATTACHMENTS_DOC_DATE}             TODAY
${TC001_TVF_NUMBER}                       8832
${TC001_TVF_DATE}                         TODAY
${TC001_INSURANCE_VAL}                    2,000.00
${TC001_WAITING_TIMEOUT}                  20s
${TC001_USER_CUSTOMS_OFFICE}              BJA04
${TC001_ALERT_CUSTOMS_OFC}                //a[contains(text(), 'Customs Office: Value is required')]
${TC001_ALERT_HSC_PCKNO}                  //a[contains(text(), 'Item #1: Package Number should be greater than 0')]
${TC001_ALERT_SUBMITTED}                  Submit operation is done.
${TC001_SAVEPD_BTN}                       //a[@id='updatePd']
${TC001_STATUS}                           Stored
${TC001_CUSTOM_OFC}                       BJB02
${TC001_PHONE}                            90011245
${TC001_PACKAGE_NO}                       1
${TC001_PACKAGE_TYPE}                     AE
${TC001_REF_NO}                           AutoSWERCBJ28
${TC001_FF}                               FI
${TC001_FF_STYPE}                         FI Revised
${TC001_TD}                               Transport Document
${TC001_TD_STYPE}                         LTA Revised
${TC001_DAF}                              DV


*** Test Cases ***
Test Case 001 SWERCBJ-286 Request Submit operation Load TVF data
    [Tags]    Functional
    [Setup]     Auto-generate of specific details
    Given User should already created transaction from TVF application with Validated status
    When Open the ERC Application
    And User to change the French Translation to English
    And Click Request AVD
    And Enter the created TVF record in TVF Number with TVF Date then click download icon button
    And Enter the details of the following mandatory fields:
    And Click Store button
    And Verify all details on the following fields will be successfully imported from TVF to ERC in Header tab
    And Verify following fields will be successfully imported under Names & Parties Tab
    And Verify following fields will be successfully imported under Transport Tab
    And Verify following fields will be successfully imported under Financial Tab
    And Verify following fields will be successfully imported under Goods Tab
    And Verify following fields will be successfully imported under Remarks Tab
    Then Open again the recently Stored transaction
    And Verify following mandatory documents will be attached successfully
    And Click Submit button
    Then User should successfully submitted the transaction with Load TVF Data

*** Keywords ***
Auto-generate of specific details
    [Documentation]     This keyword used to generate unique details for User Reference
    ${current_date}=      Get Current Date             result_format=%H%M%S%y%m%d     exclude_millis=yes
    Set Suite Variable    ${TC001_USER_REFERENCE}       ${current_date}${TC001_TESTCASE_REFERENCE}

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
    Main_Page.Input Doc Ref under Attachments Tab                    ${TC001_REF_NO}
    Main_Page.Input Doc Date under Attachments Tab                   ${TC001_ATTACHMENTS_DOC_DATE}
    Main_Page.Upload File under Attachments Tab                      ${TC001_ATTACHMENTS_DOC_FILE}

User to Validate operation
    [Documentation]     Test Step Precondition Sub Part 5
    Main_Page.Click Validate Button and Yes to Confirm Operation
    Main_Page.Check Validate Operation if Success
    Verify the TVF Number was generated

Verify the TVF Number was generated
    [Documentation]   This keyword used to use the tvf number in eRC
    Main_Page.Click Header Tab
    ${TC001_TVF_NUMBER}=    Main_Page.Get TVF Number from Header Tab
    Set Suite Variable       ${TC001_TVF_NUMBER}       ${TC001_TVF_NUMBER}

Open the ERC Application
    Execute Javascript    window.open('')
    Switch Window   NEW   timeout=${TC001_WAITING_TIMEOUT}
    Go To   ${GLOBAL_ERC_SERVER_URL}

User to change the French Translation to English
    Login_Page.ERC Page should be in English
    Login_Page.Detect Language used in ERC Page

Enter the created TVF record in TVF Number with TVF Date then click download icon button
    TT_Document_Page.Input TVF Number under Header Tab  ${TC001_TVF_NUMBER}
    TT_Document_Page.Input TVF Date under Header Tab     ${TC001_TVF_DATE}
    TT_Document_Page.Click the Import icon button
    Sleep   ${TC001_SLEEP_TIMEOUT}

Enter the details of the following mandatory fields:
    TT_Document_Page.Click Names & Parties Tab
    TT_Document_Page.Enter/Modify Field Details of      xpath=${ERC_DOCPAGE_INPUT_IMPTEL}    ${TC001_PHONE}
    Enter details for Customs Office
    #Enter Package Number for the HSC item

Enter details for Customs Office
    TT_Document_Page.Click Transport Tab
    Wait Until Page Contains Element  xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}     timeout=${TC001_WAITING_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of  xpath=${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}  ${TC001_CUSTOM_OFC}

Enter Package Number for the HSC item
    TT_Document_Page.Click Verify button
    Wait Until Element is Visible   xpath=${TC001_ALERT_HSC_PCKNO}   timeout=${TC001_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TC001_ALERT_HSC_PCKNO}   timeout=${TC001_WAITING_TIMEOUT}
    Sleep   ${TC001_SLEEP_TIMEOUT}
    Scroll Element Into View  xpath=${TC001_ALERT_HSC_PCKNO}
    click element   ${TC001_ALERT_HSC_PCKNO}
    Wait Until Page Contains Element  xpath=${ERC_DOCPAGE_INPUT_PACKNO}   timeout=${TC001_WAITING_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of     xpath=${ERC_DOCPAGE_INPUT_PACKNO}   ${TC001_PACKAGE_NO}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC001_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}   timeout=${TC001_WAITING_TIMEOUT}
    TT_Document_Page.Enter/Modify Field Details of    xpath=${ERC_DOCPAGE_SUGGEST_PACKTYPE}    ${TC001_PACKAGE_TYPE}
    click element   ${TC001_SAVEPD_BTN}

Click Store button
    TT_Document_Page.Store operation
    TT_Document_Page.Close the Confirmation Dialog box

Verify all details on the following fields will be successfully imported from TVF to ERC in Header tab
    TT_Document_Page.Value of the Element Field  xpath=${ERC_DOCPAGE_TTID_LOCATOR}
    TT_Document_Page.Value of the Element Field  xpath=${ERC_DOCPAGE_TTDATE_LOCATOR}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_TVF}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_TVFDATE}
    TT_Document_Page.Verify Field and Value of   xpath=${ERC_DOCPAGE_INPUT_ITEMNO}

Verify following fields will be successfully imported under Names & Parties Tab
    TT_Document_Page.Click Names & Parties Tab
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_IMP}
    #TT_Document_Page.Value of the Element Field     xpath=${ERC_DOCPAGE_IMP_NAME}
    TT_Document_Page.Value of the Element Field     xpath=${ERC_DOCPAGE_IMP_ADDRESS}
    TT_Document_Page.Value of the Element Field     xpath=${ERC_DOCPAGE_IMP_CTY}
    TT_Document_Page.Value of the Element Field     xpath=${ERC_DOCPAGE_IMP_CTYNAM}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_IMPEMAIL}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_IMPTEL}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_EXPNAM}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_EXPADD}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_EXPCTY}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_COUNTRY}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_DEC}
    TT_Document_Page.Value of the Element Field     xpath=${ERC_DOCPAGE_DEC_ADRESS}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_CONTACT}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_PHONENUM}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_APPEMAIL}

Verify following fields will be successfully imported under Transport Tab
    TT_Document_Page.Click Transport Tab
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_COS}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_CARRIER}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_BLNO}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_DAT_BLDATE}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_VOYAGENO}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_TRANSPORTNO}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_MOT}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_NETMASS}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_GROSSMASS}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_PLACELOADING}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_DISCHARGE}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_FCLNO}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_LCLNO}
    Page Should Contain Element                     xpath=${ERC_DOCPAGE_SEC_CONT}

Verify following fields will be successfully imported under Financial Tab
    TT_Document_Page.Click Financial Tab
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_INVREF}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_DAT_INV}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_CURRENCY}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_TOTALFOB}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_TOTALFREIGHT}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_TOTALINSURANCE}
    #TT_Document_Page.Verify Field and Value of     xpath=${ERC_DOCPAGE_INPUT_OTHER_CHARGES}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_TOTALCIF}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_INC}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_TOTALINV}
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_SUGGEST_PAYMENT}

Verify following fields will be successfully imported under Goods Tab
    TT_Document_Page.Click Goods Tab
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_GDESC}
    Page Should Contain Element                     xpath=${ERC_DOCPAGE_SEC_ITEM}

Verify following fields will be successfully imported under Remarks Tab
    TT_Document_Page.Click Remarks Tab
    TT_Document_Page.Verify Field and Value of      xpath=${ERC_DOCPAGE_INPUT_REMARKS}

Open again the recently Stored transaction
    SearchTT_Requests_Page.Click Search link
    SearchTT_Requests_Page.Select Status of Transaction     ${TC001_STATUS}
    SearchTT_Requests_Page.Click Search button
    SearchTT_Requests_Page.Click Edit Icon button

Verify following mandatory documents will be attached successfully
    TT_Document_Page.Click Attachment Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC001_TD}
    TT_Document_Page.Input Reference Number by Selection under Attachments Tab   ${TC001_TD_STYPE}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC001_FF}
    TT_Document_Page.Input Reference Number by Selection under Attachments Tab   ${TC001_FF_STYPE}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Input Doc Type under Attachments Tab    ${TC001_DAF}
    TT_Document_Page.Enter Reference Number under Attachments Tab    ${TC001_REF_NO}
    TT_Document_Page.Upload and Add File under Attachments Tab
    TT_Document_Page.Click Verify button

User should successfully submitted the transaction with Load TVF Data
    [Documentation]   This keyword is to notify the user if the transaction was successfully submittted
    page should contain     ${TC001_ALERT_SUBMITTED}
