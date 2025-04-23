*** Settings ***
Documentation   This resource file is used for keywords in opening the browser and setup config prior to actual start of the test
Library     SeleniumLibrary


*** Variables ***
${ERC_SETUPTEARDOWN_WAITING_TIMEOUT}    0.5s
${WEBBROWSER}                           headlesschrome
${DEFAULT_DOWNLOADS_DIR}                ${EXECDIR}/Results
${LOG_LEVEL_STATUS}                     DEBUG
${SELENIUM_SPEED}                       0.005s
${SELENIUM_IMPLICIT_WAIT}               0.1s

*** Keywords ***
User to Open Browser
    Set Log Level                       level=${LOG_LEVEL_STATUS}
    Open Browser                        browser=${WEBBROWSER}
    Set Selenium Speed                  ${SELENIUM_SPEED}
    Set Selenium Implicit Wait          ${SELENIUM_IMPLICIT_WAIT}
    maximize browser window


User to Open Browser with preferred options
    [Documentation]     This Keyword is used to specify desired capabilities of a browser and change the default option
    [Arguments]                     ${preferred_download_directory}=${DEFAULT_DOWNLOADS_DIR}
    Set Log Level                   level=${LOG_LEVEL_STATUS}
    Set Selenium Speed              ${SELENIUM_SPEED}
    Set Selenium Implicit Wait      ${SELENIUM_IMPLICIT_WAIT}
    run keyword if                  '${WEBBROWSER}'  in 'googlechrome gc'   Open Chrome Browser with preferred options  ${preferred_download_directory}

Open Chrome Browser with preferred options
    [Documentation]     This keyword is using chrome browser and specifies intended capabilities before starting it
    [Arguments]         ${preferred_downloads_directory}=${DEFAULT_DOWNLOADS_DIR}
    ${preferred_downloads_directory}=   Normalize Path    ${preferred_downloads_directory}
    Create Directory        ${preferred_downloads_directory}
    ${chrome_options}=      Evaluate                 sys.modules['selenium.webdriver'].ChromeOptions()       sys, selenium.webdriver
    ${prefs}=               Create Dictionary        download.default_directory=${preferred_downloads_directory}      safebrowsing.enabled=false
    Call Method             ${chrome_options}        add_experimental_option         prefs                   ${prefs}
    ${options}=             Call Method              ${chrome_options}               to_capabilities
    Open Browser            browser=${WEB_BROWSER}   desired_capabilities=${options}
    Maximize Browser Window

Open Chrome Browser using Public
    ${list} =     Create List    --start-maximized    --disable-web-security    --safebrowsing.enabled=false    --ignore-certificate-errors
    ${args} =     Create Dictionary    args=${list}
    ${desired caps} =     Create Dictionary    platform=windows     chromeOptions=${args}
    Open Browser   browser=${WEB_BROWSER}    desired_capabilities=${desired caps}


User to Close Browser
     Close All Browsers

