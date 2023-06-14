*** Settings ***
...    #appel de librairies et d'autres fichiers sources

*** Variables ***
${variable_1}    100
${variable_2}    100
${variable_3}    Loïc
${variable_4}    Cham

*** Test Cases ***
Consulter les logs
    Log To Console    un message inutile logué dans les logs

Vérifier que les valeurs sont identiques
    Should Be Equal    ${variable_1}    ${variable_2}
    
    #Run Keyword And Continue On Failure permet de continue l'éxecution du test malgré un FAIl sur ce keyword
    Run Keyword And Continue On Failure  Should Be Equal    0    1 
    Run Keyword And Continue On Failure  Should Be Equal    ${variable_3}    ${variable_4}

Vérifier qu'une valeur contient une autre valeur
    Should Contain    un message avec un item typique    typique
    
    Should Start With        une ligne de caractères    une
    Should Not Start With    une ligne de caractères    ligne de

    Should End With        doit se termminer par un point    point
    Should Not End With    doit se termminer par un point    par un

       

    
*** Keywords ***