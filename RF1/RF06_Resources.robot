*** Variables ***

#Url et browser
${url_saucedemo}  https://www.saucedemo.com  
${browser}        chrome

#Logins et mots de passe depuis fichier csv
${chemin_JDD}     JDD.csv

#Logins et mot de passe
${user1}          standard_user
${user2}          locked_out_user
${user3}          problem_user
${user4}          performance_glitch_user
${mdppourtous}    secret_sauce
${user_vide}      ${EMPTY}
${mdp_vide}       ${EMPTY}

${user}           ${EMPTY}
${mdp}            ${EMPTY}

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