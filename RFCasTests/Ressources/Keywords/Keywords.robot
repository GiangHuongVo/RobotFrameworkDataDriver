*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    OperatingSystem
Library    XML
Library    Collections

Variables    ../Locators/locatorAlfresco.py

*** Variables ***
${vURL}           http://localhost:8088/share/page
${vBrowser}       chrome
${vUsername}      admin
${vPassword}      12345678
${TIMEOUT}        5s

*** Keywords ***
######---	RQ6.BF3.1	Créer un nouveau filtre ###########
Open browser login and preconditions pour creer nouveau filtre nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}    
    Sleep    3
    Affichage la page Outil Admin
    Affichage la page de Gestionnaire de recherche 

#########--RQ6.BF3.5     Éditer le nom d’un filtre ###########
Open browser login and preconditions pour editer un nom du filtre nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}    
    Sleep    3
    Affichage la page Outil Admin
    Affichage la page de Gestionnaire de recherche 

#########--RQ6.BF2.3  Éditer une catégorie ###########
Open browser login and preconditions pour editer un nom du categorie nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}    
    Sleep    3
    Affichage la page Outil Admin
    Affichage l'option de menu dans la page Outil Admin    Gestionnaire de catégories  
    
Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur   
    Open Browser    ${vURL}    ${vBrowser}    options=add_argument('--lang=fr')

    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe
    Input text    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button    ${btn_Login}
    # S'assurer que la page est chargee
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain    ${lblTitle}    Tableau de bord de
Logout
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
   

Affichage la page Outil Admin  
    # Click sur Outil admin
    Wait Until Element Is Visible    ${link_headerOutilsAdmin}
    Click Element    ${link_headerOutilsAdmin}
    # Sleep    3   
    Wait Until Element Is Visible    ${link_GestionnaireCategorie}

Affichage l'option de menu dans la page Outil Admin
    [Arguments]    ${option}
    Click Element    ${admin_Page_Element_P1}${option}${admin_Page_Element_P2}   
    Sleep    3

Affichage la page de Gestionnaire de recherche
    Affichage l'option de menu dans la page Outil Admin    Gestionnaire de recherche
    Sleep    3
    Wait Until Element Is Visible    ${link_Ici}
    Click Element    ${link_Ici}
    Sleep    4


