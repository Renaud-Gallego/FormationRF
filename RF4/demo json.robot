*** Settings ***
Library    JSONLibrary

*** Test Cases ***

Valider valeur du JSOn
    ${json_obj}=    Load Json From File    C:\\Users\\Formation\\Repos\\RF4\\data.json
    Log  ${json_obj}

    ${json_timezones}=   Get Value From Json    ${json_obj}    $.timezones
    Log  ${json_timezones}

    ${json_currencies}=   Get Value From Json    ${json_obj}    $.currencies
    Log  ${json_currencies}
