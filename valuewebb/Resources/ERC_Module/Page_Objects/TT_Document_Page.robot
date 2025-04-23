*** Settings ***
Documentation   This resource file used for keywords in ERC Document Pages, Columns and Buttons
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${ERC_DOCPAGE_TIMEOUT}                      1s
${ERC_DOCPAGE_WAITING_TIMEOUT}              40s
${ERC_DOCPAGE_TIMEOUT_INTERVAL}             5x

# Nav-Header Buttons
${ERC_DOCPAGE_IMPORTXML_BTN}                //a[@id='xmlImportButton']
${ERC_DOCPAGE_VERIFY_BTN}                   //a[@id='verify']
${ERC_DOCPAGE_STORE_BTN}                    //input[@id='operationStore']
${ERC_DOCPAGE_SUBMIT_BTN}                   //input[@id='operationSubmit']
${ERC_DOCPAGE_CANCEL_BTN}                   //input[@id='operationCancel']
${ERC_DOCPAGE_DELETE_BTN}                   //input[@id='delete']
${ERC_DOCPAGE_CLOSE_BTN}                    //a[contains(text(), 'Close')]
${ERC_DOCPAGE_UPDATE_STORED_BTN}            //input[@id='operationUpdate Stored']
${ERC_DOCPAGE_UPDATE_ACCEPTED_BTN}          //input[@id='operationUpdate Accepted']
${ERC_DOCPAGE_PRINT_BTN}                    //i[@class='icon-print']
${ERC_DOCPAGE_EXPORTXML_BTN}                //a[contains(@href, 'exportXML')]
${ERC_DOCPAGE_EXPORTSADXML_BTN}             //a[contains(@href, 'exportSADXML')]

# Tab - Header
${ERC_DOCPAGE_HEADER_TAB}                   //a[contains(text(),'Header')]
${ERC_DOCPAGE_INPUT_TVF}                    //input[@id='adNum']
${ERC_DOCPAGE_TVFDATE}                      //input[@id='adDate']
${ERC_DOCPAGE_DATE_TODAY}                   //td[contains(@class, "today")]
${ERC_DOCPAGE_INPUT_CUSTOMOFC}              //input[@id='cuoCode']
${ERC_DOCPAGE_DI_NO}                        //input[@id='diNum']
${ERC_DOCPAGE_INPUT_ITEMNO}                 //input[@id='pdsNbr']
${ERC_DOCPAGE_FDI-DAI_NO}                   //input[@id='idfNum']
${ERC_DOCPAGE_FDI-DAI_DATE}                 //input[@name='idfDate']
${ERC_DOCPAGE_UCR}                          //input[@id='ucrNum']
${ERC_DOCPAGE_TTID_LOCATOR}                 //div[@id="header"]/div/fieldset/div[1]/div/label
${ERC_DOCPAGE_TTDATE_LOCATOR}               //div[@id="header"]/div/fieldset/div[2]/div/label

# Tab - Names & Parties
${ERC_DOCPAGE_NAMPARTIES_TAB}               //a[contains(text(),'Names & Parties')]
${ERC_DOCPAGE_SUGGEST_IMP}                  //input[@id='impTin']
${ERC_DOCPAGE_IMP_NAME}                     //input[@id='impNam']
${ERC_DOCPAGE_IMP_ADDRESS}                  //label[@id="impAdr"]
${ERC_DOCPAGE_IMP_CTY}                      //label[@id="impCty"]
${ERC_DOCPAGE_IMP_CTYNAM}                   //label[@id="impCtyName"]
${ERC_DOCPAGE_INPUT_IMPEMAIL}               //input[@id="impEmail"]
${ERC_DOCPAGE_INPUT_IMPTEL}                 //input[@id='impTel']
${ERC_DOCPAGE_INPUT_EXPNAM}                 //input[@id='expNam']
${ERC_DOCPAGE_INPUT_EXPADD}                 //input[@id='expAdr']
${ERC_DOCPAGE_INPUT_EXPCTY}                 //input[@id='expCity']
${ERC_DOCPAGE_SUGGEST_COUNTRY}              //input[@id='expCty']
${ERC_DOCPAGE_SUGGEST_DEC}                  //input[@id='appTin']
${ERC_DOCPAGE_DEC_ADRESS}                   //label[@id="appAdr"]
${ERC_DOCPAGE_INPUT_PHONENUM}               //input[@id='appTel']
${ERC_DOCPAGE_INPUT_CONTACT}                //input[@id='appContactPerson']
${ERC_DOCPAGE_INPUT_APPEMAIL}               //input[@id='appEmail']
${ERC_DOCPAGE_DOWNLOAD_ICON}                //i[@class='icon-download']

# Tab - Transport
${ERC_DOCPAGE_TRANSPORT_TAB}                //a[@href="#transport"]
${ERC_DOCPAGE_DRPDWN_STYPE}                 //select[@name='partial']
${ERC_DOCPAGE_SUGGEST_COS}                  //input[@id='ctySupp']
${ERC_DOCPAGE_SUGGEST_CARRIER}              //input[@id='shipLine']
${ERC_DOCPAGE_INPUT_BLNO}                   //input[@id='blNum']
${ERC_DOCPAGE_DAT_BLDATE}                   //input[@id='blDate']
${ERC_DOCPAGE_INPUT_VOYAGENO}               //input[@id='voyageNum']
${ERC_DOCPAGE_INPUT_TRANSPORTNO}            //input[@id='vessel']
${ERC_DOCPAGE_SUGGEST_MOT}                  //input[@id='shipMod']
${ERC_DOCPAGE_INPUT_NETMASS}                //input[@id='netWgt']
${ERC_DOCPAGE_INPUT_GROSSMASS}              //input[@id='grsWgt']
${ERC_DOCPAGE_INPUT_TOTAL_PACKING}          //input[@id='totPck']
${ERC_DOCPAGE_SUGGEST_PLACERECEIPT}         //input[@id='placeOfReceipt']
${ERC_DOCPAGE_SUGGEST_PLACELOADING}         //input[@id='loadPort']
${ERC_DOCPAGE_SUGGEST_DISCHARGE}            //input[@id='dischargePort']
${ERC_DOCPAGE_SUGGEST_TRANSHIPMENT}         //input[@id='transshipPort']
${ERC_DOCPAGE_SUGGEST_CUSTOMOFC}            //input[@id='cuoCode']
${ERC_DOCPAGE_INPUT_FCLNO}                  //input[@id='fclNum']
${ERC_DOCPAGE_INPUT_LCLNO}                  //input[@id='lclNum']
${ERC_DOCPAGE_INPUT_MARKS}                  //textarea[@id='marks']
${ERC_DOCPAGE_SEC_CONT}                     //div[@id='containersDivContent']
${ERC_DOCPAGE_ADDCONT_BTN}                  //a[@id='addContainerLink']
${ERC_DOCPAGE_INPUT_CONTNO}                 //input[@id='number_1']
${ERC_DOCPAGE_SUGGEST_CARGOTYPE1}           //input[@id='cargoType_1']
${ERC_DOCPAGE_SUGGEST_CARGOTYPE2}           //input[@id='cargoType_2']
${ERC_DOCPAGE_DRPDWN_SIZE1}                 //select[@id='size_1']
${ERC_DOCPAGE_DRPDWN_LOADTYPE1}             //select[@id='loadingType_1']
${ERC_DOCPAGE_DRPDWN_LOADTYPE2}             //select[@id='loadingType_2']
${ERC_DOCPAGE_DRPDWN_LOADTYPE3}             //select[@id='loadingType_3']
${ERC_DOCPAGE_INPUT_SEAL1}                  //input[@id='sealNumber_1']
${ERC_DOCPAGE_DELETECONT_BTN1}              //a[@id='deleteContainer_1']

# Tab - Financial
${ERC_DOCPAGE_FINANCIAL_TAB}                //ul[@id='valueWebbTabs']//a[contains(text(),'Financial')]
${ERC_DOCPAGE_INPUT_INVREF}                 //input[@id='dInvNum']
${ERC_DOCPAGE_DAT_INV}                      //input[@id='invDat']
${ERC_DOCPAGE_SUGGEST_CURRENCY}             //input[@id='invCur']
${ERC_DOCPAGE_INPUT_TOTALFOB}               //input[@id='totFOBValD']
${ERC_DOCPAGE_INPUT_TOTALFREIGHT}           //input[@id='freightD']
${ERC_DOCPAGE_INPUT_TOTALCFR}               //input[@id='cfrD']
${ERC_DOCPAGE_INPUT_TOTALINSURANCE}         //input[@id='insuranceD']
${ERC_DOCPAGE_INPUT_TOTALDEDUCTIBLES}       //input[@id='deductiblesD']
${ERC_DOCPAGE_INPUT_TOTALCHARGES}           //input[@id='otherChargesD']
${ERC_DOCPAGE_INPUT_OTHER_CHARGES}          //input[@id='otherD']
${ERC_DOCPAGE_INPUT_TOTALCIF}               //input[@id='totCIFValD']
${ERC_DOCPAGE_INPUT_TOTALVALUE}             //input[@id='totValD']
${ERC_DOCPAGE_INPUT_TOTALDUTIABLE}          //input[@id='totDutValD']
${ERC_DOCPAGE_SUGGEST_INC}                  //input[@id='incoterm']
${ERC_DOCPAGE_SUGGEST_INCITEM}              //input[@id='incotermPerLine']
${ERC_DOCPAGE_SUGGEST_EXW}                  //input[@id='exwD']
${ERC_DOCPAGE_SUGGEST_TOTALINV}             //input[@id='totalInvoice']
${ERC_DOCPAGE_SUGGEST_PAYMENT}              //input[@id='modeOfPayment']

# Tab - Goods
${ERC_DOCPAGE_GOODS_TAB}                    //a[contains(text(),'Goods')]
${ERC_DOCPAGE_INPUT_GDESC}                  //textarea[@id='goodsDsc']
${ERC_DOCPAGE_INPUT_NO_ITEM}                //div[@id='pdsNbrContainer']/input[@id='pdsNbr']
${ERC_DOCPAGE_SEC_ITEM}                     //table[@id='itemsTable']
${ERC_DOCPAGE_ITEM_TABLE}                   //div[@id='itemsEditContainer']
${ERC_DOCPAGE_ADDITEM_BTN}                  //a[@id='addPd']
${ERC_DOCPAGE_SUGGEST_HSCODE}               //input[@name='hsCodeD']
${ERC_DOCPAGE_CHECKBOX}                     //input[@id='item-delete-1']
${ERC_DOCPAGE_INPUT_HSCDESC}                //input[@name='productDscD']
${ERC_DOCPAGE_INPUT_INCNUM}                 //input[@name='incotermValD']
${ERC_DOCPAGE_INPUT_QTYNUM}                 //input[@name='qtyD']
${ERC_DOCPAGE_SUGGEST_UNIT}                 //input[@name='unitD']
${ERC_DOCPAGE_SUGGEST_COO}                  //input[@name='ctyOrig']
${ERC_DOCPAGE_INPUT_NETWEIGHT}              //input[@name='netWeight']
${ERC_DOCPAGE_INPUT_GROSSWEIGHT}            //input[@name='grossWeight']
${ERC_DOCPAGE_INPUT_PACKNO}                 //input[@name='pkgNum']
${ERC_DOCPAGE_SUGGEST_PACKTYPE}             //input[@name='pkgTyp']
${ERC_DOCPAGE_CHECBOX_USED}                 //input[@id='used']
${ERC_DOCPAGE_INPUT_APPREMARKS}             //input[@name='applicantRemark']
${ERC_DOCPAGE_SAVEITEM_BTN}                 //a[@id='saveAddedItem']
${ERC_DOCPAGE_CANCELITEM_BTN}               //a[@id='cancelAddPd']
${ERC_DOCPAGE_EXPORT_ITEMS_BTN}             //a[contains(text(), 'Export Items')]
${ERC_DOCPAGE_IMPORT_ITEMS_BTN}             //a[contains(text(), 'Import Items')]

# Tab - Remarks
${ERC_DOCPAGE_REMARKS_TAB}                  //a[contains(text(),'Remarks')]
${ERC_DOCPAGE_INPUT_REMARKS}                //textarea[@id='remarks']
${ERC_DOCPAGE_INPUT_REASONS}                //textarea[@id='impPrp']

# Tab - Attachment
${ERC_DOCPAGE_ATTACHMENT_TAB}               //a[contains(text(),'Attachments')]
${ERC_DOCPAGE_REFERENCE_NUMBER}             //*[contains(@id, "docRef")]
${ERC_DOCPAGE_SUGGEST_DOCTYPE}              //input[@id='docType']
${ERC_DOCPAGE_DRPDWN_SELSUBTYPE}            //select[@id='docSubType']
${ERC_DOCPAGE_DRPDWN_INPUTSUBTYPE}          //input[@id='docSubType']
${ERC_DOCPAGE_INPUT_REFNO}                  //input[@id='docRef']
${ERC_DOCPAGE_SELECT_STYPE}                 //select[@id='docRef']
${ERC_DOCPAGE_INPUT_REF}                    //input[@id='referenceNumber']
${ERC_DOCPAGE_UPLOADFILE_BTN}               //a[@id='addUploadFile']
${ERC_DOCPAGE_ATTACHMENT_DELETE_TT_BTN}     //div[@class="actions"]//a[@id="del_1"]//i[@class="icon-trash"]
${ERC_DOCPAGE_ATTACHMENT_PATH}              ${EXECDIR}/Resources/ERC_Module/Data/SingleDPIVReport.pdf
${ERC_DOCPAGE_CONFIRM_ALERT}                //div[@id="alertInfo"]
${ERC_DOCPAGE_CONFIRM_ALERT_TEXT}           Attachment has been added
${ERC_DOCPAGE_AJAX_PROGRESS}                //div[@id="ajax_progress"]/img

# Prompt window - Upload Dialog
${ERC_DOCPAGE_CHOOSEFILE_BTN}               //input[@id='attDoc']
${ERC_DOCPAGE_CHOOSEFILE_DOC_BTN}           //input[@id='document']
${ERC_DOCPAGE_ADDXML_BTN}                   //input[@value='Import from  XML']
${ERC_DOCPAGE_ATTACHFILE_BTN}               //form[@action='/vw/attachment/uploadFile']//input[@id='startUpload']
${ERC_DOCPAGE_XMLFILE_BTN}                  //form[@action='/vw/xml/importXML']//input[@id='startUpload']
${ERC_DOCPAGE_ADDFILE_BTN}                  //div[@class='modal-footer']/input[@id='startUpload']
${ERC_DOCPAGE_ADDXLS_BTN}                   //input[@value='Upload + Add']
${ERC_DOCPAGE_ADDXMLFILE_BTN}               //input[@id='xmlFile']
${ERC_DOCPAGE_CLOSE_UPLOAD_DIALOG}          //div[@id='importXmlDialog']//a[@id='closeButton']

# Prompt window - Confirmation Dialog
${ERC_DOCPAGE_CONFIRM_YES_BTN}              //div[@id='confirmDialog']//a[@id='confirmOper']
${ERC_DOCPAGE_CONFIRM_NO_BTN}               //div[@id='confirmDialog']//a[@id='cancelOper']
${ERC_DOCPAGE_CONFIRM_SUBMIT_BTN}           //div[@id='operationSuccessModal']//a[@id='confirmOper']
${ERC_DOCPAGE_OVERRIDE_YES_BTN}             //a[@id='overrideConfirmOper']
${ERC_DOCPAGE_OVERRIDE_NO_BTN}              //a[@id='overrideCancelOper']
${ERC_DOCPAGE_CONFIRMATION_DIALOG}          //div[@class='wf-alert-scrolable alert alert-block alert-info']
${ERC_DOCPAGE_CONFIRMATION_CHECKBOX}        //input[@id='warningCheckbox']
${ERC_DOCPAGE_ALERT_WARNING_TITLE}          //h2[@class='warningHeader']
${ERC_DOCPAGE_WARNING_YES_BTN}              //a[@id='warningOper']
${ERC_DOCPAGE_WARNING_NO_BTN}               //a[@id='cancelWarnOper']
${ERC_DOCPAGE_WARNING_CLOSE_BTN}            //button[contains(text(), 'Close')]

# Language Selection
${ERC_DOCPAGE_ENGLISH_BUTTON}                 //a[contains(@href, 'lang=en') and contains(@title, 'Change language')]
${ERC_DOCPAGE_FRENCH_BUTTON}                  //a[contains(@href, 'lang=fr') and contains(@title, 'Change language')]
${ERC_DOCPAGE_DETECT_LANGUAGE_ENGLISH}        //a[contains(@href,"lang=en")]
${ERC_DOCPAGE_DETECT_LANGUAGE_FRENCH}         //a[contains(@href,"lang=fr")]
${ERC_DOCPAGE_CHANGE_LANGUAGE_CONFIRM_YES}    //a[@id="changeLanguageConfirmOper"]

*** Keywords ***
Import XML File from
    [Documentation]                      This keyword is used to import an XML File. ${file_to_upload} argument is mandatory which is the location of the XML file
    [Arguments]                          ${file_to_upload}
    Scroll Element into View             xpath=${ERC_DOCPAGE_IMPORTXML_BTN}
    Set Focus to Element                 xpath=${ERC_DOCPAGE_IMPORTXML_BTN}
    Sleep                                ${ERC_DOCPAGE_TIMEOUT}
    Click Element                        xpath=${ERC_DOCPAGE_IMPORTXML_BTN}
    Wait Until Element is Enabled        xpath=${ERC_DOCPAGE_ADDXMLFILE_BTN}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Choose File                          xpath=${ERC_DOCPAGE_ADDXMLFILE_BTN}      ${file_to_upload}
    Wait Until Element is Enabled        xpath=${ERC_DOCPAGE_XMLFILE_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                                ${ERC_DOCPAGE_TIMEOUT}
    Click Element                        xpath=${ERC_DOCPAGE_XMLFILE_BTN}
    Wait Until Element is Not Visible    xpath=${ERC_DOCPAGE_XMLFILE_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Import XML File from the downloaded XML
    [Documentation]    This keyword is used to import an XML File converting the downloaded xml. ${file_to_upload}
    ...                argument is mandatory which is the location of the XML file
    [Arguments]        ${file_to_upload}    ${custom_timeout}=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                            ${ERC_DOCPAGE_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_IMPORTXML_BTN}    timeout=${custom_timeout}
    Click Element                    xpath=${ERC_DOCPAGE_IMPORTXML_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_ADDXMLFILE_BTN}    timeout=${custom_timeout}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_ADDXMLFILE_BTN}    timeout=${custom_timeout}
    ${file_to_upload}=               Normalize Path     ${file_to_upload}
    ${file_to_upload}=               Move File  ${file_to_upload}    ${DEFAULT_DOWNLOADS_DIR}
    Choose File                      xpath=${ERC_DOCPAGE_ADDXMLFILE_BTN}    ${file_to_upload}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_XMLFILE_BTN}      timeout=${custom_timeout}
    click element                    xpath=${ERC_DOCPAGE_XMLFILE_BTN}
    Wait Until Element is Not Visible   xpath=${ERC_DOCPAGE_XMLFILE_BTN}   timeout=${custom_timeout}

Input FDI/DAI Number under Header Tab
  [Documentation]     This keyword used to load the TVF data into ERC Create TT page in CI country
  [Arguments]   ${number}
  Wait Until Element is Visible    xpath=${ERC_DOCPAGE_FDI-DAI_NO}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_FDI-DAI_NO}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Sleep   ${ERC_DOCPAGE_TIMEOUT}
  input text    xpath=${ERC_DOCPAGE_FDI-DAI_NO}     ${number}

Input FDI/DAI Date and click Import icon button
    [Documentation]
    [Arguments]        ${doc_date_input}=TODAY
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_FDI-DAI_DATE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Set Focus to Element           xpath=${ERC_DOCPAGE_FDI-DAI_DATE}
    Click Element                  xpath=${ERC_DOCPAGE_FDI-DAI_DATE}
    Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_DATE_TODAY}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Click Element                  xpath=${ERC_DOCPAGE_DATE_TODAY}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element  xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element     xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}
    Wait Until Page Contains Element  //a[contains(text(), 'Shipment Type: Value is required')]   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Page Contains Element  xpath=${ERC_DOCPAGE_CONFIRMATION_DIALOG}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Input TVF Number under Header Tab
  [Documentation]     This keyword used to load the TVF data into ERC Request AVD page in BJ country
  [Arguments]   ${number}
  Wait Until Element is Visible    xpath=${ERC_DOCPAGE_INPUT_TVF}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_INPUT_TVF}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Sleep   ${ERC_DOCPAGE_TIMEOUT}
  input text    xpath=${ERC_DOCPAGE_INPUT_TVF}     ${number}

Input TVF Date under Header Tab
    [Documentation]     This keyword used to load the TVF data into ERC Request AVD page in BJ country
    [Arguments]        ${doc_date_input}=TODAY
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_TVFDATE}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Set Focus to Element             xpath=${ERC_DOCPAGE_TVFDATE}
    Click Element                    xpath=${ERC_DOCPAGE_TVFDATE}
    Wait Until Element Is Visible    xpath=${ERC_DOCPAGE_DATE_TODAY}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Click Element                    xpath=${ERC_DOCPAGE_DATE_TODAY}

Click the Import icon button
  [Documentation]   This keyword used to load the TVF data into ERC Request AVD page in BJ country
  Wait Until Element is Visible    xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  click element  xpath=${ERC_DOCPAGE_DOWNLOAD_ICON}
  Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  click element     xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}

Verify Field and Value of
   [Arguments]  ${locator}
   ${retry_timeout}                Set Variable    ${ERC_DOCPAGE_WAITING_TIMEOUT}
   ${retry_interval_timeout}       Set Variable    ${ERC_DOCPAGE_TIMEOUT}
   Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}    Wait Until Element is Visible    ${locator}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
   element should be visible   ${locator}
   ${value}=    Get Element Attribute  ${locator}   value
   Should Not Be Empty   ${value}

Test Keyword
   [Arguments]  ${locator}  ${details}
   Wait Until Element is Visible    ${locator}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
   element should be visible   ${locator}
   input text   ${locator}  ${details}
   Press Keys   ${locator}  Return
   ${validation}=     Get Text  ${locator}
   Run Keyword If  '${validation}'!=Get

Value of the Element Field
   [Arguments]  ${locator}
   Wait Until Element is Visible    ${locator}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
   element should be visible   ${locator}
   ${value}=    Get Text  ${locator}
   Should Not Be Empty  ${value}

Enter/Modify Field Details of
  [Documentation]     This keyword used to edit the details on the fields
  [Arguments]   ${locator}  ${details}
  Wait Until Element is Visible    ${locator}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Wait Until Element is Enabled   ${locator}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
  Set Focus to Element  ${locator}
  input text   ${locator}  ${details}
  Press Keys   ${locator}   TAB

Click Verify button
    [Documentation]     This keyword used to verify the mandatory fields
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_VERIFY_BTN}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_VERIFY_BTN}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click element    xpath=${ERC_DOCPAGE_VERIFY_BTN}
    Wait Until Page Contains Element  xpath=${ERC_DOCPAGE_CONFIRMATION_DIALOG}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Click Store button with confirmation
    [Documentation]     This keyword used to store transaction imported from TVF CG and CF
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_STORE_BTN}
    click button    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    page should contain    Operation Successful
    click element   xpath=${ERC_DOCPAGE_CONFIRM_SUBMIT_BTN}

Click Store button
    [Documentation]     This keyword used to store transaction imported from TVF CI
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_STORE_BTN}
    click button    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}

Store operation
    [Documentation]     This keyword used to store transaction imported from TVF BJ
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_STORE_BTN}
    click button    xpath=${ERC_DOCPAGE_STORE_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Page Contains Element    //div[@id='operationSuccessModal']    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Close the Confirmation Dialog box
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_WARNING_CLOSE_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_WARNING_CLOSE_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click button   xpath=${ERC_DOCPAGE_WARNING_CLOSE_BTN}

Update operation for Stored/Queried
    [Documentation]     This keyword used to update transaction from accepted document in CI
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_UPDATE_STORED_BTN}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_UPDATE_STORED_BTN}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click button    xpath=${ERC_DOCPAGE_UPDATE_STORED_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}

Update operation for Processing
    [Documentation]     This keyword used to update transaction from processing document in CI
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_UPDATE_ACCEPTED_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_UPDATE_ACCEPTED_BTN}
    click button    xpath=${ERC_DOCPAGE_UPDATE_ACCEPTED_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}

Click Submit button
    [Documentation]     This keyword used to submit transaction from stored document
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
    click button    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
    Wait Until Page Contains Element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}

Click Submit button with Warning Message
     [Documentation]     This keyword used to finalize the submission of the transaction
     Wait Until Element is Visible    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
     click button    xpath=${ERC_DOCPAGE_SUBMIT_BTN}
     Page Should Contain Element    xpath=${ERC_DOCPAGE_ALERT_WARNING_TITLE}
     Wait Until Element is Visible    xpath=${ERC_DOCPAGE_DELETE_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_DELETE_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     click element   xpath=${ERC_DOCPAGE_CONFIRMATION_CHECKBOX}
     Wait Until Element is Visible    xpath=${ERC_DOCPAGE_WARNING_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_WARNING_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     click link     xpath=${ERC_DOCPAGE_WARNING_YES_BTN}

Click Cancel button
    [Documentation]     This keyword used to cancel transaction from Queried document
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CANCEL_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CANCEL_BTN}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click button    xpath=${ERC_DOCPAGE_CANCEL_BTN}
    Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Click Delete button
    [Documentation]     This keyword used to delete transaction from stored document
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_DELETE_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_DELETE_BTN}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click button    xpath=${ERC_DOCPAGE_DELETE_BTN}
    Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Click Yes Confirmation button
    [Documentation]     This keyword used to confirm an update or submitted transaction
    click element   xpath=${ERC_DOCPAGE_CONFIRM_YES_BTN}
    Page Should Contain Element     xpath=${ERC_DOCPAGE_CONFIRMATION_DIALOG}

Click No Confirmation button
    [Documentation]     This keyword used to cancel an update or submit transaction
    click element   xpath=${ERC_DOCPAGE_CONFIRM_NO_BTN}
    Page Should Contain Element     xpath=${ERC_DOCPAGE_CONFIRMATION_DIALOG}

Prompt display message should appear
    [Documentation]     This keyword used if there are transactions that were successfully Passed on the Confirmattion keyword
    Page Should Contain Element     xpath=//div[@class='wf-alert-scrolable alert alert-block alert-info']

Click Print button
    [Documentation]     This keyword used to print report from FCVR/AVD/DPIV Issued document
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_PRINT_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_PRINT_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element                    xpath=${ERC_DOCPAGE_PRINT_BTN}

Click Export XML button
    [Documentation]     This keyword used to download .xml file
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_EXPORTXML_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_EXPORTXML_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element                    xpath=${ERC_DOCPAGE_EXPORTXML_BTN}

Click Export SAD XML button
    [Documentation]     This keyword used to download SAD .xml file
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_EXPORTSADXML_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_EXPORTSADXML_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element                    xpath=${ERC_DOCPAGE_EXPORTSADXML_BTN}

Wait PDF File Download to Finish
    [Documentation]     This keyword used to wait the pdf download finish
    ...                 The default filename to watch is stated in ${ERC_DOCPAGE_DOWNLOADED_PDF_FILENAME}
    ...                 When the file is still downloading, it has an extension of filename.pdf.crdownload
    ...                 Please make sure to cleanup or delete possible same filename that could be in conflict in downloads directory before downloading the file
    [Arguments]         ${filepath_downloaded}=${DEFAULT_DOWNLOADS_DIR}/${ERC_DOCPAGE_DOWNLOADED_PDF_FILENAME}  ${custom_timeout}=${ERC_DOCPAGE_WAITING_TIMEOUT}
    ${filepath_downloaded}=     Normalize Path  ${filepath_downloaded}
    ${fail_message}=            Set Variable    Was not able to download ${filepath_downloaded} within ${custom_timeout}
    ${retry_timeout}=           Set Variable    ${custom_timeout}
    ${retry_interval_timeout}=  Set Variable    ${ERC_DOCPAGE_TIMEOUT}
    Wait Until Keyword Succeeds    ${retry_timeout}      ${retry_interval_timeout}  File should exist   ${filepath_downloaded}  ${fail_message}

Click Header Tab
    [Documentation]     This keyword used to navigate Header Tab
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_HEADER_TAB}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_HEADER_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click element   xpath=${ERC_DOCPAGE_HEADER_TAB}
    Page Should Contain Element     //strong[contains(text(), "TT ID")]

Click Names & Parties Tab
    [Documentation]     This keyword used to navigate Names & Parties Tab
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_NAMPARTIES_TAB}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_NAMPARTIES_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    ${retry_timeout}                Set Variable    ${ERC_DOCPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}       Set Variable    ${ERC_DOCPAGE_TIMEOUT}
    Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   click element   xpath=${ERC_DOCPAGE_NAMPARTIES_TAB}
    Page Should Contain Element     //strong[contains(text(), "Importer Details")]

Click Transport Tab
    [Documentation]     This keyword used to navigate Transport Tab
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_TRANSPORT_TAB}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_TRANSPORT_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    Set Focus To Element    xpath=${ERC_DOCPAGE_TRANSPORT_TAB}
    click element   xpath=${ERC_DOCPAGE_TRANSPORT_TAB}
    Page Should Contain Element     //label[@class='control-label partial']

Select Shipment Type
    [Documentation]     This keyword used to select a Shipment Type
    [Arguments]     ${type}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_DRPDWN_STYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_DRPDWN_STYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element    xpath=${ERC_DOCPAGE_DRPDWN_STYPE}
    select from list by label    xpath=${ERC_DOCPAGE_DRPDWN_STYPE}    ${type}


Select Loading Types
    [Documentation]     This keyword used to select Loading Type in 3 Containers
    [Arguments]     ${LType}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE1}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE1}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    FOR    ${ctr}  IN RANGE  1   7
        ${status}=  Run Keyword And Return Status   click element    id=${ERC_DOCPAGE_DRPDWN_LOADTYPE1}
        exit for loop if    ${status}
    END
    select from list by label       xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE1}    ${LType}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE2}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE2}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element    xpath=${ERC_DOCPAGE_DRPDWN_LOADTYPE2}
    #select from list by label    id=${ERC_DOCPAGE_DRPDWN_LOADTYPE2}    ${LType}
    FOR    ${ctr}  IN RANGE  1   7
        ${status}=  Run Keyword And Return Status   select from list by label    ${ERC_DOCPAGE_DRPDWN_LOADTYPE2}    ${LType}
        click element   ${ERC_DOCPAGE_DRPDWN_LOADTYPE2}
        exit for loop if    ${status}
    END
    click element    ${ERC_DOCPAGE_DRPDWN_LOADTYPE3}
    select from list by label    ${ERC_DOCPAGE_DRPDWN_LOADTYPE3}    ${LType}

Click Financial Tab
    [Documentation]     This keyword used to navigate Financial Tab
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_FINANCIAL_TAB}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_FINANCIAL_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    Execute JavaScript  window.scroll(0,100)
    #Scroll Element Into View    xpath=${ERC_DOCPAGE_FINANCIAL_TAB}
    click element   xpath=${ERC_DOCPAGE_FINANCIAL_TAB}
    Page Should Contain Element     //div[@id='valueWebbTabsContent']

Select Incoterm
    # TODO put verification in this keywords
    [Documentation]     This keyword used to select Parent Incoterm
    [Arguments]     ${type}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_SUGGEST_INC}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_SUGGEST_INC}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    input text   xpath=${ERC_DOCPAGE_SUGGEST_INC}  ${type}
    Press Keys   xpath=${ERC_DOCPAGE_SUGGEST_INC}  TAB
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click link     xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}

Select Incoterm per Item
    # TODO put verification in this keywords
    [Documentation]     This keyword used to select Incoterm per Item
    [Arguments]     ${type}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    input text   xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}  ${type}
    Press Keys   xpath=${ERC_DOCPAGE_SUGGEST_INCITEM}  TAB
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    #${keyword_timeout}=  Set Variable  ${ERC_DOCPAGE_WAITING_TIMEOUT}
    #${retry_timeout}=    Set Variable  ${ERC_DOCPAGE_TIMEOUT}
    #Wait Until Keyword Succeeds  ${keyword_timeout}  ${retry_timeout}   click link     xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}
    click link     xpath=${ERC_DOCPAGE_OVERRIDE_YES_BTN}

Click Goods Tab
    [Documentation]     This keyword used to navigate Goods Tab
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_GOODS_TAB}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_GOODS_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    Scroll Element Into View    xpath=${ERC_DOCPAGE_GOODS_TAB}
    click element   xpath=${ERC_DOCPAGE_GOODS_TAB}
    Page Should Contain Element     //div[@id='itemsTab']

Add Items under Goods Tab
    [Documentation]     This keyword used to add items on the Goods tab in CI and BJ
    [Arguments]  ${NO_ITEM}
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_INPUT_NO_ITEM}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_INPUT_NO_ITEM}
    input text   xpath=${ERC_DOCPAGE_INPUT_NO_ITEM}   ${NO_ITEM}
    Press Keys   xpath=${ERC_DOCPAGE_INPUT_NO_ITEM}  TAB
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_CHECKBOX}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_CHECKBOX}

Enter Product Code under Goods Tab
    [Documentation]     This keyword used to add Product Code on the Goods tab CI and BJ
    [Arguments]  ${hs_code_input}
    Input Text         xpath=${ERC_DOCPAGE_SUGGEST_HSCODE}   ${hs_code_input}
    Wait Until Page Contains    ${hs_code_input}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys   xpath=${ERC_DOCPAGE_SUGGEST_HSCODE}  TAB

Enter Product Description under Goods Tab
    [Documentation]     This keyword used to add Product Description on the Goods tab CI
    [Arguments]  ${hsc_desc_input}
    Input Text         xpath=${ERC_DOCPAGE_INPUT_HSCDESC}   ${hsc_desc_input}
    Textfield Value Should Be   xpath=${ERC_DOCPAGE_INPUT_HSCDESC}   ${hsc_desc_input}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys   xpath=${ERC_DOCPAGE_INPUT_HSCDESC}  TAB

Enter Incoterm Item value under Goods Tab
    [Documentation]     This keyword used to add Incoterm Item value on the Goods tab CI and BJ
    [Arguments]  ${inc_value_input}
    Input Text         xpath=${ERC_DOCPAGE_INPUT_INCNUM}   ${inc_value_input}
    Textfield Value Should Be  xpath=${ERC_DOCPAGE_INPUT_INCNUM}    ${inc_value_input}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys   xpath=${ERC_DOCPAGE_INPUT_INCNUM}  TAB

Enter Item Quantity under Goods Tab
    [Documentation]     This keyword used to add Item Quantity on the Goods tab CI and BJ
    [Arguments]  ${inc_qty_input}
    Input Text         xpath=${ERC_DOCPAGE_INPUT_QTYNUM}   ${inc_qty_input}
    Textfield Value Should Be  xpath=${ERC_DOCPAGE_INPUT_QTYNUM}    ${inc_qty_input}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys     xpath=${ERC_DOCPAGE_INPUT_QTYNUM}  TAB

Enter Item Unit Measurement under Goods Tab
    [Documentation]     This keyword used to add Item Unit Measurement on the Goods tab CI and BJ
    [Arguments]  ${inc_uom_input}
    Input Text         xpath=${ERC_DOCPAGE_SUGGEST_UNIT}   ${inc_uom_input}
    Wait Until Page Contains    ${inc_uom_input}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_UNIT}  TAB

Enter Item Country Of Origin under Goods Tab
    [Documentation]     This keyword used to add Item Country Of Origin on the Goods tab CI and BJ
    [Arguments]  ${inc_coo_input}
    Input Text         xpath=${ERC_DOCPAGE_SUGGEST_COO}   ${inc_coo_input}
    Wait Until Page Contains    ${inc_coo_input}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_COO}  TAB

Click Add button under Goods tab
    [Documentation]     This keyword used to add items on the Goods tab in BJ
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_ADDITEM_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_ADDITEM_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element   xpath=${ERC_DOCPAGE_ADDITEM_BTN}
    Wait Until Page Contains Element   //strong[contains(text(), 'Item Number')]

Click Export Items
    [Documentation]     This keyword used to Export an .xlsx file
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_EXPORT_ITEMS_BTN}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_EXPORT_ITEMS_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    click element                    xpath=${ERC_DOCPAGE_EXPORT_ITEMS_BTN}

Wait File Download to Finish
    [Documentation]    This Keyword is used to wait the file download to finish
    ...                When the file is still downloading, it has an extension of .crdownload
    ...                Please make sure to cleanup or delete possible same filename that could be in conflict in downloads directory before downloading a file
    ...                Mandatory Argument is filename to check, optional is the directory where the file is to be checked
    [Arguments]        ${file_to_check}        ${directory}=${DEFAULT_DOWNLOADS_DIR}
    ${filepath_downloaded}=      Normalize Path    ${directory}/${file_to_check}
    ${fail_message}=             Set Variable      Was not able to download ${filepath_downloaded} within ${ERC_DOCPAGE_WAITING_TIMEOUT}
    ${retry_timeout}=            Set Variable      ${ERC_DOCPAGE_WAITING_TIMEOUT}
    ${retry_interval_timeout}=   Set Variable      ${ERC_DOCPAGE_TIMEOUT}
    Wait Until Keyword Succeeds  ${retry_timeout}  ${retry_interval_timeout}           File Should Exist       ${filepath_downloaded}       ${fail_message}

File Should Exists in Downloads Directory
    [Documentation]         This Keyword is used to check if the file exists in the defaults download directory
    ...                     Mandatory Argument is filename to check, optional is the directory where the file is to be checked
    [Arguments]             ${file_to_check}         ${directory}=${DEFAULT_DOWNLOADS_DIR}
    ${filepath_to_check}=   Normalize Path           ${directory}/${file_to_check}
    File Should Exist       ${filepath_to_check}     File ${file_to_check} doesn't exist in ${directory}

Import XLS File from
    [Documentation]    This keyword is used to import an XLS File. ${file_to_upload} argument is mandatory which is the location of the XLS file
    [Arguments]        ${file_to_upload}    ${custom_timeout}=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_IMPORT_ITEMS_BTN}    timeout=${custom_timeout}
    Click Element                    xpath=${ERC_DOCPAGE_IMPORT_ITEMS_BTN}
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CHOOSEFILE_DOC_BTN}    timeout=${custom_timeout}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_CHOOSEFILE_DOC_BTN}    timeout=${custom_timeout}
    ${file_to_upload}=               Normalize Path     ${file_to_upload}
    ${file_to_upload}=               Move File  ${file_to_upload}    ${DEFAULT_DOWNLOADS_DIR}
    Choose File                      xpath=${ERC_DOCPAGE_CHOOSEFILE_DOC_BTN}    ${file_to_upload}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_ADDXLS_BTN}      timeout=${custom_timeout}
    click element                    xpath=${ERC_DOCPAGE_ADDXLS_BTN}
    Wait Until Element is Not Visible   xpath=${ERC_DOCPAGE_ADDXLS_BTN}   timeout=${custom_timeout}
    Wait Until Page Contains Element    //*[@id="fileLabel_document"]

Click Remarks Tab
    [Documentation]     This keyword used to navigate Remarks Tab
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_REMARKS_TAB}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_REMARKS_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    click element   xpath=${ERC_DOCPAGE_REMARKS_TAB}

Click Attachment Tab
    [Documentation]     This keyword used to navigate Attachment Tab
    Wait Until Element is Visible   xpath=${ERC_DOCPAGE_ATTACHMENT_TAB}
    Wait Until Element is Enabled   xpath=${ERC_DOCPAGE_ATTACHMENT_TAB}
    Double Click Element   xpath=${ERC_DOCPAGE_ATTACHMENT_TAB}
    Sleep   ${ERC_DOCPAGE_TIMEOUT}
    page should contain    List of Attachments

Input Doc Type under Attachments Tab
    [Documentation]    This keyword is used to input Document Type in attachments tab
    [Arguments]        ${doc_type_input}
    Set Focus To Element               xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
    Sleep                              ${ERC_DOCPAGE_TIMEOUT}
    Input Text                         xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}         ${doc_type_input}
    Wait Until Page Contains           ${doc_type_input}                        timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                              ${ERC_DOCPAGE_TIMEOUT}
    Press Keys                         xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}         ARROW_DOWN
    Press Keys                         xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}         RETURN
    Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Not Visible  xpath=${ERC_DOCPAGE_AJAX_PROGRESS}       timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Input Reference Number under Attachments Tab
    [Documentation]       This Keyword is used to input or select Reference Number in attachments tab selection
    [Arguments]           ${ref_no_input}
    Wait Until Element is Visible      xpath=${ERC_DOCPAGE_REFERENCE_NUMBER}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_REFERENCE_NUMBER}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Set Focus To Element  xpath=${ERC_DOCPAGE_REFERENCE_NUMBER}
    Sleep                 ${ERC_DOCPAGE_TIMEOUT}
    Click Element         xpath=${ERC_DOCPAGE_REFERENCE_NUMBER}
    ${count_input}=       Get Element Count                     xpath=${ERC_DOCPAGE_INPUT_REFNO}
    ${count_select}=      Get Element Count                     xpath=${ERC_DOCPAGE_SELECT_STYPE}
    Run Keyword If        '${count_input}'>'${count_select}'    Input Reference Number by Input under Attachments Tab             ${ref_no_input}
    Run Keyword If        '${count_input}'<'${count_select}'    Input Reference Number by Selection under Attachments Tab         ${ref_no_input}

Input Reference Number by Input under Attachments Tab
    [Documentation]      This Keyword is used to input Reference Number
    [Arguments]          ${ref_no_input}
    Wait Until Element is Enabled  xpath=${ERC_DOCPAGE_INPUT_REFNO}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                          ${ERC_DOCPAGE_TIMEOUT}
    Input Text                     xpath=${ERC_DOCPAGE_INPUT_REFNO}    ${ref_no_input}
    Sleep                          ${ERC_DOCPAGE_TIMEOUT}
    Press Keys                     xpath=${ERC_DOCPAGE_INPUT_REFNO}    RETURN

Input Reference Number by Selection under Attachments Tab
    [Documentation]      This Keyword is used to select Reference Number from list of values
    [Arguments]          ${ref_no_input}
    Wait Until Element is Enabled  xpath=${ERC_DOCPAGE_SELECT_STYPE}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                          ${ERC_DOCPAGE_TIMEOUT}
    Select From List By Value      xpath=${ERC_DOCPAGE_SELECT_STYPE}    ${ref_no_input}

Enter Reference Number under Attachments Tab
    [Documentation]      This Keyword is used to input Reference Number in BJ
    [Arguments]          ${ref_no_input}
    Wait Until Element is Enabled  xpath=${ERC_DOCPAGE_INPUT_REF}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                          ${ERC_DOCPAGE_TIMEOUT}
    Input Text                     xpath=${ERC_DOCPAGE_INPUT_REF}    ${ref_no_input}
    Sleep                          ${ERC_DOCPAGE_TIMEOUT}
    Press Keys                     xpath=${ERC_DOCPAGE_INPUT_REF}    RETURN

Upload and Add File under Attachments Tab
    [Documentation]     THis KEyword is used to upload a file under attacchments tab in CI and CF
    Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Click Element                      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}
    Wait Until Element Is Visible      xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}        timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Choose File                        xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}        ${ERC_DOCPAGE_ATTACHMENT_PATH}
    Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Click Element                      xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}
    Wait Until Element Is not Visible  xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Visible      xpath=${ERC_DOCPAGE_CONFIRM_ALERT}        timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Page Contains           ${ERC_DOCPAGE_CONFIRM_ALERT_TEXT}         timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Upload Files Select
     [Documentation]     This keyword used to upload attachment upon selecting option in Reference dropdown field in CG
     [Arguments]    ${docType}  ${subType}  ${ref}
     FOR    ${ctr}  IN RANGE  1   7
         ${status}=  Run Keyword And Return Status   Wait Until Element Is Visible  id=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
         TT_Document_Page.Click Attachment Tab
         exit for loop if   ${status}
     END
     Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
     Wait Until Element Is Enabled  xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
     input text     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ${docType}
     Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ARROW_DOWN  ENTER
     Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_DRPDWN_SELSUBTYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_DRPDWN_SELSUBTYPE}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     select from list by value  xpath=${ERC_DOCPAGE_DRPDWN_SELSUBTYPE}  ${subType}
     Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_INPUT_REFNO}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_INPUT_REFNO}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     input text  xpath=${ERC_DOCPAGE_INPUT_REFNO}    ${ref}
     click element  xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}
     Choose File    xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}   ${ERC_DOCPAGE_ATTACHMENT_PATH}
     Wait Until Page Contains   SingleDPIVReport.pdf   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}       timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     click element  xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}
     Sleep  ${ERC_DOCPAGE_TIMEOUT}
     page should contain    Attachment has been added   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Upload Files Input
     [Documentation]     This keyword used to upload attachment upon entering details in Reference textbox field in CG
     [Arguments]    ${docType}  ${referenceNo}
     ${retry_timeout}                Set Variable    ${ERC_DOCPAGE_WAITING_TIMEOUT}
     ${retry_interval_timeout}       Set Variable    ${ERC_DOCPAGE_TIMEOUT_INTERVAL}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   Wait Until Element Is Visible  xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
     Wait Until Element Is Enabled  xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     input text     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ${docType}
     Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ARROW_DOWN  ENTER
     Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_INPUT_REFNO}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  click element  xpath=${ERC_DOCPAGE_INPUT_REFNO}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  input text  xpath=${ERC_DOCPAGE_INPUT_REFNO}    ${referenceNo}
     click element  xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}
     Choose File    xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}   ${ERC_DOCPAGE_ATTACHMENT_PATH}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  Wait Until Page Contains   SingleDPIVReport.pdf
     click element  xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}
     Sleep  ${ERC_DOCPAGE_TIMEOUT}
     page should contain    Attachment has been added   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Upload Files Select in Attachment Tab
     [Documentation]     This keyword used to upload attachment upon entering details in Reference textbox field in BJ
     [Arguments]    ${docType}  ${subType}  ${referenceNo}
     ${retry_timeout}                Set Variable    ${ERC_DOCPAGE_WAITING_TIMEOUT}
     ${retry_interval_timeout}       Set Variable    ${ERC_DOCPAGE_TIMEOUT_INTERVAL}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   Wait Until Element Is Visible  id=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
     Wait Until Element Is Enabled  xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     input text     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ${docType}
     Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ARROW_DOWN  RETURN
     Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}     timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Not Visible  xpath=${ERC_DOCPAGE_AJAX_PROGRESS}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_SELECT_STYPE}      timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Select From List By Value    xpath=${ERC_DOCPAGE_SELECT_STYPE}    ${subType}
     Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_INPUT_REF}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  click element  xpath=${ERC_DOCPAGE_INPUT_REF}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  input text  xpath=${ERC_DOCPAGE_INPUT_REF}    ${referenceNo}
     click element  xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}
     Choose File    xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}   ${ERC_DOCPAGE_ATTACHMENT_PATH}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  Wait Until Page Contains   SingleDPIVReport.pdf
     click element  xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}
     Sleep  ${ERC_DOCPAGE_TIMEOUT}
     page should contain    Attachment has been added   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}


Upload Files Input in Attachment Tab
     [Documentation]     This keyword used to upload attachment upon entering details in Reference textbox field in BJ
     [Arguments]    ${docType}  ${referenceNo}
     ${retry_timeout}                Set Variable    ${ERC_DOCPAGE_WAITING_TIMEOUT}
     ${retry_interval_timeout}       Set Variable    ${ERC_DOCPAGE_TIMEOUT_INTERVAL}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}   Wait Until Element Is Visible      xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}
     Wait Until Element Is Enabled      xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}        timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     input text     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ${docType}
     Press Keys     xpath=${ERC_DOCPAGE_SUGGEST_DOCTYPE}  ARROW_DOWN  RETURN
     Wait Until Element is Enabled      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}             timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Element is Not Visible  xpath=${ERC_DOCPAGE_AJAX_PROGRESS}              timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Page Contains Element    xpath=${ERC_DOCPAGE_INPUT_REF}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  click element   xpath=${ERC_DOCPAGE_INPUT_REF}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  input text      xpath=${ERC_DOCPAGE_INPUT_REF}    ${referenceNo}
     click element      xpath=${ERC_DOCPAGE_UPLOADFILE_BTN}
     Choose File        xpath=${ERC_DOCPAGE_CHOOSEFILE_BTN}   ${ERC_DOCPAGE_ATTACHMENT_PATH}
     Wait Until Keyword Succeeds     ${retry_timeout}    ${retry_interval_timeout}  Wait Until Page Contains   SingleDPIVReport.pdf
     click element      xpath=${ERC_DOCPAGE_ATTACHFILE_BTN}
     Sleep  ${ERC_DOCPAGE_TIMEOUT}
     page should contain    Attachment has been added   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}

Switch ERC Application to English
    [Documentation]    This Keyword is used to switch the application to english language
    ${must_be_language}=    Set Variable           ENGLISH
    ${current_language}=    Detect Language used in ERC Application Page
    Return From Keyword If  '${current_language}'=='${must_be_language}'
    Wait Until Element is Visible    xpath=${ERC_DOCPAGE_ENGLISH_BUTTON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_DOCPAGE_ENGLISH_BUTTON}    timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Sleep                   ${ERC_DOCPAGE_TIMEOUT}
    Click Element           xpath=${ERC_DOCPAGE_ENGLISH_BUTTON}
    ${pop_up_seen}=         Run Keyword And Return Status                 Wait Until Element is Visible    xpath=${ERC_DOCPAGE_CHANGE_LANGUAGE_CONFIRM_YES}   timeout=${ERC_DOCPAGE_WAITING_TIMEOUT}
    Run Keyword If          ${pop_up_seen}                                Click Element                    xpath=${ERC_DOCPAGE_CHANGE_LANGUAGE_CONFIRM_YES}
    Sleep                   ${ERC_DOCPAGE_TIMEOUT}
    ${current_language}=    Detect Language used in ERC Application Page
    Should be Equal         ${must_be_language}    ${current_language}

Detect Language used in ERC Application Page
    [Documentation]    This keyword is used to detect the language used in current ERC.
    ${count_english_links}=  Get Element Count  ${ERC_DOCPAGE_DETECT_LANGUAGE_ENGLISH}
    ${count_french_links}=   Get Element Count  ${ERC_DOCPAGE_DETECT_LANGUAGE_FRENCH}
    ${language_used}=        Set Variable If    ${count_english_links} > ${count_french_links}  ENGLISH
    ...                                         ${count_french_links} > ${count_english_links}  FRENCH     ERROR
    [Return]    ${language_used}