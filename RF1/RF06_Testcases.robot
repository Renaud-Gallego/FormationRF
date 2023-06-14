*** Settings ***
Library    SeleniumLibrary
Resource   RF06_Resources.robot
Resource   RF06_Keywords.robot


*** Test Cases ***
Se connecter à SauceDemo avec compte standard
    Ouvrir la page web    ${url_saucedemo}    ${browser}
    Se loguer avec nom d'utilisateur et mot de passe    ${user1}    ${mdppourtous}
    Close All Browsers


Acheter l'article Sauce Labs Bike Light
    [Tags]    EN CONSTRUCTION

    #Article à acheter
    ${bouton_add_to_cart}=  Set Variable  ${bouton_add_to_cart_Sauce Labs Bike Light}
    ${champs_article_nom}=  Set Variable  ${bouton_add_to_cart_Sauce Labs Bike Light}
    ${champs_article_prix}=  Set Variable  ${bouton_add_to_cart_Sauce Labs Bike Light}


    Ouvrir la page web    ${url_saucedemo}    ${browser}
    Se loguer avec nom d'utilisateur et mot de passe    ${user1}    ${mdppourtous}
    
    Ajouter article au panier    ${bouton_add_to_cart}
    
    #Récupération nom et prix de l'article
    ${article_nom}=  Get Text    ${champs_article_nom}
    ${article_prix}=  Get Text    ${champs_article_prix}

    Cliquer sur panier du panneau principal

    #Récupération nom et prix de l'article depuis panier
    ${article_panier_nom}=  Get Text    ${champs_panier_Sauce Labs Bike Light}
    ${article_panier_prix}=  Get Text    ${champs_prix_Sauce Labs Bike Light}

    #Assertion sur le prix et nom entre la sélection du produit et les valeurs du panier
    Should Be Equal    ${article_nom}     ${article_panier_nom}
    Should Be Equal    ${article_prix}    ${article_panier_prix}

    Close All Browsers





Test récup JDD csv
    ${data}=  Récupérer JDD depuis fichier CSV  ${chemin_JDD}    1    1
    Log To Console  ${data}


Acheter tous les produits
    Ouvrir la page web    ${url_saucedemo}    ${browser}
    Se loguer avec nom d'utilisateur et mot de passe    ${user1}    ${mdppourtous}
    Sélectionner tous les articles

Se connecter à SauceDemo puis acheter la bike light et finaliser

    #Ouverture de l'explorateur
    Open Browser    https://www.saucedemo.com    chrome
    Maximize Browser Window
    Capture Page Screenshot
    Sleep    1

    #Saisie nom d'utilisateur et mot de passe
    Input Text    ${champs_username}    ${user1}
    Capture Element Screenshot          ${champs_username}
    Input Text    ${champs_password}    ${mdppourtous}
    
    #Clique sur bouton Login
    Click Button  ${bouton_Login}
    Capture Page Screenshot
    Sleep    1

    #Clique "Add to cart" de la bike light
    Click Button    ${bouton_add_to_cart_Sauce Labs Bike Light}
    Capture Page Screenshot
    
    #Récupération nom et prix de l'article
    ${article_nom}=  Get Text    ${champs_bikelight_nom}
    ${article_prix}=  Get Text    ${champs_bikelight_prix}

    #Clique sur panier
    Click Element  ${panneau_element_panier}
    Capture Page Screenshot
    Sleep    1
        
    #Récupération nom et prix de l'article depuis panier
    ${article_panier_nom}=   Get Text    ${champs_panier_Sauce Labs Bike Light}
    ${article_panier_prix}=  Get Text    ${champs_prix_Sauce Labs Bike Light}

    #Assertion sur le prix et nom entre la sélection du produit et les valeurs du panier
    Should Be Equal    ${article_nom}     ${article_panier_nom}
    Should Be Equal    ${article_prix}    ${article_panier_prix}

    #Clique sur le bouton Checkout
    Click Button    ${bouton_checkout} 
    Capture Page Screenshot

    #Saisie données sur l'écran checkout
    Input Text    ${champs_checkout1_first_name}       bob
    Input Text    ${champs_checkout1_last_name}        ross 
    Input Text    ${champs_checkout1_postal_code}      44200  
    Capture Page Screenshot

    ${article_checkout2_nom}=  Get Text    ${champs_checkout2_article_nom}    
    ${article_checkout2_prix}=  Get Text    ${champs_checkout2_article_prix}



    #Get Substring 
    


    #Fermeture de tous les explorateurs web
    Close All Browsers


Se connecter avec utilisateur bloqué

    #Ouverture de l'explorateur
    Open Browser    https://www.saucedemo.com    chrome
    Maximize Browser Window
    Sleep    1
    Capture Page Screenshot

    #Saisie nom d'utilisateur et mot de passe
    Input Text    ${champs_username}    ${user2}
    Capture Element Screenshot          ${champs_username}
    Input Text    ${champs_password}    ${mdppourtous}
    
    #Clique sur bouton Login
    Click Button  ${bouton_Login}
    Sleep    1
    Capture Page Screenshot

    #Vérification du message d'erreur
    ${message_erreur}=  Get Text  ${champs_message}
    Should Be Equal    ${message_erreur_locked_out_user}    ${message_erreur}

    #Fermeture de tous les explorateurs web
    Close All Browsers


Se connecter avec utilisateur vide

    #Ouverture de l'explorateur
    Open Browser    https://www.saucedemo.com    chrome
    Maximize Browser Window
    Sleep    1
    Capture Page Screenshot

    #Saisie nom d'utilisateur et mot de passe
    Input Text    ${champs_username}    ${user_vide}
    Capture Element Screenshot          ${champs_username}
    Input Text    ${champs_password}    ${mdppourtous}
    
    #Clique sur bouton Login
    Click Button  ${bouton_Login}
    Sleep    1
    Capture Page Screenshot

    #Vérification du message d'erreur
    ${message_erreur}=  Get Text  ${champs_message}
    Should Be Equal    ${message_erreur_user_vide}    ${message_erreur}

    #Fermeture de tous les explorateurs web
    Close All Browsers


Se connecter avec mot de passe vide

    #Ouverture de l'explorateur
    Open Browser    https://www.saucedemo.com    chrome
    Maximize Browser Window
    Sleep    1
    Capture Page Screenshot

    #Saisie nom d'utilisateur et mot de passe
    Input Text    ${champs_username}    ${user1}
    Capture Element Screenshot          ${champs_username}
    Input Text    ${champs_password}    ${mdp_vide}
    
    #Clique sur bouton Login
    Click Button  ${bouton_Login}
    Sleep    1
    Capture Page Screenshot
    
    #Vérification du message d'erreur
    ${message_erreur}=  Get Text  ${champs_message}
    Should Be Equal    ${message_erreur_mot_de_passe_vide}    ${message_erreur}

    #Fermeture de tous les explorateurs web
    Close All Browsers