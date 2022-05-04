*** Settings ***
Library  SeleniumLibrary
Variables  ../Resources/Locators.py

*** Variables ***
# Milestone link
${Milestone URL}    https://testrail.adsw.amazon.dev/index.php?/milestones/view/28869
${Browser}  firefox

*** Keywords ***
Login Action
    Open Browser  ${Milestone URL}  ${Browser}
    Wait Until Page Contains Element    ${txt_loginUserName}
    Input Text  ${txt_loginUserName}   reashmaj@amazon.com                        # Username
    Input Text  ${txt_loginPassword}    Passtest@1                                # Password
    Click Element   ${btn_login}                                                  # Login button
    Title Should Be 	Donut Puffin - Day 0 - TestRail
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Link  ${link_shipBAT}                                                    # BAT suite selection
    Click Element  ${elm_edit}                                                     # Edit button  (Top right)

BAT Home Page
    Click Link  ${link_addTestSuite}                                               # Add test suite (+)
    Select From List By Label  name:choose_suite_id     Home Products BAT Suite    # BAT suite selection (list)
    Click Button  ${btn_OK}                                                        # Okay button

Test Suite Creation
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Element  ${elm_pen}                                                      # Pen symbol
    Clear Element Text  ${txt_name}                                                # Text box clearing
    Input Text  ${txt_name}  Automated_BAT_Donut_Puffin_#1111                      # BAT cycle name
    Click Button  ${btn_BAT_Name}                                                  # BAT cycle OK button

Test Case Filter
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Link  ${link_select_cases}                                               # Select cases link
    sleep   10 seconds
    Click Element  ${da_ready}                                                     # DA ready link
    Click Element  ${da_ready_yes}                                                 # DA ready YES option
    Scroll Element Into View  ${device_affected}                                   # Device affected link
    Click Element  ${device_affected}
    Run Keyword And Ignore Error  Scroll Element Into View  ${device_affected_pascal}   # Device affected PASCAL option
    Click Element  ${device_affected_pascal}
    Run Keyword And Ignore Error    Scroll Element Into View  ${link_priority}
    Click Element  ${link_priority}                                                # Priority link
    Click Element  ${priority_any}                                                 # Priority ANY option
    Run Keyword And Ignore Error    Scroll Element Into View    ${link_TC_active}
    Click Element  ${link_TC_active}                                               # TC active link
    Click Element  ${TC_active_active}                                             # TC active ACTIVE option
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Link  ${set_selection}                                                   # Set selection option
    Click Button  ${select_cases_ok}                                               # Case selection page okay button

Saving Test Plan
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Button  ${save_test_plan_btn}
    Page Should Contain     Adding  Automated_BAT_Donut_Puffin_#1111
    Click Button  ${final_ok_btn}


