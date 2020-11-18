*** Settings ***
Library           SeleniumLibrary    timeout=300

*** Variables ***
${PROPERTY_NAME}            015  Mall
${PROPERTY_ADDRESS}         Roche Tower
${PROPERTY_COUNTRY_ID}      115

*** Test Cases ***
Scenario 2 : Add a property with a multiple rentable units
    [Tags]    Sanity
    Set Tags    Scenario2
    Given I am a user
    And I am logged into the AUT already
    When I click on Properties dropdown on the left-hand panel
    And I click on the Add property button
    And I select Property with a multiple rentable units option
    And I enter all the required fields in the input text boxes
    And I make sure that the “I manage this Property” checkbox is ticked
    And I select the number of rentable units to be any number more than 1
    And I click on the “Next, Units Settings” button
    And I select all fields under Unit Settings section
    And I click on Add Property button
    Then I have successfully added a property with a multiple units
    And I click on Properties from the left-hand panel
    And I validate that the property I have just created is present

*** Keywords ***
I am a user
    Log To Console  I am a user

I am logged into the AUT already
    Log To Console  I am logged into the AUT already

I click on Properties dropdown on the left-hand panel
    Click Element  xpath://*[@id="main-menu"]/li[3]/a/span

I click on the Add property button  
    Wait Until Element Is Visible  xpath://div[@class='actions']/ul/li[1]/a
    Click Element  xpath://div[@class='actions']/ul/li[1]/a
    
I select Property with a multiple rentable units option
    # Wait Until Element Is Visible  xpath://div[@id='main']/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[2]/div[1]/div[2]/div[2]
    Wait Until Element Is Visible  xpath://div[@class='select-property-description']/div[2]
    #//div[@class='select-property-description']/div[2]/div
    Click Element  xpath://div[@class='select-property-description']/div[2]
    Capture Page Screenshot

I enter all the required fields in the input text boxes
    Input Text  id:ProfileAddressName  ${PROPERTY_NAME}
    Wait Until Element Is Visible  xpath://div[@class='select2-container widthEm21 entity-select']
    Click Element  xpath://div[@id='s2id_PropertyOwnerId']
    Click Element  xpath://*[@class='select2-results']/li/div[contains(text(),'AutomateA')]
    Input Text  id:ProfileAddress1  ${PROPERTY_ADDRESS}
    Select From List By Value  id:ProfileCountryId  ${PROPERTY_COUNTRY_ID}
    Capture Page Screenshot

I make sure that the “I manage this Property” checkbox is ticked
    Checkbox Should Be Selected  id:PropertyFullAccess

I select the number of rentable units to be any number more than 1
    Input Text  id:PropertyUnitCount  2

I click on the “Next, Units Settings” button
    Execute JavaScript  document.querySelector("input.next-page").click()

I select all fields under Unit Settings section
    Click Element  xpath://div[@class='unit-setting']/div[2]/select/option[5]
    Click Element  xpath://div[@class='unit-setting']/div[3]/select/option[2]
    Wait Until Element Is Visible  xpath://div[@id='s2id_PrefixUnitUnitOwnerId']
    Click Element  xpath://table[@class='multi-unit-table']/tbody/tr[1]/td[2]/div/select/option[2]   
    Click Element  xpath://table[@class='multi-unit-table']/tbody/tr[1]/td[3]/div/select/option[2]
    Click Element  xpath://table[@class='multi-unit-table']/tbody/tr[2]/td[2]/div/select/option[3]
    Click Element  xpath://table[@class='multi-unit-table']/tbody/tr[2]/td[3]/div/select/option[2] 
    Capture Page Screenshot

I click on Add Property button  
    Execute JavaScript  document.querySelector("input.submit").click()
               
I have successfully added a property with a multiple units
    Wait Until Page Contains Element  //div[@class='detail ']/div/h2[contains(text(),'Multiple Units Added ')]
    Element Should Be Visible  //div[@class='detail ']/div/h2[contains(text(),'Multiple Units Added ')] 
    Capture Page Screenshot

I click on Properties from the left-hand panel
    Execute JavaScript  document.querySelector("li.alias-properties").click()
    Sleep  2s
    Execute JavaScript  document.querySelector("a[href='/candidateone/properties/index']").click()

I validate that the property I have just created is present
    Wait Until Page Contains Element  xpath://span[@class='table-info']/a[contains(text(),'${PROPERTY_NAME}')]
    Element Should Be Visible  xpath://span[@class='table-info']/a[contains(text(),'${PROPERTY_NAME}')]
