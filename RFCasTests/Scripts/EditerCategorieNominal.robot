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
    # Creer un categorie
    Creer une categories    ${nomCategorie}
    Verifier le nom de categorie       ${nomCategorie}
    # Test case
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
    # Postcondition
    Supprimer Une Categorie    ${editerValue}


# Verifier que le nom du categorie est disponible
Verifier le nom de categorie
    [Arguments]    ${nomCategorie} 
    Sleep    15
    Reload Page   
    Wait Until Element Is Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}    timeout=10
    Element Should Be Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}

Creer une categories
    [Arguments]    ${nomCategorie}
    Wait Until Element Is Visible    ${catagorie_racine}
     sleep    3s
    Mouse Down    ${catagorie_racine}
    Wait Until Element Is Visible    ${icon_ajouter_catagories}
    Mouse Down     ${icon_ajouter_catagories}
    Click Element    ${icon_ajouter_catagories}
    Sleep    5
    # saisir le nom de catagorie a creer
    Wait Until Element Is Visible    ${popup_Title}
    Sleep    3
    Input Text    ${input_Nom_Categorie}    ${nomCategorie}
    Sleep    3
    # click sur le button OK
    Click Button    ${btn_CreerCatagorie_OK}
    Sleep    5

Supprimer Une Categorie
    [Arguments]    ${nomCategorie}
	
    # Afficher les actions possible devant la catégorie a supprimer
    Wait Until Element Is Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}
    Mouse Over    ${btn_SupprimerCategoriesP1}${nomCategorie}${link_categorieP2}
	# Le sleep permet d'attendre que la croix apparaisse
    Sleep    3
    # Cliquer sur la croix pour supprimer
    Wait Until Element Is Visible    ${btn_SupprimerCategoriesP1}${nomCategorie}${btn_SupprimerCategoriesP2}
    Click Element    ${btn_SupprimerCategoriesP1}${nomCategorie}${btn_SupprimerCategoriesP2}
    Sleep    2
    # Confirmer la suppression
    Wait Until Element Is Visible    ${btn_SupprimerCategorieP3}
    Click Element    ${btn_SupprimerCategorieP3}