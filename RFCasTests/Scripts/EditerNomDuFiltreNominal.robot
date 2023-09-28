*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Library           String
Library           Dialogs
Library           OperatingSystem
Library           Collections
Library           DataDriver    ../Ressources/Datapool/datapoolEditerFiltre.csv
Resource          ../Ressources/Keywords/keywords.robot
Suite Setup       Open browser login and preconditions pour editer un nom du filtre nominal
Suite Teardown    Logout
Test Template     Editer le nom un filtre nominal


*** Variables ***
${vURL}           http://localhost:8088/share/page
${vBrowser}       chrome
${vUsername}      admin
${vPassword}      12345678
${TIMEOUT}        20s

*** Test Cases ***
Test nominal editer un nom du filtre
    ${vID_du_filtre}    ${vNom_du_filtre}    ${vNom_du_filtre_modifier}


*** Keywords ***
Editer le nom un filtre nominal
    [Arguments]    ${vID_du_filtre}    ${vNom_du_filtre}    ${vNom_du_filtre_modifier}    
    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    # Creer Un Filtre avec propriete Site (pour facilite de test)
    Creer Un nouveau filtre avec propriete Site    ${vID_du_filtre}    ${vNom_du_filtre}
    Verifier l'ID du filtre    ${vID_du_filtre}
    # Test case
    Mouse Down On Image    ${bouton_ModifierNomFiltre1}${vNom_du_filtre}${bouton_ModifierNomFiltre2}
    Wait Until Element Is Visible    ${bouton_ModifierNomFiltre1}${vNom_du_filtre}${bouton_ModifierNomFiltre2}
    Click Image    ${bouton_ModifierNomFiltre1}${vNom_du_filtre}${bouton_ModifierNomFiltre2}
    Input Text    ${input_ModifierNomFiltre}    ${vNom_du_filtre_modifier}
    Sleep    5
    Mouse Down    ${btn_Modifier_Nom_Filtre}
    Click Element    ${btn_Modifier_Nom_Filtre}
    Sleep    5
    # Critere succes
    Verifier le nom du filtre    ${vNom_du_filtre_modifier}
    # Postcondition
    Supprimer un filtre    ${vID_du_filtre}
    Sleep    5

Verifier l'ID du filtre
    [Arguments]    ${vID_du_filtre}
    Wait Until Element Is Visible    ${id_du_Filtre_P1}${vID_du_filtre}${id_du_Filtre_P2}    timeout=10
    Element Should Be Visible     ${id_du_Filtre_P1}${vID_du_filtre}${id_du_Filtre_P2}

Verifier le nom du filtre
    [Arguments]    ${vNom_du_filtre}
   
    Wait Until Element Is Visible   ${nom_Du_Filtre_P1}${vNom_du_filtre}${nom_Du_Filtre_P2}   timeout=10
    Element Should Be Visible     ${nom_Du_Filtre_P1}${vNom_du_filtre}${nom_Du_Filtre_P2}

Creer Un nouveau filtre avec propriete Site
    [Arguments]    ${vID_du_filtre}    ${vNom_du_filtre}

    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    Sleep    3

    Wait Until Element Is Visible    ${btn_CreerNouveauFiltre}
    Click Element    ${btn_CreerNouveauFiltre}

    # Saisie des données du nouveau filtre ID
    Wait Until Element Is Visible    ${ ID_du_filtre}
    Input Text    ${ID_du_filtre}    ${vID_du_filtre}    

    # Saisie des données du nouveau filtre Nom
    Wait Until Element Is Visible    ${Nom_du_filtre}
    Input Text    ${Nom_du_filtre}    ${vNom_du_filtre}

   ${btnEnregistrer}=    Get WebElement    ${Le_bouton_enregistrer}
    Mouse Down    ${btnEnregistrer}

    # Cliquer sur Enregistrer
    Click Element    ${btnEnregistrer}
    Sleep    3


Supprimer un filtre
    [Arguments]    ${vID_du_filtre}    
    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    Wait Until Element Is Visible    ${bouton_supprimerFiltre1}${vID_du_filtre}${bouton_supprimerFiltre2} 
    Scroll Element Into View    ${bouton_supprimerFiltre1}${vID_du_filtre}${bouton_supprimerFiltre2}
    Click Element    ${bouton_supprimerFiltre1}${vID_du_filtre}${bouton_supprimerFiltre2}
    Wait Until Element Is Visible    ${bouton_confirmerSupressionFiltre}
    Click Element    ${bouton_confirmerSupressionFiltre}