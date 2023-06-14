*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
#logins et mot de passe
${user1}          standard_user
${user2}          locked_out_user
${user3}          problem_user
${user4}          performance_glitch_user
${mdppourtous}    secret_sauce
${user_vide}      ${EMPTY}
${mdp_vide}       ${EMPTY}

#Xpath acceuil
${champs_username}        //*[@id="user-name"]
${champs_password}        //*[@id="password"]       
${bouton_Login}           //*[@id="login-button"]
${champs_message}         //*[@id="login_button_container"]/div/form/div[3]/h3

#Xpath inventaire
${bouton_add_to_cart_Sauce Labs Bike Light}   //*[@id="add-to-cart-sauce-labs-bike-light"]
${champs_bikelight_nom}         //*[@id="item_0_title_link"]/div
${champs_bikelight_prix}        //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div

#Xpath panneau principal
${panneau_element_panier}                 //*[@id="shopping_cart_container"]/a

#Xpath panier
${champs_panier_Sauce Labs Bike Light}    //*[@id="item_0_title_link"]/div
${champs_prix_Sauce Labs Bike Light}      //*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div
${bouton_checkout}                        //*[@id="checkout"]

#Xpath checkout 1
${champs_checkout1_first_name}   //*[@id="first-name"]
${champs_checkout1_last_name}    //*[@id="last-name"]
${champs_checkout1_postal_code}  //*[@id="postal-code"]
${button_checkout1_continue}  //*[@id="continue"]

#Xpath checkout 2
${champs_checkout2_article_nom}     //*[@id="item_0_title_link"]/div
${champs_checkout2_article_prix}    //*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]/div

#Messages d'erreur
${message_erreur_locked_out_user}    Epic sadface: Sorry, this user has been locked out.
${message_erreur_user_vide}          Epic sadface: Username is required
${message_erreur_mot_de_passe_vide}  Epic sadface: Password is required

*** Test Cases ***
Se connecter à SauceDemo

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

    Close All Browsers

Se connecter à SauceDemo puis acheter la bike light

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
    ${article_panier_nom}=  Get Text    ${champs_panier_Sauce Labs Bike Light}
    ${article_panier_prix}=  Get Text    ${champs_prix_Sauce Labs Bike Light}

    #Assertion sur le prix et nom entre la sélection du produit et les valeurs du panier
    Should Be Equal    ${article_nom}     ${article_panier_nom}
    Should Be Equal    ${article_prix}    ${article_panier_prix}

    Close All Browsers


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


*** Keywords ***