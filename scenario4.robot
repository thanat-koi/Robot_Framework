*** Settings ***
Library           SeleniumLibrary    timeout=300

*** Variables ***

*** Test Cases ***
Scenario 4 : Logout of system
    [Tags]    Sanity
    Set Tags    Scenario4
    Given I am a user
    And I am logged into the AUT already
    When I click on my account image
    And I will see a panel called “Account” open after that
    And I click on the drop down
    And I click on “sign out”
    Then I will be redirected to the Arthur lockdown page
    And I close the browser

*** Keywords ***
I am a user
    Log To Console  I am a user

I am logged into the AUT already
    Log To Console  I am logged into the AUT already

I click on my account image
    Click Element  xpath://div[@class="expanded-element"]
    Capture Page Screenshot

I will see a panel called “Account” open after that
    Wait Until Element Is Visible  xpath://div[@class="xpanel-title"][contains(text(),'Account')]
    Element Should Be Visible  xpath://div[@class="xpanel-title"][contains(text(),'Account')]

I click on the drop down
    Wait Until Element Is Visible   xpath://div[@id='accountPanel106943e6b88cdd42aa3670a25ab29e963b105f']/div[3]/div/button
    Click Button  xpath://div[@id='accountPanel106943e6b88cdd42aa3670a25ab29e963b105f']/div[3]/div/button

I click on “sign out”
    Wait Until Element Is Visible  xpath://ul[@class="dropdown-actions2"]/li/a[contains(text(),'Sign Out')]
    Click Element  xpath://ul[@class="dropdown-actions2"]/li/a[contains(text(),'Sign Out')]

I will be redirected to the Arthur lockdown page
    Wait Until Element Is Visible  class:lockdown
    Capture Page Screenshot

I close the browser
    Log To Console  Close
    Close Browser