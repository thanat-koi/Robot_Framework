*** Settings ***
Library           SeleniumLibrary    timeout=300

*** Variables ***
${PROPERTY_NAME}    015  Mall
${LISTITEM}         xpath://table[@class='properties']/tbody/tr
${TRANS_DESC}       Test1
${AMOUNT_NET}       3

*** Test Cases ***
Scenario 3 : Add a statement in any unit
    [Tags]    Sanity
    Set Tags    Scenario3
    Given I am a user
    And I am logged into the AUT already
    And I have added a property already from the above scenario 2
    When I click on Units dropdown on the left-hand panel
    And I click on icon eye to view any unit record
    And I click on Statements section
    And I click on Add Transaction button
    And I select “Tenancy Receipt” as a Transaction Type
    And I enter all the required fields in the input text boxes
    And I click on Save Transaction button
    Then I have successfully added a transaction
    And I validate that a transaction I just created is present

*** Keywords ***
I am a user
    Log To Console  I am a user

I am logged into the AUT already
    Log To Console   Logged
    Capture Page Screenshot

I have added a property already from the above scenario 2
    Log To Console  I have added a property already from the above scenario 2

I click on Units dropdown on the left-hand panel
    Execute JavaScript   document.querySelector("li.alias-properties").click()
    Execute JavaScript   document.querySelector("a[href='/candidateone/properties/index']").click()
    Wait Until Element Is Visible   xpath://*[@class='table-info']/a[contains(text(),'${PROPERTY_NAME}')]
    Capture Page Screenshot

I click on icon eye to view any unit record
    Log To Console   click on icon eye to view any unit record
    Wait Until Element Is Visible  //span[@class="header-text" and text()="Property Name/Ref"]
    Wait Until Element Is Visible  xpath://input[@id="_q"]  5s
    Click Element  xpath://input[@id="_q"]
    Log To Console   Click Search
    Input Text  id:_q  ${PROPERTY_NAME}
    Click Element  xpath://div[@class="submit"]
    Log To Console  Wait table-info visible
    Wait Until Page Contains Element  xpath://*[@class='table-info']/a[contains(text(),'${PROPERTY_NAME}')]
    Log To Console  Table-info visible
    Click Element  xpath://*[@class='actions']/a/i
    Capture Page Screenshot

I click on Statements section
    Wait Until Page Contains Element  xpath://*[@class='table-info']/a[contains(text(),'${PROPERTY_NAME}')]
    Wait Until Element Is Visible  xpath://ul[@class='nav nav-tabs']/li/a[contains(text(),'Statements')]
    Click Element  xpath://ul[@class='nav nav-tabs']/li/a[contains(text(),'Statements')]
    Wait Until Element Is Visible  xpath://div[@class="box-header "]/div/h2[contains(text(),'Tenant Rent Statement')]
    Capture Page Screenshot

I click on Add Transaction button
    Log To Console  Clicked Add Transaction
    Click Element  xpath://a[@class=' btn'][contains(text(),' Add Transaction')]

I select “Tenancy Receipt” as a Transaction Type
    Log To Console  wait till element visible
    Select Frame   id:dialogiframe
    Wait Until Element Is Visible  xpath://select[@id='TransactionTransactionTypeId'] 
    Log To Console  Will select “Tenancy Receipt”
    Click Element  xpath://select[@id='TransactionTransactionTypeId'] 
    Click Element  xpath://select[@id='TransactionTransactionTypeId']/optgroup/option[contains(text(),'Tenancy Receipt')]
    Capture Page Screenshot

I enter all the required fields in the input text boxes
    Log To Console   Enter all the required fields
    Wait Until Element Is Visible  xpath://label[@for='TransactionDescription']
    Input Text  xpath://input[@id='TransactionDescription']  ${TRANS_DESC}
    Input Text  xpath://input[@id='TransactionAmount']  ${AMOUNT_NET}

I click on Save Transaction button
    Click Element  xpath://input[@class='btn btn-success btn-large submit-btn']

I have successfully added a transaction
    Log To Console  Successfully
    Wait Until Element Is Visible  xpath://span[@class='table-info'][contains(text(),'${TRANS_DESC}')]
    Capture Page Screenshot

I validate that a transaction I just created is present
    Element Should Be Visible  xpath://span[@class='table-info'][contains(text(),'${TRANS_DESC}')]



