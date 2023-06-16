*** Settings ***
Library  RPA.OpenAI
Library    Collections

*** Variables ***
${api_key}   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

*** Tasks ***
Create completion
    Authorize To OpenAI   ${api_key}
    
    ${completion}    Completion Create
    ...     Write strawberry ice cream description for an ice cream shop.
    ...     temperature=0.6
    Log   ${completion}

Create chat completion without conversation history
    Authorize To OpenAI   ${api_key}
    
    ${response}   @{chatgpt_conversation}=     Chat Completion Create
    ...    user_content=Que signifie hibou ?
    Log    ${response}
    Log    @{chatgpt_conversation}

Continue the conversation by using the conversation argument
    Authorize To OpenAI   ${api_key}

    ${response}   @{chatgpt_conversation}=     Chat Completion Create
    ...    user_content=Que signifie tortue ?
    Log    ${response}
    Log    @{chatgpt_conversation}

    ${response}   @{chatgpt_conversation}=     Chat Completion Create
    ...    conversation=${chatgpt_conversation}
    ...    user_content=Quelle est se durée de vie moyenne ?
    Log    ${response}
    Log    @{chatgpt_conversation}
    
    Log To Console    @{chatgpt_conversation}
    
    List Should Contain Value    @{chatgpt_conversation}    "{'role': 'user', 'content': 'Que signifie tortue ?'}"

Create chat completion about Data set
    Authorize To OpenAI   ${api_key}
    
    ${response}   @{chatgpt_conversation}=     Chat Completion Create
    ...    user_content=Donne-moi un jeu de données sous forme d'une collection python qui contient 10 utilisateurs définient par leur prénom, nom, téléphone, date de naissance, genre, adresse mail, adresse postale.
    Log    ${response}



Afficher le contenu du deuxième objet

    ${value-to-search}=    Set Variable    tétrapode reptilien

    ${liste_objets}    Create List
    ...    {'role': 'user', 'content': 'Que signifie tortue ?'}
    ...    {'role': 'assistant', 'content': 'Une tortue est un animal tétrapode reptilien caractérisé par sa carapace qui protège son corps.'}
    ...    {'role': 'user', 'content': 'Quelle est se durée de vie moyenne ?'}
    ...    {'role': 'assistant', 'content': "La durée de vie moyenne des tortues dépend de leur espèce et de leur environnement. Certaines tortues terrestres peuvent vivre jusqu'à 100 ans, tandis que d'autres, comme les tortues marines, ont une durée de vie plus courte. En général, la durée de vie moyenne des tortues varie de 30 à 80 ans."}

    ${objet}      Set Variable    ${liste_objets}[1]
    ${content}    Evaluate        ${objet}\['content'\]

    ${bcontent_contains_value}    Run Keyword And Return Status    Should Contain    ${content}     ${value-to-search}

    IF    ${bcontent_contains_value}
        ${result}    Nouvelle question     Renvoie-moi une liste de ${value-to-search}
    END
    Log    ${result}

*** Keywords ***
Nouvelle question
    [Arguments]    ${question}
    Authorize To OpenAI    ${api_key}
    ${response}    @{chatgpt_conversation}    Chat Completion Create
    ...    user_content=${question}
    [Return]  ${response}