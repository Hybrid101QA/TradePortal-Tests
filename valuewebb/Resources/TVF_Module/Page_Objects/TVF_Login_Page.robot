*** Settings ***
Documentation   This resource file used for keywords in TVF Login Pages and Buttons
Library     SeleniumLibrary
Library           BuiltIn

*** Variables ***
${TVF_LOGINPAGE_WAITING_TIMEOUT}    30s
${TVF_TEST_COUNTRY}                   CI
${TVF_TEST_SERVER}                    QA

&{TVF_SERVER_URL_OPTIONS}      CG_QA=https://guce-qa-cg.wfgmb.com/tvf/          CG_UAT=https://uat.douanes.gouv.cg/tvf/
...                            CF_QA=https://guce-qa-cf.wfgmb.com/tvf/          CF_UAT=http://uat.edouanes.cf/tvf/
...                            BJ_QA=https://guce-qa-bj.wfgmb.com/tvf/          BJ_UAT=https://uat.guce.gouv.bj/tvf
...                            CI_QA=https://guce-qa-ci.wfgmb.com/tvf           CI_UAT=https://uatapp2.webbfontaine.ci/tvf

&{TVF_TRADER_OPTIONS}          CG_QA_USER=tvf_ta_trader             CG_QA_PASS=12345678        CG_UAT_USER=tvf_ta_trader                   CG_UAT_PASS=12345678
...                            CF_QA_USER=tvftrader@test.com        CF_QA_PASS=Abce1234!@      CF_UAT_USER=wfgmbTA+trader@gmail.com        CF_UAT_PASS=Abce1234!@
...                            BJ_QA_USER=tvf_trader                BJ_QA_PASS=12345678        BJ_UAT_USER=jgregorio                       BJ_UAT_PASS=12345678
...                            CI_QA_USER=jgregorio                 CI_QA_PASS=12345678        CI_UAT_USER=ebasco                          CI_UAT_PASS=12345678

${GLOBAL_TVF_SERVER_URL}              ${TVF_SERVER_URL_OPTIONS}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}]
${GLOBAL_TVF_TRADER_USERNAME}         ${TVF_TRADER_OPTIONS}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}_USER]
${GLOBAL_TVF_TRADER_PASSWORD}         ${TVF_TRADER_OPTIONS}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}_PASS]
# Login Page
&{TVF_LOGIN_PAGE_USERNAME_INPUT}   CG_QA=(//input[@id="username"])[2]                 CG_UAT=(//input[@id="username"])[2]               CG_DO=(//input[@id="username"])[2]
...                                CF_QA=//input[@id="username"]                      CF_UAT=//input[@id="username"]                    CF_DO=//input[@id="username"]
...                                BJ_QA=//input[@id="username"]                      BJ_UAT=//input[@id="username"]                    BJ_DO=//input[@id="username"]
...                                CI_QA=//input[@id="username"]                      CI_UAT=//input[@id="username"]                    CI_DO=//input[@id="username"]
&{TVF_LOGIN_PAGE_PASSWORD_INPUT}   CG_QA=(//input[@id="josso_password"])[2]           CG_UAT=(//input[@id="josso_password"])[2]         CG_DO=(//input[@id="josso_password"])[2]
...                                CF_QA=//input[@id="password"]                      CF_UAT=//input[@id="password"]                    CF_DO=//input[@id="password"]
...                                BJ_QA=//input[@id="josso_password"]                BJ_UAT=//input[@id="josso_password"]              BJ_DO=//input[@id="josso_password"]
...                                CI_QA=//input[@id="josso_password"]                CI_UAT=//input[@id="josso_password"]              CI_DO=//input[@id=" josso_password"]
&{TVF_LOGIN_PAGE_LOGIN_BUTTON}     CG_QA=(//button[@name="login"])[2]                 CG_UAT=(//button[@name="login"])[2]               CG_DO=(//button[@name="login"])[2]
...                                CF_QA=//input[@id="kc-login"]                      CF_UAT=//input[@id="kc-login"]                    CF_DO=//input[@id="kc-login"]
...                                BJ_QA=//button[@name="login"]                      BJ_UAT=//button[@name="login"]                    BJ_DO=//button[@name="login"]
...                                CI_QA=//button[@name="login"]                      CI_UAT=//button[@name="login"]                    CI_DO=//button[@name="login"]

${TVF_LOGINPAGE_USERNAME}      ${TVF_LOGIN_PAGE_USERNAME_INPUT}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}]
${TVF_LOGINPAGE_PASSWORD}      ${TVF_LOGIN_PAGE_PASSWORD_INPUT}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}]
${TVF_LOGINPAGE_LOGIN_BTN}     ${TVF_LOGIN_PAGE_LOGIN_BUTTON}[${TVF_TEST_COUNTRY}_${TVF_TEST_SERVER}]
${TVF_LOGIN_SWITCH_ENGLISH_BUTTON}      //a[contains(@href, "/tvf/?lang=en") or contains(@href, "tvfGen/list?lang=en")]
${TVF_LOGIN_ENGLISH_BUTTON}                 //a[contains(@href, 'lang=en') and contains(@title, 'Change language')]
${TVF_LOGIN_FRENCH_BUTTON}                  //a[contains(@href, 'lang=fr') and contains(@title, 'Change language')]
${TVF_LOGIN_DETECT_LANGUAGE_ENGLISH}        //a[contains(@href,"lang=en")]
${TVF_LOGIN_DETECT_LANGUAGE_FRENCH}         //a[contains(@href,"lang=fr")]
${TVF_LOGIN_CHANGE_LANGUAGE_CONFIRM_YES}    //a[@id="changeLanguageConfirmOper"]
${DOMICILIATION_FEATURE}                AUTOMATIC
${TVF_LOGIN_SEARCHTVF_SEC}              //*[@id="searchTvfForm"]

*** Keywords ***
Login at TVF Homepage
    [Documentation]     This keyword used to login to TVF Server
    [Arguments]     ${username}=${GLOBAL_TVF_TRADER_USERNAME}   ${password}=${GLOBAL_TVF_TRADER_PASSWORD}
    Go to   url=${GLOBAL_TVF_SERVER_URL}
    Wait Until Element Is Enabled   xpath=${TVF_LOGINPAGE_USERNAME}  timeout=${TVF_LOGINPAGE_WAITING_TIMEOUT}
    Wait Until Element Is Visible   xpath=${TVF_LOGINPAGE_USERNAME}  timeout=${TVF_LOGINPAGE_WAITING_TIMEOUT}
    input text      xpath=${TVF_LOGINPAGE_USERNAME}  ${username}
    input password  xpath=${TVF_LOGINPAGE_PASSWORD}  ${password}
    click button    xpath=${TVF_LOGINPAGE_LOGIN_BTN}
    Page Should Contain Element    xpath=${TVF_LOGIN_SEARCHTVF_SEC}  timeout=${TVF_LOGINPAGE_WAITING_TIMEOUT}

TVF Page should be in English
    [Documentation]       This keyword is used to verify that the TVF Application Page should be in ENGLISH
    Click Element         xpath=${TVF_LOGIN_SWITCH_ENGLISH_BUTTON}
    ${must_be_lanugage}=  Set Variable           ENGLISH
    ${current_language}=  Detect Language used in TVF Page
    Should be Equal       ${must_be_lanugage}    ${current_language}

Detect Language used in TVF Page
    [Documentation]    This keyword is used to detect the language used in current ERC.
    ${count_english_links}=  Get Element Count  ${TVF_LOGIN_DETECT_LANGUAGE_ENGLISH}
    ${count_french_links}=   Get Element Count  ${TVF_LOGIN_DETECT_LANGUAGE_FRENCH}
    ${language_used}=        Set Variable If    ${count_english_links} > ${count_french_links}  ENGLISH
    ...                                         ${count_french_links} > ${count_english_links}  FRENCH   ERROR
    [Return]    ${language_used}

User to Set Features ON or OFF
    [Documentation]      This Keyword is used to turn on or off Features. Arguments needed but optional are ${TVF_TEST_COUNTRY} and ${TVF_TEST_SERVER}
    ...                  To set the feature on or off there will be 3 ways
    ...                  First: Manually turning ON or OFF the feature on below statuses, though it needs to commit and merge to master branch to take effect
    ...                  Second: Use variable syntax in robot command to turn ON or OFF the feature.
    ...                      Usage: robot -v DOMICILIATION_FEATURE:ON testcase.robot
    ...                  Third: In Case to use in Team City, it could be put in argument file (for robot) and in parameter (team city)
    ...                      Usage with argument file: (1) Call command line and write to argument file "--variable DOMICILIATION_FEATURE:ON"
    ...                                                (2) Then use the argument file as: robot -A argument_file.txt testcase.robot
    ...                      Argument files are useful specially when there is a lot of variables need to update instantly, which in this case turning on or off a feature
    [Arguments]          ${test_country_for_tvf}=${TVF_TEST_COUNTRY}   ${test_server_for_tvf}=${TVF_TEST_SERVER}
    ${feature1}=         Set Variable if
    ...                  '${DOMICILIATION_FEATURE}' == 'ON'                                ON
    ...                  '${DOMICILIATION_FEATURE}' == 'OFF'                               OFF
    ...                  '${test_country_for_tvf}_${test_server_for_tvf}' == 'CG_QA'       ON
    ...                  '${test_country_for_tvf}_${test_server_for_tvf}' == 'CG_UAT'      OFF
    Set Suite Variable   ${DOMICILIATION_FEATURE}     ${feature1}
