*** Settings ***
Documentation    This resource file is used for keywords in ERC login page
Library     SeleniumLibrary

*** Variables ***
${ERC_TEST_COUNTRY}                   CI
${ERC_TEST_SERVER}                    QA

&{ERC_SERVER_URL_OPTIONS}    CG_QA=https://vw-qa-cg.wfgmb.com/vw/       CG_UAT=https://uat.douanes.gouv.cg/vw/
...                          CF_QA=https://vw-qa-cf.wfgmb.com/vw/       CF_UAT=https://uat.edouanes.cf/vw/
...                          CI_QA=https://vw-qa-ci.wfgmb.com/vw/       CI_UAT=https://uatapp.webbfontaine.ci/vw/
...                          BJ_QA=https://vw-qa-bj.wfgmb.com/vw/       BJ_UAT=https://uat.guce.gouv.bj/vw/

&{ERC_TRADER_OPTIONS}        CG_QA_USER=tvf_ta_trader        CG_QA_PASS=12345678        CG_UAT_USER=jgregorio                     CG_UAT_PASS=12345678
...                          CF_QA_USER=tvftrader@test.com   CF_QA_PASS=Abce1234!@      CF_UAT_USER=jdeclarant@webbfontaine.com   CF_UAT_PASS=Abce1234!@
...                          CI_QA_USER=jgregorio            CI_QA_PASS=12345678        CI_UAT_USER=ebasco                        CI_UAT_PASS=12345678
...                          BJ_QA_USER=ebasco               BJ_QA_PASS=12345678        BJ_UAT_USER=jgregorio                     BJ_UAT_PASS=12345678

${GLOBAL_ERC_SERVER_URL}              ${ERC_SERVER_URL_OPTIONS}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}]
${GLOBAL_ERC_TRADER_USERNAME}         ${ERC_TRADER_OPTIONS}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}_USER]
${GLOBAL_ERC_TRADER_PASSWORD}         ${ERC_TRADER_OPTIONS}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}_PASS]

&{ERC_LOGIN_PAGE_USERNAME_INPUT}   CG_QA=//input[@name='josso_username']              CG_UAT=//input[@name='josso_username']                    CG_DO=//input[@name='josso_username']
...                                CF_QA=//input[@id="username"]                      CF_UAT=//input[@id="username"]                            CF_DO=//input[@id="username"]
...                                CI_QA=//input[@name='josso_username']              CI_UAT=//input[@name='josso_username']                    CI_DO=//input[@name='josso_username']
...                                BJ_QA=//input[@name='josso_username']              BJ_UAT=//input[@name='josso_username']                    BJ_DO=//input[@name='josso_username']

&{ERC_LOGIN_PAGE_PASSWORD_INPUT}   CG_QA=//input[@name='josso_password']              CG_UAT=//input[@name='josso_password']                    CG_DO=//input[@name='josso_password']
...                                CF_QA=//input[@id="password"]                      CF_UAT=//input[@id="password"]                            CF_DO=//input[@id="password"]
...                                CI_QA=//input[@name='josso_password']              CI_UAT=//input[@name='josso_password']                    CI_DO=//input[@name='josso_password']
...                                BJ_QA=//input[@name='josso_password']              BJ_UAT=//input[@name='josso_password']                    BJ_DO=//input[@name='josso_password']

&{ERC_LOGIN_PAGE_LOGIN_BUTTON}     CG_QA=//tbody/tr[5]/td[1]/input[@value='Login']    CG_UAT=//tbody/tr[5]/td[1]/input[@value='Login']          CG_DO=//tbody/tr[5]/td[1]/input[@value='Login']
...                                CF_QA=//input[@id="kc-login"]                      CF_UAT=//input[@id="kc-login"]                            CF_DO=//input[@id="kc-login"]
...                                CI_QA=//tbody/tr[5]/td[1]/input[@value='Login']    CI_UAT=//button[@name='login']                            CI_DO=//tbody/tr[5]/td[1]/input[@value='Login']
...                                BJ_QA=//tbody/tr[5]/td[1]/input[@value='Login']    BJ_UAT=//button[@name='login']                            BJ_DO=//tbody/tr[5]/td[1]/input[@value='Login']

${ERC_LOGINPAGE_USERNAME}                       ${ERC_LOGIN_PAGE_USERNAME_INPUT}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}]
${ERC_LOGINPAGE_PASSWORD}                       ${ERC_LOGIN_PAGE_PASSWORD_INPUT}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}]
${ERC_LOGINPAGE_LOGIN_BTN}                      ${ERC_LOGIN_PAGE_LOGIN_BUTTON}[${ERC_TEST_COUNTRY}_${ERC_TEST_SERVER}]

${ERC_LOGINPAGE_WAITING_TIMEOUT}                5s
${ERC_LOGINPAGE_ENGLISH_BUTTON}                 //a[contains(@href, 'lang=en') and contains(@title, 'Change language')]
${ERC_LOGINPAGE_FRENCH_BUTTON}                  //a[contains(@href, 'lang=fr') and contains(@title, 'Change language')]
${ERC_LOGINPAGE_DETECT_LANGUAGE_ENGLISH}        //a[contains(@href,"lang=en")]
${ERC_LOGINPAGE_DETECT_LANGUAGE_FRENCH}         //a[contains(@href,"lang=fr")]

*** Keywords ***
Login at ERC Homepage
    [Documentation]     This keyword used to login to ERC Server
    [Arguments]     ${username}=${GLOBAL_ERC_TRADER_USERNAME}    ${password}=${GLOBAL_ERC_TRADER_PASSWORD}
    Go to   url=${GLOBAL_ERC_SERVER_URL}
    Wait Until Element Is Enabled   xpath=${ERC_LOGINPAGE_USERNAME}  timeout=${ERC_LOGINPAGE_WAITING_TIMEOUT}
    input text      xpath=${ERC_LOGINPAGE_USERNAME}  ${username}
    input password  xpath=${ERC_LOGINPAGE_PASSWORD}  ${password}
    click button   xpath=${ERC_LOGINPAGE_LOGIN_BTN}

ERC Page should be in English
    [Documentation]       This keyword is used to verify that the eRC Application Page should be in ENGLISH
    Click Element         xpath=${ERC_LOGINPAGE_ENGLISH_BUTTON}
    ${must_be_language}=  Set Variable           ENGLISH
    ${current_language}=  Detect Language used in ERC Page
    Should be Equal       ${must_be_language}    ${current_language}

Detect Language used in ERC Page
    [Documentation]    This keyword is used to detect the language used in current ERC.
    ${count_english_links}=  Get Element Count  ${ERC_LOGINPAGE_DETECT_LANGUAGE_ENGLISH}
    ${count_french_links}=   Get Element Count  ${ERC_LOGINPAGE_DETECT_LANGUAGE_FRENCH}
    ${language_used}=        Set Variable If    ${count_english_links} > ${count_french_links}  ENGLISH
    ...                                         ${count_french_links} > ${count_english_links}  FRENCH   ERROR
    [Return]    ${language_used}




