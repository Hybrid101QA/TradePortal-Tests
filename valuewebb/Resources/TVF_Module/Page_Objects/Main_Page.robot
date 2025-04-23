*** Settings ***
Documentation     This resource file is used for keywords in TVF Main page and Main columns
Library           SeleniumLibrary
Library           BuiltIn
Library           String

*** Variables ***
${TVF_MAINPAGE_SLEEP_TIMEOUT}                       0.5s
${TVF_MAIN_LONG_SLEEP_TIMEOUT}                      3s
${TVF_MAINPAGE_WAITING_TIMEOUT}                     40s
${TVF_MAINPAGE_WINDOW_TITLE_CG}                     eDouanes Congo - Trade
${TVF_MAINPAGE_WINDOW_TITLE_CF}                     Single Window for Foreign Trade, Central Africa
${TVF_MAINPAGE_WINDOW_TITLE_BJ}                     TVF - Single Window for Foreign Trade, Benin
${TVF_MAINPAGE_WINDOW_TITLE_CI}                     Single Window for Foreign Trade, Côte d'Ivoire - TVF
${TVF_MAINPAGE_FILL_TVF_IMPORT_LINK}                //a[contains(@onclick,"IM") or contains(@href, 'IM')]
${TVF_MAINPAGE_HOME_BAR}                            //li[@navbaractive="home"]
${TVF_MAINPAGE_FILL_TVF_IMPORT_HEADER_CG_CF_BJ}      CREATE TRANSACTION VIRTUAL FOLDER (TVF) - IMPORT
${TVF_MAINPAGE_FILL_TVF_IMPORT_HEADER_CI}            Fill Import TVF
${TVF_MAINPAGE_WARNING_MODAL}                       Notice!
${TVF_MAINPAGE_USER_PROFILE}                        //button[@class="btn btn-default btn-transparent"]
${TVF_MAINPAGE_USER_LOGOUT}                         //a[@href="/tvf/logout?lang=en"]
${TVF_MAINPAGE_EDIT_ICON}                           //span[@class='glyphicon glyphicon-pencil']
${TVF_MAINPAGE_EDIT_DOCUMENT}                       //a[contains(@href, "/tvf/tvfGen/edit") or contains(@href, "/tvf/tvfGen/edit")]
${TVF_MAINPAGE_IMPORT_XML_BTN}                      //a[@id="xmlImportButton"]
${TVF_MAINPAGE_CHOOSEFILE_BTN}                      //input[@id="xmlFile"]
${TVF_MAINPAGE_IMPORT_FROM_XML_BTN}                 (//input[@id="startUpload"])[2]
${TVF_MAINPAGE_VALIDATE_BUTTON}                     //input[@id="operationValidateNew"]
${TVF_MAINPAGE_BUTTON_AFTER_SEARCH}                 //input[@id="operationValidate"]
${TVF_MAINPAGE_VALIDATE_BUTTON_FROM_QUERY}          //input[@id="operationValidateQueried"]
${TVF_MAINPAGE_DOMICILIATE_BUTTON}                  //input[@id='operationDomicilateAuth']
${TVF_MAINPAGE_AUTHORIZE_BUTTON}                    //input[@id='operationAuthorize']
${TVF_MAINPAGE_VALIDATE_CONFIRM_OPER}               //a[@id="confirmOper"]
${TVF_MAINPAGE_WARNING_CHECKBOX}                    //input[@id="warningCheckbox"]
${TVF_MAINPAGE_WARNING_CONFIRM_OPER}                //a[@id="warningOper"]
${TVF_MAINPAGE_VALIDATE_SUCCESS_DONE}               Validate operation is done.
${TVF_MAINPAGE_DOMICILIATE_SUCCESS_DONE}            Domiciliate operation is done.
${TVF_MAINPAGE_AUTHORIZE_SUCCESS_DONE}              Authorize operation is done.
${TVF_MAINPAGE_HEADER_TAB}                          //a[@href="#header"]
${TVF_MAINPAGE_HEADER_TAB_TVF_NUMBER}               //label[@id="trNumber"]
${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB}               //a[@href="#parties"]
${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_TEXT_VALUE}      Importer Details
${TVF_MAINPAGE_INPUT_IMPEMAIL}                        //input[@id="impEmail"]
${TVF_MAINPAGE_INPUT_EXPEMAIL}                        //input[@id="expEmail"]
${TVF_MAINPAGE_INPUT_EXPCTY}                          //input[@id="expCity"]
${TVF_MAINPAGE_FINANCIAL_TAB}                         //a[@href="#financial"]
${TVF_MAINPAGE_FINANCIAL_TAB_DOM_REF}                 //input[@id="domiciliationRef"]
${TVF_MAINPAGE_AUTHORIZATIONS_TAB}                    //a[@href="#authorizations"]
${TVF_MAINPAGE_HEADER_TAB_USER_REFERENCE}             //input[@id="usrReference"]
${TVF_MAINPAGE_HEADER_TAB_DI_NUMBER}                  //input[@id="diNumber"]
${TVF_MAINPAGE_HEADER_TAB_DOMICILIATION}              //input[@id='domiciliationBank']
${TVF_MAINPAGE_HEADER_TAB_RUBRIQUE}                   //input[@id="rubrique"]
${TVF_MAINPAGE_HEADER_TAB_CHAPTERCOD}                 //input[@id="chapterCode"]
${TVF_MAINPAGE_HEADER_TAB_CODENAM}                    //input[@id="codeNaema"]
${TVF_MAINPAGE_HEADER_TAB_CODEPRE}                    //input[@id="codePrefecture"]
${TVF_MAINPAGE_HEADER_TAB_MCAC}                       //input[@id="mcac"]
${TVF_MAINPAGE_CUSTOMS_OFFICE}                        //input[@id="cuoCode"]
${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_IMPORT_PHONE}    //input[@id="impPhone"]
${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}            //select[@id='supRelationship']
${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}            //select[@id="invType"]
${TVF_MAINPAGE_FINANCIAL_TAB_TEXT_VALUE}              Invoice
${TVF_MAINPAGE_ATTACHMENTS_TAB}                       //a[@href="#attachments"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_HEADER_TEXT}            List of Attachments
${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}              //input[@id="docCode"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_REF}               //input[@id="docRef"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE}              //input[@id="docDate"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE_TODAY}        //td[contains(@class, "today")]
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE_BUTTON}    //a[@id="addUploadFile"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE_DIALOG}     Upload Dialog Box
${TVF_MAINPAGE_ATTACHMENTS_TAB_CHOOSE_A_FILE_UPLOAD}   //input[@id="attDoc"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_AMOUNT_PAID_INPUT}      //input[@id="amountPaid"]
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE}            //input[@id="startUpload" and contains(@value, "Upload")]
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_PROCESSING}      Processing
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_CONFIRM}         Attachment has been added
${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_CONFIRM_ALERT}   //div[@id="alertInfo"]
${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER}                //img[@id="thumbnailImg2"]
${TVF_MAINPAGE_GENERATE_DPIV_LINK}                      //a[@id="generateAvdLink"]
${TVF_MAINPAGE_AUTHORIZATIONS_TAB_GENERATE_AVD_MOUSE_OVER}      //img[contains(@src,"AVD_Thumbnail") and not(contains(@id, "thumbnailImg"))]
${TVF_MAINPAGE_AUTHORIZATIONS_TAB_GENERATE_AVD_CLICK_LINK}      //a[@id="generateAvdLink"]
${TVF_MAINPAGE_SWITCH_ENGLISH_BUTTON}                           //a[contains(@href, "/tvf/?lang=en") or contains(@href, "tvfGen/list?lang=en")]



*** Keywords ***
Click Fill TVF Import
    [Documentation]     This Keyowrd is used to click Fill TVF-Import
    [Arguments]     ${header}
    Wait Until Element is Visible  xpath=${TVF_MAINPAGE_FILL_TVF_IMPORT_LINK}      timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled  xpath=${TVF_MAINPAGE_FILL_TVF_IMPORT_LINK}      timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Sleep                          ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Click Link                     xpath=${TVF_MAINPAGE_FILL_TVF_IMPORT_LINK}
    Wait Until Page Contains       ${header}         timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Import XML File from
    [Documentation]                      This keyword is used to import an XML File. ${file_to_upload} argument is mandatory which is the location of the XML file
    [Arguments]                          ${file_to_upload}
    Scroll Element into View             xpath=${TVF_MAINPAGE_IMPORT_XML_BTN}
    Set Focus to Element                 xpath=${TVF_MAINPAGE_IMPORT_XML_BTN}
    Sleep                                ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Click Element                        xpath=${TVF_MAINPAGE_IMPORT_XML_BTN}
    Wait Until Element is Enabled        xpath=${TVF_MAINPAGE_CHOOSEFILE_BTN}      timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Choose File                          xpath=${TVF_MAINPAGE_CHOOSEFILE_BTN}      ${file_to_upload}
    Wait Until Element is Enabled        xpath=${TVF_MAINPAGE_IMPORT_FROM_XML_BTN}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Sleep                                ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Click Element                        xpath=${TVF_MAINPAGE_IMPORT_FROM_XML_BTN}
    ${keyword_timeout}=  Set Variable  ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_timeout}=    Set Variable  ${TVF_MAIN_LONG_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds  ${keyword_timeout}  ${retry_timeout}   Wait Until Element is Not Visible    xpath=${TVF_MAINPAGE_IMPORT_FROM_XML_BTN}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}


Verify the Value of Customs Office under Header Tab
    [Documentation]    This Keyword verifies the value of the Customs Office Locator
    ...                This only works after Import XML had been executed, otherwise, the value never changed even Input a new one
    ...                This must be used to verify the value of Customs Office after Import XML only
    [Arguments]        ${customs_office_value}
    ${keyword_timeout}=  Set Variable  ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_timeout}=    Set Variable  ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds  ${keyword_timeout}  ${retry_timeout}  Element Attribute Value Should Be  xpath=${TVF_MAINPAGE_CUSTOMS_OFFICE}  value  ${customs_office_value}

Set Focus to Home Bar
    [Documentation]    This keyword is used to just set the mouse focus to Home Bar
    ...                mainly to avoid mouse hovering on other bars, resulting to other elements not visible for automation
    Scroll Element Into View  xpath=${TVF_MAINPAGE_HOME_BAR}
    Set Focus To Element      xpath=${TVF_MAINPAGE_HOME_BAR}

Click Header Tab
    [Documentation]     This keyword used to navigate Header Tab
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_HEADER_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_HEADER_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Set Focus To Element             xpath=${TVF_MAINPAGE_HEADER_TAB}
    click element   xpath=${TVF_MAINPAGE_HEADER_TAB}

Input User Reference under Header Tab
    [Arguments]        ${user_reference_input}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_USER_REFERENCE}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_USER_REFERENCE}      ${user_reference_input}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_USER_REFERENCE}      RETURN

Input DI Number under Header Tab
    [Documentation]    This Keyword is used to input DI Number nuder Header tab
    [Arguments]        ${di_number_input}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_DI_NUMBER}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_DI_NUMBER}      ${di_number_input}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_DI_NUMBER}      RETURN

Input Domiciliation Number under Header Tab
    [Documentation]    This Keyword is used to input Domiciliation Bank Number under Header tab
    [Arguments]        ${dom_num}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_DOMICILIATION}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_DOMICILIATION}      ${dom_num}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_DOMICILIATION}      RETURN

Input Rubrique under Header Tab
    [Documentation]    This Keyword is used to input Rubrique in Nature of Activities Declared
    [Arguments]        ${rubrique}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_RUBRIQUE}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_RUBRIQUE}     ${rubrique}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_RUBRIQUE}     RETURN

Input Chapter Code under Header Tab
    [Documentation]    This Keyword is used to input Chapter Code in Nature of Activities Declared
    [Arguments]        ${chapter_cod}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_CHAPTERCOD}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_CHAPTERCOD}     ${chapter_cod}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_CHAPTERCOD}     RETURN

Input Codename under Header Tab
    [Documentation]    This Keyword is used to input Codename in Nature of Activities Declared
    [Arguments]        ${cod_nam}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_CODENAM}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_CODENAM}     ${cod_nam}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_CODENAM}     RETURN

Input Code Prefecture under Header Tab
    [Documentation]    This Keyword is used to input Code Prefecture in Nature of Activities Declared
    [Arguments]        ${cod_pref}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_CODEPRE}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_CODEPRE}     ${cod_pref}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_CODEPRE}     RETURN

Input MCAC under Header Tab
    [Documentation]    This Keyword is used to input MCAC in Nature of Activities Declared
    [Arguments]        ${mcac}
    Click Element      xpath=${TVF_MAINPAGE_HEADER_TAB_MCAC}
    Input Text         xpath=${TVF_MAINPAGE_HEADER_TAB_MCAC}     ${mcac}
    Press Keys         xpath=${TVF_MAINPAGE_HEADER_TAB_MCAC}     RETURN

Click Names And Parties Tab
    [Documentation]     This keyword used to navigate Names and Parties Tab
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Set Focus To Element             xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB}
    click element   xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB}
    Wait Until Page Contains             ${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_TEXT_VALUE}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Input Importer Phone Number
    [Documentation]     This keyword used to input Phone number on Importer
    [Arguments]     ${phone}
    Wait Until Element is Visible    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_IMPORT_PHONE}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_IMPORT_PHONE}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    input text      xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_IMPORT_PHONE}    ${phone}
    Press Keys      xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_IMPORT_PHONE}       RETURN

Select Supplier Relationship
    [Documentation]     This keyword used to select Supp Rel on dropdown
    [Arguments]     ${type}
    Wait Until Element is Visible    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    click element    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}
    select from list by label    xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}    ${type}
    Press Keys      xpath=${TVF_MAINPAGE_NAMES_AND_PARTIES_TAB_SUPP}       RETURN

Click Financial Tab
    [Documentation]     This keyword used to navigate Financial Tab
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_FINANCIAL_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_FINANCIAL_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Set Focus To Element            xpath=${TVF_MAINPAGE_FINANCIAL_TAB}
    Sleep   ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    click element   xpath=${TVF_MAINPAGE_FINANCIAL_TAB}
    Wait Until Page Contains             ${TVF_MAINPAGE_FINANCIAL_TAB_TEXT_VALUE}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Select Invoice Type
    [Documentation]     This keyword used to select Invoice Types on dropdown
    [Arguments]     ${type}
    Wait Until Element is Visible    xpath=${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    click element    xpath=${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}
    select from list by label    xpath=${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}    ${type}
    Press Keys      xpath=${TVF_MAINPAGE_FINANCIAL_TAB_INVOICE_TYPE}       RETURN

Click Attachment Tab
    [Documentation]     This keyword used to navigate Attachment Tab
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Set Focus To Element            xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB}
    click element   xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB}
    Wait Until Page Contains             ${TVF_MAINPAGE_ATTACHMENTS_TAB_HEADER_TEXT}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Input Doc Code under Attachments Tab
    [Documentation]           This Keyword is used to input Doc Code into the Attachement Input DOc Code
    [Arguments]               ${doc_code_input}
    Scroll Element Into View  xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}
    Set Focus to Element      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}
    Sleep                     ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Input Text                xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}      ${doc_code_input}
    Press Keys                xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}      RETURN
    Press Keys                xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_CODE}      TAB

Input Doc Ref under Attachments Tab
    [Documentation]
    [Arguments]        ${doc_ref_input}
    Click Element      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_REF}
    Input Text         xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_REF}       ${doc_ref_input}
    Press Keys         xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_REF}       RETURN

Input Doc Date under Attachments Tab
    [Documentation]
    [Arguments]        ${doc_date_input}=TODAY
    Set Focus to Element           xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE}
    Click Element                  xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE}
    Wait Until Element Is Visible  xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE_TODAY}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Click Element                  xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_DOC_DATE_TODAY}

Upload File under Attachments Tab
    [Documentation]
    [Arguments]                        ${upload_file}       ${amount_paid}=none
    Wait Until Element is Enabled      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE_BUTTON}       timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Click Element                      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE_BUTTON}
    Wait Until Element Is Visible      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_CHOOSE_A_FILE_UPLOAD}     timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Choose File                        xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_CHOOSE_A_FILE_UPLOAD}     ${upload_file}
    Run Keyword If                     '${amount_paid}' != 'none'
    ...        Input Text              xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_AMOUNT_PAID_INPUT}        ${amount_paid}
    Wait Until Element is Enabled      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE}              timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Click Element                      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE}
    Wait Until Element Is not Visible  xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_FILE}              timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Page Contains           ${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_CONFIRM}                 timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Visible      xpath=${TVF_MAINPAGE_ATTACHMENTS_TAB_UPLOAD_CONFIRM_ALERT}     timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Click Validate Button
    [Documentation]     This Keyword is used to validate the TVF Document
    Wait Until Element is Enabled        xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}              timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Scroll Element Into View             xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}
    Click Element                        xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}
    Page Should Contain     ${TVF_MAINPAGE_WARNING_MODAL}

Click OK to Confirm Operation
    Wait Until Element is Enabled      xpath=${TVF_MAINPAGE_WARNING_CHECKBOX}      timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Visible      xpath=${TVF_MAINPAGE_WARNING_CHECKBOX}     timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    click element   xpath=${TVF_MAINPAGE_WARNING_CHECKBOX}
    Wait Until Element is Enabled      xpath=${TVF_MAINPAGE_WARNING_CONFIRM_OPER}      timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    click element   xpath=${TVF_MAINPAGE_WARNING_CONFIRM_OPER}

Click Validate Button and Yes to Confirm Operation
    [Documentation]     This Keyword is used to validate the TVF Document
    Wait Until Element is Enabled        xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}              timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Scroll Element Into View             xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}
    Click Element                        xpath=${TVF_MAINPAGE_VALIDATE_BUTTON}
    Wait Until Element Is Visible        xpath=${TVF_MAINPAGE_VALIDATE_CONFIRM_OPER}        timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Click Element                        xpath=${TVF_MAINPAGE_VALIDATE_CONFIRM_OPER}

Get TVF Number from Header Tab
    [Documentation]    This Keyword is used after successful Validate Operation and TVF Numeber is displayed under Header Tab
    ...                Also this keyword also returns the tvf number as data output
    Wait Until Page Contains Element  xpath=${TVF_MAINPAGE_HEADER_TAB_TVF_NUMBER}             timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Visible     xpath=${TVF_MAINPAGE_HEADER_TAB_TVF_NUMBER}             timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${tvf_number}=     Get Text       ${TVF_MAINPAGE_HEADER_TAB_TVF_NUMBER}
    [Return]           ${tvf_number}

Check Validate Operation if Success
    [Documentation]
    ${retry_timeout}                Set Variable    ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}       Set Variable    ${TVF_MAIN_LONG_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   Wait Until Page Contains    ${TVF_MAINPAGE_VALIDATE_SUCCESS_DONE}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Check Domiciliate Operation if Success
    [Documentation]
    Wait Until Page Contains             ${TVF_MAINPAGE_DOMICILIATE_SUCCESS_DONE}         timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Check Authorize Operation if Success
    [Documentation]
    Wait Until Page Contains             ${TVF_MAINPAGE_AUTHORIZE_SUCCESS_DONE}         timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Click Authorization Tab
    [Documentation]     This keyword used to navigate Authorization Tab
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_AUTHORIZATIONS_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_AUTHORIZATIONS_TAB}    timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    click element   xpath=${TVF_MAINPAGE_AUTHORIZATIONS_TAB}

Generate DPIV under Authorization Tab
    [Documentation]     This keyword will generate DPIV and will redirected to new tab(ERC), xpath for
    ...                 Generate DPIV mouse over image will come over at last, it is better to determine how many xpath exist on it
    ...                 to Generate DPIV. However the exact link is unique, just need to mouse over the image before it could be clicakble
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${count}=   Get Element Count   xpath=${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER}
    ${mouse_over_xpath}         Set Variable If     '${count}' == '1'   ${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER}
    ...                     (${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER})[${count}]
    Wait Until Element is Visible   xpath=${mouse_over_xpath}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${mouse_over_xpath}   timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_timeout}                Set Variable    ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}       Set Variable    ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   mouse over  xpath=${mouse_over_xpath}
    Wait Until Element is Visible   xpath=${TVF_MAINPAGE_GENERATE_DPIV_LINK}     timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${TVF_MAINPAGE_GENERATE_DPIV_LINK}     timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}
    Click Element                   xpath=${TVF_MAINPAGE_GENERATE_DPIV_LINK}

Navigate to E-Ruling Center
    [Documentation]     This keyword will go to ERC application
    [Arguments]     ${title}
    ${retry_timeout}                Set Variable    ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}       Set Variable    ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   select window   title=${title}

Click Generate AVD Under Authorizations Tab
    [Documentation]        This Keyword is used to click Generate AVD and will go directly to eRC App
    ...                        TVF_DOCPAGE.Click Generate AVD Under Authorizations Tab
    ...                        Switch Window       NEW            timeout=timeout_tc             ### to switch on new tab
    ...                        ${TC_AVD_TAB}=      Switch Window  CURRENT                        ### to save the current tab selection
    ...                        Set Suite Variable  ${TC_AVD_TAB}  ${TC_AVD_TAB}                  ### to be able to use the variable in whole test suite
    ...                        ERC_DOCPAGE.Switch to AVD in ERC Application Module
    ${retry_timeout}=                 Set Variable      ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}=        Set Variable      ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds       ${retry_timeout}  ${retry_interval_timeout}    Mouse Over AVD Thumbnail and Click Generate AVD under Authorizations Tab    ${TVF_MAINPAGE_WAITING_TIMEOUT}


Mouse Over AVD Thumbnail and Click Generate AVD under Authorizations Tab
    [Documentation]    this keyword is used to mouse over AVD thumbnail and click generate
    ...                pls use "Click Generate AVD Under Authorizations Tab" for more optimize and smarter keyword
    [Arguments]        ${custom_timeout}=${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${mouse_over_xpath}=              Set Variable                ${TVF_MAINPAGE_AUTHORIZATIONS_TAB_GENERATE_AVD_MOUSE_OVER}
    ${click_link_xpath}=              Set Variable                ${TVF_MAINPAGE_AUTHORIZATIONS_TAB_GENERATE_AVD_CLICK_LINK}
    Wait Until Page Contains Element  xpath=${mouse_over_xpath}   timeout=${custom_timeout}
    Wait Until Element is Visible     xpath=${mouse_over_xpath}   timeout=${custom_timeout}
    Mouse Over                        xpath=${mouse_over_xpath}
    Wait Until Element is Visible     xpath=${click_link_xpath}   timeout=${custom_timeout}
    Wait Until Element is Enabled     xpath=${click_link_xpath}   timeout=${custom_timeout}
    Click Element                     xpath=${click_link_xpath}


Click Generate DPI Under Authorizations Tab
    [Documentation]        This Keyword is used to click Generate DPI and will go directly to eRC App
    ...                        TVF_DOCPAGE.Click Generate DPI Under Authorizations Tab
    ...                        Switch Window       NEW            timeout=timeout_tc             ### to switch on new tab
    ...                        ${TC_AVD_TAB}=      Switch Window  CURRENT                        ### to save the current tab selection
    ...                        Set Suite Variable  ${TC_AVD_TAB}  ${TC_AVD_TAB}                  ### to be able to use the variable in whole test suite
    ...                        ERC_DOCPAGE.Switch to AVD in ERC Application Module
    ${retry_timeout}=                 Set Variable      ${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}=        Set Variable      ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Wait Until Keyword Succeeds       ${retry_timeout}  ${retry_interval_timeout}    Mouse Over DPI Thumbnail and Click Generate AVD under Authorizations Tab    ${TVF_DOCPAGE_WAITING_TIME}


Mouse Over DPI Thumbnail and Click Generate AVD under Authorizations Tab
    [Documentation]    this keyword is used to mouse over DPI thumbnail and click generate
    ...                pls use "Click Generate DPI Under Authorizations Tab" for more optimize and smarter keyword
    [Arguments]        ${custom_timeout}=${TVF_MAINPAGE_WAITING_TIMEOUT}
    ${mouse_over_xpath}=              Set Variable                ${TVF_MAINPAGE_GENERATE_DPIV_MOUSE_OVER}
    ${click_link_xpath}=              Set Variable                ${TVF_MAINPAGE_AUTHORIZATIONS_TAB_GENERATE_AVD_CLICK_LINK}
    Wait Until Page Contains Element  xpath=${mouse_over_xpath}   timeout=${custom_timeout}
    Wait Until Element is Visible     xpath=${mouse_over_xpath}   timeout=${custom_timeout}
    Mouse Over                        xpath=${mouse_over_xpath}
    Wait Until Element is Visible     xpath=${click_link_xpath}   timeout=${custom_timeout}
    Wait Until Element is Enabled     xpath=${click_link_xpath}   timeout=${custom_timeout}
    Click Element                     xpath=${click_link_xpath}

Click to Logout
    [Documentation]     This keyword is used to perform logout operation from current user
    Click Element       xpath=${TVF_MAINPAGE_USER_PROFILE}
    Sleep               ${TVF_MAINPAGE_SLEEP_TIMEOUT}
    Click Element       xpath=${TVF_MAINPAGE_USER_LOGOUT}

Verify if User had been logout
    [Documentation]     This Keyword is used to verify if the user is logged out on the application
    Wait Until Page Does Not Contain Element  xpath=${TVF_MAINPAGE_FILL_TVF_IMPORT_LINK}  timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

Wait for the current page to load appropriately
    [Documentation]
    Wait For Condition   return window.jQuery != undefined && jQuery.active == 0           timeout=${TVF_MAINPAGE_WAITING_TIMEOUT}

