*** Settings ***
Library           SeleniumLibrary    timeout=300

*** Variables ***
${URL}            https://staging.arthuronline.co.uk/login?X-MODE=QA-eW91LXdpbi1ub3RoaW5nCg
${BROWSER}        GC
${USERNAME}       dhruv+candidateone@firecreekweb.com
${PASSWORD}       Qwerty66#

*** Test Cases ***
Scenario 1 : Login to system
    [Tags]    Sanity
    Set Tags    Scenario1
    Given I am a user
    And I have an existing account on the AUT
    When I open the browser
    And I proceed to the AUT’s login page
    And I enter the login credentials which have been provided to me in the table above
    And I click on the login button
    Then I will be able to login to the AUT

*** Keywords ***
I am a user
    Log To Console  I am a user

I have an existing account on the AUT
    Log To Console  I have an existing account on the AUT

I open the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

I proceed to the AUT’s login page
    Capture Page Screenshot

I enter the login credentials which have been provided to me in the table above
    Input Text    id:UserEmail    ${USERNAME}
    Input Text    id:UserPassword    ${PASSWORD}

I click on the login button
    Click Element    class:submit
    Sleep   3s

I will be able to login to the AUT
    Capture Page Screenshot
    



