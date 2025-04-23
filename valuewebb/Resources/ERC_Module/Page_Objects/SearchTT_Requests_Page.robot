*** Settings ***
Documentation   This resource file used for keywords in ERC Searh Page and Search Columns
Library     SeleniumLibrary

*** Variables ***
${ERC_SEARCHPAGE_TIMEOUT}                               0.5s
${ERC_SEARCHPAGE_WAITING_TIMEOUT}                       20s
${ERC_SEARCHPAGE_WINDOW_TITLE}                          eDouanes Congo - DPI
${ERC_SEARCHPAGE_DRPDWN_STATUS}                         //select[@id='displayStatus']
${ERC_SEARCHPAGE_INPUT_TTID}                            //input[@name='id']
${ERC_SEARCHPAGE_TT_BTN}                                //input[@id='searchSubmit']
${ERC_SEARCHPAGE_RESET_TT_BTN}                          //button[contains(text(),'Reset')]
${ERC_SEARCHPAGE_VIEW_TT_BTN}                           //i[@class='icon-eye-open']
${ERC_SEARCHPAGE_EDIT_TT_BTN}                           //i[@class='icon-pencil']
${ERC_SEARCHPAGE_DELETE_TT_BTN}                         //i[@class='icon-trash']
${ERC_SEARCHPAGE_REQUESTAVD_LINK}                       //a[contains(text(),'Request AVD')]
${ERC_SEARCHPAGE_SEARCH_LINK}                           //a[@href="/vw/ttGen/list"]
${ERC_SEARCHPAGE_SUGGEST_IMP}                           //input[@name='impTin']
${ERC_SEARCHPAGE_SUGGEST_DEC}                           //input[@name='appTin']
${ERC_SEARCHPAGE_INPUT_IMP}                             //input[@name='impNam']
${ERC_SEARCHPAGE_INPUT_DEC}                             //input[@name='appNam']
${ERC_SEARCHPAGE_INPUT_VESSEL}                          //input[@name='vessel']
${ERC_SEARCHPAGE_INPUT_FCVR}                            //input[@name='fcvrNum']
${ERC_SEARCHPAGE_CONTAINER_NO}                          //input[@name='number']
${ERC_SEARCHPAGE_INPUT_ASSIGNEE}                        //input[@name='assignee']
${ERC_SEARCHPAGE_SUGGEST_OFC}                           //input[@name='cuoCode']
${ERC_SEARCHPAGE_INPUT_BLNUM}                           //input[@name='blNum']
${ERC_SEARCHPAGE_DRPDWN_REQDATE}                        //select[@id='op_date']
${ERC_SEARCHPAGE_DAT_FRMDATE}                           //input[@id='date']
${ERC_SEARCHPAGE_DAT_TODATE}                            //input[@id='dateTo']
${ERC_SEARCHPAGE_DRPDWN_FCVRDATE}                       //select[@id='op_fcvrDat']
${ERC_SEARCHPAGE_DAT_TODPIV}                            //input[@id='fcvrDat']
${ERC_SEARCHPAGE_DAT_FRMDPIV}                           //input[@id='fcvrDatTo']
${ERC_SEARCHPAGE_DRPDWN_LASTSUBMIT}                     //select[@id='op_submissionDate']
${ERC_SEARCHPAGE_DAT_FRMSUBMIT}                         //input[@id='submissionDate']
${ERC_SEARCHPAGE_DAT_TOSUBMIT}                          //input[@id='submissionDateTo']
${ERC_SEARCHPAGE_DRPDWN_TVFDATE}                        //select[@id='op_adDate']
${ERC_SEARCHPAGE_DAT_FRMTVF}                            //input[@id='adDate']
${ERC_SEARCHPAGE_DAT_TOTVF}                             //input[@id='adDateTo']
${ERC_SEARCHPAGE_CREATE_TT_LINK}                        //a[@href='/vw/ttGen/create']
${ERC_SEARCHPAGE_YES_BTN}                               //a[@id='confirmOper']
${ERC_SEARCHPAGE_NO_BTN}                                //a[@id='cancelOper']
${ERC_SEARCHPAGE_CONFIRMATION_DIALOG}                   //div[@class='wf-alert-scrolable alert alert-block alert-info']
${ERC_SEARCHPAGE_CREATE_TT_TITLE}                       //div[@id='document']//h3[contains(text(), 'Create TT')]
${ERC_SEARCHPAGE_REQUEST_AVD_TITLE}                     //div[@id='valueWebbTabsContent']
${ERC_SEARCHPAGE_TITLE}                                 //h3[contains(text(), 'Search')]
${ERC_SEARCHPAGE_RESULTS_DISPLAY}                       //p[contains(text(), 'Loaded')]
${ERC_SEARCHPAGE_EDIT_TT_TITLE}                         //h3[contains(text(), "ValueWebb - Edit TT")]
${ERC_SEARCHPAGE_DIV_PAGE}                              //div[@id="document"]


*** Keywords ***
Click Create TT link
    [Documentation]  This keyword used to click for Create TT link
    Wait Until Element is Visible    xpath=${ERC_SEARCHPAGE_CREATE_TT_LINK}
    Wait Until Element is Enabled    xpath=${ERC_SEARCHPAGE_CREATE_TT_LINK}
    click link  xpath=${ERC_SEARCHPAGE_CREATE_TT_LINK}
    Wait Until Element is Visible   xpath=${ERC_SEARCHPAGE_CREATE_TT_TITLE}
    Page Should Contain Element     xpath=${ERC_SEARCHPAGE_CREATE_TT_TITLE}

Click Request AVD
    [Documentation]     This keyword used to click for Request AVD link
    Wait Until Element is Visible    xpath=${ERC_SEARCHPAGE_REQUESTAVD_LINK}    timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_SEARCHPAGE_REQUESTAVD_LINK}    timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    click link  xpath=${ERC_SEARCHPAGE_REQUESTAVD_LINK}
    Page Should Contain Element      xpath=${ERC_SEARCHPAGE_REQUEST_AVD_TITLE}

Click Search link
    [Documentation]  This keyword used to Search for Trade Transactions (TT)
    Wait Until Element is Visible    xpath=${ERC_SEARCHPAGE_SEARCH_LINK}    timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element is Enabled    xpath=${ERC_SEARCHPAGE_SEARCH_LINK}    timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}
    click element   xpath=${ERC_SEARCHPAGE_SEARCH_LINK}
    Wait Until Element is Visible 	xpath=${ERC_SEARCHPAGE_TITLE}   timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}

Enter Request ID
    [Documentation]     This keyword used to search for specific transaction based on TTID
    [Arguments]     ${TTID}
    Wait Until Element is Visible    xpath=${ERC_SEARCHPAGE_INPUT_TTID}
    Wait Until Element is Enabled    xpath=${ERC_SEARCHPAGE_INPUT_TTID}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}
    input text      xpath=${ERC_SEARCHPAGE_INPUT_TTID}     ${TTID}
    click button    xpath=${ERC_SEARCHPAGE_TT_BTN}

Select Status of Transaction
    [Documentation]     This keyword used to select for specific transaction based on status
    [Arguments]  ${status}
    Wait Until Element Is Visible   xpath=${ERC_SEARCHPAGE_DRPDWN_STATUS}   timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_DRPDWN_STATUS}   timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    select from list by value       xpath=${ERC_SEARCHPAGE_DRPDWN_STATUS}   ${status}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}

Click Search button
    [Documentation]     This keyword used to diplay the results of the transactions in the list table
    Wait Until Element Is Visible   xpath=${ERC_SEARCHPAGE_TT_BTN}     timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_TT_BTN}  timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    click button    xpath=${ERC_SEARCHPAGE_TT_BTN}
    Wait Until Page Contains Element    xpath=${ERC_SEARCHPAGE_RESULTS_DISPLAY}

Click Edit Icon button
    [Documentation]     This keyword used to edit and open the transaction
    Wait Until Element is Visible   xpath=${ERC_SEARCHPAGE_EDIT_TT_BTN}      timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_EDIT_TT_BTN}      timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}
    click element   xpath=${ERC_SEARCHPAGE_EDIT_TT_BTN}
    Wait Until Page Contains Element   xpath=${ERC_SEARCHPAGE_EDIT_TT_TITLE}     timeout=${ERC_SEARCHPAGE_WAITING_TIMEOUT}

Click View Icon button
    [Documentation]     This keyword used to view and open the transaction
    Wait Until Element is Visible   xpath=${ERC_SEARCHPAGE_VIEW_TT_BTN}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_VIEW_TT_BTN}
    click element   xpath=${ERC_SEARCHPAGE_VIEW_TT_BTN}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}
    Page Should Contain Element   xpath=${ERC_SEARCHPAGE_DIV_PAGE}

Click Delete Icon button
    [Documentation]     This keyword used to delete the transaction
    Wait Until Element is Visible   xpath=${ERC_SEARCHPAGE_DELETE_TT_BTN}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_DELETE_TT_BTN}
    Sleep   ${ERC_SEARCHPAGE_TIMEOUT}
    click element   xpath=${ERC_SEARCHPAGE_DELETE_TT_BTN}
    Wait Until Element is Visible   xpath=${ERC_SEARCHPAGE_YES_BTN}
    Wait Until Element Is Enabled   xpath=${ERC_SEARCHPAGE_YES_BTN}
    click element   xpath=${ERC_SEARCHPAGE_YES_BTN}





