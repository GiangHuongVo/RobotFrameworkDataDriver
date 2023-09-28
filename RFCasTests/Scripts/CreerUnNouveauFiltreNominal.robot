*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Library           String
Library           Dialogs
Library           OperatingSystem
Library           Collections
Library           DataDriver    ../Ressources/Datapool/datapoolCreerNouveauFiltre.csv
Resource          ../Ressources/Keywords/keywords.robot
Suite Setup       Open browser login and preconditions pour creer nouveau filtre nominal
Suite Teardown    Logout
Test Template     Créer un nouveau filtre


*** Variables ***
${vURL}           http://localhost:8088/share/page
${vBrowser}       chrome
${vUsername}      admin
${vPassword}      12345678
${TIMEOUT}        20s

*** Test Cases ***
Test nominal creer un nouveau filtre
    ${vID_du_filtre}    ${vNom_du_filtre}    ${proprieteOption}


*** Keywords ***
Créer un nouveau filtre    
    [Arguments]    ${vID_du_filtre}    ${vNom_du_filtre}    ${proprieteOption}

    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    Sleep    3

    Wait Until Element Is Visible    ${btn_CreerNouveauFiltre}
    Click Element    ${btn_CreerNouveauFiltre}

    # Saisie des données du nouveau filtre ID
    Wait Until Element Is Visible    ${ ID_du_filtre}
    Input Text    ${ID_du_filtre}    ${vID_du_filtre}    

    # Saisie des données du nouveau filtre Nom
    Mouse Down    ${Nom_du_filtre}
    Input Text    ${Nom_du_filtre}    ${vNom_du_filtre}    

    # Cliquer sur le boutton de la liste deroulante
    Wait Until Element Is Visible    ${Btn_list}
    Click Element    ${Btn_list}

    Wait Until Element Is Visible    ${propriete_Combobox}

    # Saisir les propietes pour filtrer les resultats
    Mouse Down    ${propriete_Combobox}${propriete_Combobox_Value_P1}${proprieteOption}${propriete_Combobox_Value_P2}
    Click Element    ${propriete_Combobox}${propriete_Combobox_Value_P1}${proprieteOption}${propriete_Combobox_Value_P2}
    
    ${btnEnregistrer}=    Get WebElement    ${Le_bouton_enregistrer}
    Mouse Down    ${btnEnregistrer}

    # Cliquer sur Enregistrer
    Click Element    ${btnEnregistrer}
    Sleep    3

    #Critere de succes    
    Verifier l'ID du filtre    ${vID_du_filtre}
    Sleep    3
    
    #Post condition    
    Supprimer un filtre    ${vID_du_filtre}
    Sleep    3


Verifier l'ID du filtre
    [Arguments]    ${idValue}
    Wait Until Element Is Visible    ${id_du_Filtre_P1}${idValue}${id_du_Filtre_P2}    timeout=10
    Element Should Be Visible     ${id_du_Filtre_P1}${idValue}${id_du_Filtre_P2}

Verifier le nom du filtre
    [Arguments]    ${vNom_du_filtre}
   
    Wait Until Element Is Visible   ${nom_Du_Filtre_P1}${vNom_du_filtre}${nom_Du_Filtre_P2}   timeout=10
    Element Should Be Visible     ${nom_Du_Filtre_P1}${vNom_du_filtre}${nom_Du_Filtre_P2}


Supprimer un filtre
    [Arguments]    ${idValue}    
    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    Wait Until Element Is Visible    ${bouton_supprimerFiltre1}${idValue}${bouton_supprimerFiltre2} 
    Scroll Element Into View    ${bouton_supprimerFiltre1}${idValue}${bouton_supprimerFiltre2}
    Click Element    ${bouton_supprimerFiltre1}${idValue}${bouton_supprimerFiltre2}
    Wait Until Element Is Visible    ${bouton_confirmerSupressionFiltre}
    Click Element    ${bouton_confirmerSupressionFiltre}