*** Settings ***
Library  RPA.OpenAI

*** Variables ***
${api_key}    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


*** Tasks ***
Create a text completion
    Authorize To OpenAI   ${api_key}
    
    ${completion}    Completion Create
    ...     Write robotframework script to test GET request of https://jsonplaceholder.typicode.com/posts using libraries RequestsLibrary and JSONLibrary
    ...     temperature=0.6
    Log   ${completion}