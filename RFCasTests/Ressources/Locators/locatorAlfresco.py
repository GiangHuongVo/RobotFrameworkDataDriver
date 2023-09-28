#Login Page Elements
txt_UserName="name=username"
txt_Password="name=password"
btn_Login="xpath=//button[contains(text(), 'Connexion')]"

#Dashboard Page Elements
lbl_Title="xpath=//h1[@id='HEADER_TITLE']/span"
link_HeaderAccueil="id=HEADER_HOME"
link_HeaderMesFichier="id=HEADER_MY_FILES"
link_HeaderFichiersPartages="id=HEADER_SHARED_FILES_text"
link_HeaderSites="id:HEADER_SITES_MENU_text"
link_HeaderMesSites="id=HEADER_SITES_MENU_MY_SITES"
link_HeaderRechercheDeSites="id=HEADER_SITES_MENU_SITE_FINDER"
link_HeaderCreerUnSite="//*[@id='HEADER_SITES_MENU_CREATE_SITE_text']"
link_HeaderFavoris="id=HEADER_SITES_MENU_FAVOURITES"
link_HeaderTaches="id=HEADER_TASKS"
link_HeaderMesTaches="id=HEADER_MY_TASKS"
link_HeaderWorkflows="id=HEADER_MY_WORKFLOWS"
link_HeaderPersonnes="id=HEADER_PEOPLE"
link_HeaderEntrepot="id=HEADER_REPOSITORY"
link_headerOutilsAdmin="xpath=//div[@id='HEADER_ADMIN_CONSOLE']/span/a"
link_HeaderUserMenu="id=HEADER_USER_MENU_POPUP"
link_HeaderTableauDeBordUtilisateur="id=HEADER_USER_MENU_DASHBOARD"
link_HeaderMonProfil="id=HEADER_USER_MENU_PROFILE"
link_HeaderAide="id=HEADER_USER_MENU_HELP"
link_HeaderUtiliserLaPageActuelle="id=HEADER_USER_MENU_SET_CURRENT_PAGE_AS_HOME"
link_HeaderUtiliserMonTableauDeBord="id=HEADER_USER_MENU_SET_DASHBOARD_AS_HOME"
link_HeaderChangerLeMotDePasse="id=HEADER_USER_MENU_CHANGE_PASSWORD"
link_HeaderDeconnexion="id=HEADER_USER_MENU_LOGOUT"
img_Loupe="id=HEADER_SEARCH_BOX_DROPDOWN_MENU"
link_RechercheAvancee="id=HEADER_SEARCH_BOX_ADVANCED_SEARCH_text"
img_RoueDentee="id=HEADER_TITLE_MENU"
btn_Masquer="//button[text()='Masquer']"
btn_Ok="//button[text()='OK']"
btn_Annuler="//button[text()='Annuler']"
link_RechercherSite="//input[@id='template_x002e_site-finder_x002e_site-finder_x0023_default-term']"
btn_Rechercher="//button[text()='Rechercher']"

#MonProfil Page Elements
link_HeaderCorbeille="id=template_x002e_toolbar_x002e_user-profile_x0023_default-user-trashcan-link"
txt_CorbeilleSearch="id=template_x002e_user-trashcan_x002e_user-trashcan_x0023_default-search-text"
btn_CorbeilleSearch="id=template_x002e_user-trashcan_x002e_user-trashcan_x0023_default-search-button-button"
chk_CorbeilleSite="xpath=//div[text()='urlmonsite']/ancestor::tr/td/div/input"
btn_CorbeilleSiteSupprimer="xpath=//div[text()='urlmonsite']/ancestor::tr/td/div/span/span/span/button[text()='Supprimer']"
btn_CorbeilleSiteSupprimerOK="xpath=//button[text()='OK']"

#Dashboard Config page elements
btn_ChangerDisposition="id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button"
btn_Mode="id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_ChangerDisposition_OK="id=template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button"

# Admin Page Elements
link_Application = "xpath://a[contains(text(),'Application')]"
link_GestionnaireCategorie = "xpath://a[contains(text(),'Gestionnaire de catégories')]"
link_GestionnaireRecherche = "xpath://a[contains(text(),'Gestionnaire de recherche')]"
link_GestionnaireTags = "xpath://a[contains(text(),'Gestionnaire de tags')]"
link_GestionnaireModele = "xpath://a[contains(text(),'Gestionnaire de modèles')]"
link_GestionnaireSites = "xpath://a[contains(text(),'Gestionnaire de sites')]"
link_TacheReplication = "xpath://a[contains(text(),'Tâches de réplication')]"
link_Groupes = "xpath://a[contains(text(),'Groupes')]"
link_Utilisateurs = "xpath://a[contains(text(),'Utilisateurs')]"
admin_Page_Element_P1="xpath://a[contains(text(),'"
admin_Page_Element_P2="')]"

# Locators Admin Tools => Ines
link_headerOutilsAdmin="xpath=//div[@id='HEADER_ADMIN_CONSOLE']/span/a"
link_optionOutilsAdminP1="//a[@href='"
link_optionOutilsAdminP2="']"

# Page Gestionnaire de categories
category_Title="xpath://div[@class='title' and text()='Gestionnaire de catégories']"
catagorie_racine = "id=ygtvlabelel1"
icon_ajouter_catagories = "xpath=//*[@id='ygtvlabelel1']/span[@title='Ajouter une catégorie']"
# Form creer une nouvelle categorie
popup_Title ="xpath=//div[@id='userInput_h']"
input_Nom_Categorie="xpath://div[@class='bd']/input[@type='text']"
btn_CreerCatagorie_OK ="xpath=//*[@type='button' and text()='OK']"
# Liste categories
icon_Editer_P1="//span[text()='"
icon_Editer_P2="']/descendant::span[@class='insitu-edit-category']"
input_Editer="//form[@method='post']/input[@name='name']"
btn_Editer_Enregistrer="//a[text()='Enregistrer']"
btn_Editer_Annuler="//a[text()='Annuler']"
# Supprimer Categorie
btn_SupprimerCategoriesP1="//span[text()='"
btn_SupprimerCategoriesP2="']/descendant::span[@class='insitu-delete-category']"
btn_SupprimerCategorieP3="//span[@class='button-group']/span[@class='yui-button yui-push-button']"
link_categorieP2="']"

# Gestion de Recherche
link_Ici="xpath://a[@href='/share/page/dp/ws/faceted-search-config']"
btn_CreerNouveauFiltre="xpath://span[text()='Créer un nouveau filtre']"
ID_du_Filtre="xpath://input[@name='filterID']"
Nom_du_filtre="xpath://input[@name='displayName']"
Proprieté_pour_filtrer_les_resultats="xpath://input[@id='FORM_FACET_QNAME_CONTROL']"
propriete_Combobox="xpath://div[@id='widget_FORM_FACET_QNAME_CONTROL_dropdown']/child::div[@id='FORM_FACET_QNAME_CONTROL_popup']"
propriete_Combobox_Value_P1="/child::div[text()='"
propriete_Combobox_Value_P2="']"
Le_bouton_enregistrer="//span[text()='Enregistrer']"
Disponibilite_du_Filtre="//tr [@role='presentation']//span[text()='Partout']"
Btn_list="//input[@role='button presentation']"
Prp_filtre_Resultat_part1="//div[text()='"
Prp_filtre_Resultat_part2="']"

# Verifier ID du filtre dans la page http://localhost:8088/share/page/dp/ws/faceted-search-config
id_du_Filtre_P1="xpath://span/child::span[text()='"
id_du_Filtre_P2="']"

bouton_supprimerFiltre1="xpath://img[@title=\"Cliquez pour supprimer \''"
bouton_supprimerFiltre2="''\"]"
bouton_confirmerSupressionFiltre="id:ALF_CRUD_SERVICE_DELETE_CONFIRMATION_DIALOG_CONFIRM_label"

bouton_ModifierNomFiltre1="xpath://img[@title=\"Cliquez pour modifier \''"
bouton_ModifierNomFiltre2="''\"]"
input_ModifierNomFiltre="xpath://input[@name='displayName']"
btn_Modifier_Nom_Filtre="xpath://span[text()='Enregistrer']"

nom_Du_Filtre_P1="//span[@class='label']/following-sibling::span[text()='"
nom_Du_Filtre_P2="']"

