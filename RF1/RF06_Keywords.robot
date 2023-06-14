*** Settings ***
Library    SeleniumLibrary
Library    CSVLib
Resource   RF06_Resources.robot


*** Keywords ***
Ouvrir la page web
    [Arguments]    ${url}    ${browser}
    Open Browser   ${url}   ${browser}
    Maximize Browser Window
    Capture Page Screenshot
    Sleep    1

Se loguer avec nom d'utilisateur et mot de passe 
    [Arguments]    ${username}    ${password}
    Input Text    ${champs_username}    ${username}
    Input Text    ${champs_password}    ${password}
    Click Button  ${bouton_Login}
    Capture Page Screenshot
    Sleep    1

Ajouter article au panier
    [Arguments]    ${bouton_article}
    Click Button  ${bouton_article}
    Capture Page Screenshot

Sélectionner tous les articles
    @{list_web_elements}=  Get WebElements    //*[@id="inventory_container"]/div/div
    Log To Console    ${list_web_elements}


    ${list_web_elements} [0]

Cliquer sur panier du panneau principal
    Click Element  ${panneau_element_panier}
    Sleep    1


Récupérer JDD depuis fichier CSV
    [Arguments]    ${chemin_fichier_csv}    ${ligne}    ${colonne}
    ${data_csv}=  read csv as list    ${chemin_fichier_csv}
    Log To Console    ${data_csv}

    #${data_identifiants}=  ${data_csv}[1]
    Log To Console    ${ligne}+${colonne}
    Log To Console    ${data_csv}[1]
    Log To Console    finito

    [Return]  ${data_identifiants}[${colonne}]