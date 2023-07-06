***Comments***
Simple script to search 'nokia wikipedia' in google. Using firefox as web Browser
Then checks if there is a wikipedia link and opens the first available link
then waits for the page to load/


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           firefox
${SEARCH_KEYWORD}    Nokia wikipedia

*** Keywords ***
Check Loop Condition
    [Arguments]    ${index}
    ${first_link}    Get Text    xpath=(//h3)[${index+1}]/parent::a
    ${condition}    Run Keyword And Return Status    Should Contain    ${first_link}    Wikipedia
    [Return]    ${condition}

Open Wikipedia Page
    [Arguments]    ${index}
    Click Element    xpath=(//h3)[${index+1}]/parent::a
    Wait Until Page Contains Element    css=#firstHeading

*** Test Cases ***
Search for a keyword on Google and find the first wikipedia result
    Open Browser    https://www.google.com    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='GzLjMd']
    Click Element    xpath=//div[@class='GzLjMd']/button[@id='L2AGLb']
    Input Text    name:q    ${SEARCH_KEYWORD}
    Press Keys    name:q    ENTER
    Wait Until Page Contains Element    css=#result-stats
    ${count}    Get Element Count    xpath=(//h3)/parent::a
    FOR    ${index+1}    IN RANGE    ${count}
        ${condition}    Check Loop Condition    ${index+1}
        Run Keyword If    ${condition}    Open Wikipedia Page    ${index+1}
        BREAK
    END
