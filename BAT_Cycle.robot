*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Keyword.robot

*** Test Cases ***
Donut Puffin
    Login Action
    Set Selenium Speed  1.5 second
    BAT Home Page
    Test Suite Creation
    Test Case Filter
    Saving Test Plan







