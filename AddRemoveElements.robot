*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://the-internet.herokuapp.com/add_remove_elements/
${add_element}    xpath://button[contains(text(),'Add Element')]
${delete_element}    xpath://button[contains(text(),'Delete')]

*** Test Cases ***
Navigate to the page
    open browser    ${url}    ${browser}
    maximize browser window
    Sleep    1s
    verifyThePage
    addElement
    Sleep    1s
    verifyElements
    Sleep    1s
    removeElement
    Sleep    1s
    close browser

*** Keywords ***
verifyThePage
    page should contain element    xpath://h3[contains(text(),'Add/Remove Elements')]

addElement
    click Element    ${add_element}
    click Element    ${add_element}
    

verifyElements
    page should contain element    ${delete_element}
    page should contain element    xpath://body/div[2]/div[1]/div[1]/div[1]/button[2]


removeElement
    click Element    xpath://body/div[2]/div[1]/div[1]/div[1]/button[2]
    page should not contain element    xpath://body/div[2]/div[1]/div[1]/div[1]/button[2]

    click Element    ${delete_element}
    page should not contain element    ${delete_element}