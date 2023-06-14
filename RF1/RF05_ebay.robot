*** Settings ***
Library  SeleniumLibrary
Library    Collections

*** Variables ***

${url}                https://www.ebay.fr/
${explorateur_testé}  chrome
${nom_article}        Iphone 14 pro max

#xpath
${champs_recherche_page_principale}       //*[@id="gh-ac"]
${bouton_rechercher_page_principale}      //*[@id="gh-btn"]
${bouton_accepter_cookies_banniere}       //*[@id="gdpr-banner-accept"]


*** Test Cases ***
Ajouter le moins des articles dans le panier
    Open Browser          ${url}                                 ${explorateur_testé}
    Input Text            ${champs_recherche_page_principale}    ${nom_article}

    Click Button          ${bouton_rechercher_page_principale}
    Sleep  1
    
    @{list_web_elements}=  Get WebElements    //*[@id="srp-river-results"]/ul/li
    ${nb_web_elements}=    Get Length       ${List_web_elements}    
    
    #FOR    ${web_element}    IN    @{List_web_elements}
    #    Log    ${web_element}   
    #END

    FOR    ${counter}     IN RANGE    0  3  1
        Log  ${list_web_elements}[${counter}]
        
        Log To Console    ${list_web_elements}[${counter}]
    END

    Close All Browsers

*** Keywords ***
Accéder au site (url)
    Open Browser    url        chrome

