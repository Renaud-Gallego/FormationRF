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
    Should Be Equal    ${variable_3}    ${variable_4}

    
*** Keywords ***