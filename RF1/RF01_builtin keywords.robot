*** Settings ***
...    #appel de librairies et d'autres fichiers sources

*** Variables ***

*** Test Cases ***
Consulter les logs
    Log To Console    un message inutile logué dans les logs

Vérifier que les valeurs sont identiques
    Should Be Equal    100    100
    Should Be Equal    Cham   Loïc


*** Keywords ***