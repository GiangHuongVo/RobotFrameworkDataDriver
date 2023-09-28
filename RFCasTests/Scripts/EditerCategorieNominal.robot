*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Library           String
Library           Dialogs
Library           OperatingSystem
Library           Collections
Library           DataDriver    ../Ressources/Datapool/datapoolEditerCategorie.csv
Resource          ../Ressources/Keywords/keywords.robot
Suite Setup       Open browser login and preconditions pour editer un nom du categorie nominal
Suite Teardown    Logout
Test Template     Editer une categorie nominal


*** Variables ***
${vURL}           http://localhost:8088/share/page
${vBrowser}       chrome
${vUsername}      admin
${vPassword}      12345678
${TIMEOUT}        10s

*** Test Cases ***
Test nominal editer un nom du filtre
    ${nomCategorie}    ${editerValue}


*** Keywords ***
Editer une categorie nominal    
    [Arguments]    ${nomCategorie}    ${editerValue}
    # Choisir le nom de categorie que vous voulez editer
    Mouse Over    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}
    Click Element    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}
    # Choisir l'icone Editer
    Mouse Over    ${icon_Editer_P1}${nomCategorie}${link_categorieP2}	
    Sleep    3
    Mouse Down    ${icon_Editer_P1}${nomCategorie}${icon_Editer_P2}
    Click Element    ${icon_Editer_P1}${nomCategorie}${icon_Editer_P2}
    Wait Until Element Is Visible    ${input_Editer}
    Input Text    ${input_Editer}    ${editerValue}
    Mouse Down    ${btn_Editer_Enregistrer}
    Click Element    ${btn_Editer_Enregistrer}       
    
    # Critere succes
    Verifier le nom de categorie    ${editerValue}



# Verifier que le nom du categorie est disponible
Verifier le nom de categorie
    [Arguments]    ${nomCategorie}    
    Wait Until Element Is Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}    timeout=10
    Element Should Be Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}

