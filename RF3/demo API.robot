*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${endpoint}    https://jsonplaceholder.typicode.com
${service1}    /posts

${integer_status_code_OK}         ${200}
${integer_status_code_Created}    ${201}
${string_status_code_OK}          200
${string_status_code_Created}     201

${integer_reason_OK}         OK
${integer_reason_Created}    Created

*** Test Cases ***
Envoi requête GET /POSTS
    Create Session    mysession    ${endpoint}

    ${Réponse}=  GET On Session    mysession     ${endpoint}${service1}
    
    Log    ${Réponse.status_code}
    Log    ${Réponse.reason}
    Log    ${Réponse.headers}
    Log    ${Réponse.content}
    Log    ${Réponse.json()}

    
    # ${headers}        Set Variable    ${Réponse.headers}
    # Log    headers
    # Log    ${headers}

    # ${Date}                                        Get From Dictionary     ${headers}    Date
    # ${Content-Type}                                Get From Dictionary     ${headers}    Content-Type
    # ${Transfer-Encoding}                           Get From Dictionary     ${headers}    Transfer-Encoding
    # ${Connection}                                  Get From Dictionary     ${headers}    Connection
    # ${X-Powered-By}                                Get From Dictionary     ${headers}    X-Powered-By
    # ${X-Ratelimit-Limit}                           Get From Dictionary     ${headers}    X-Ratelimit-Limit
    # ${X-Ratelimit-Remaining}                       Get From Dictionary     ${headers}    X-Ratelimit-Remaining
    # ${X-Ratelimit-Reset}                           Get From Dictionary     ${headers}    X-Ratelimit-Reset
    # ${Vary}                                        Get From Dictionary     ${headers}    Vary
    # ${Access-Control-Allow-Credentials}            Get From Dictionary     ${headers}    Access-Control-Allow-Credentials
    # ${Cache-Control}                               Get From Dictionary     ${headers}    Cache-Control
    # ${Pragma}                                      Get From Dictionary     ${headers}    Pragma
    # ${Expires}                                     Get From Dictionary     ${headers}    Expires
    # ${X-Content-Type-Options}                      Get From Dictionary     ${headers}    X-Content-Type-Options
    # ${Etag}                                        Get From Dictionary     ${headers}    Etag
    # ${Content-Encoding}                            Get From Dictionary     ${headers}    Content-Encoding
    # ${Via}                                         Get From Dictionary     ${headers}    Via
    # ${CF-Cache-Status}                             Get From Dictionary     ${headers}    CF-Cache-Status
    # ${Age}                                         Get From Dictionary     ${headers}    Age
    # ${Report-To}                                   Get From Dictionary     ${headers}    Report-To
    # ${NEL}                                         Get From Dictionary     ${headers}    NEL
    # ${Server}                                      Get From Dictionary     ${headers}    Server
    # ${CF-RAY}                                      Get From Dictionary     ${headers}    CF-RAY

    # Log  ${Date}
    

    # Should Be Equal                ${Réponse.status_code}    ${integer_status_code_OK}
    # Should Be Equal As Integers    ${Réponse.status_code}    ${string_status_code_OK}

    
    # ${content}=    ${Réponse.content}
    # ${element}    Get From List    ${content}    0
    # Log           ${element}

    Log        ${Réponse.json()}[0]
    Log        ${Réponse.json()}[0][userId]
    Log        ${Réponse.json()}[0][id]
    Log        ${Réponse.json()}[0][body]




Envoi requête POST
    Create Session    mysession    ${endpoint} 

    ${data}=    Create Dictionary    userId=25    id=30    title=titre de l'entrée de renaud    body=corps de l'entrée de renaud
    ${Réponse}=    POST On Session    mysession    ${endpoint}${service1}    json=${data}

    Log    ${Réponse.status_code}
    Log    ${Réponse.reason}
    Log    ${Réponse.headers}
    Log    ${Réponse.content}
    Log    ${Réponse.json()}

    Should Be Equal As Numbers    ${Réponse.status_code}    ${integer_status_code_Created}
    Should Be Equal As Strings    ${Réponse.reason}         ${integer_reason_Created}

    Log    ${Réponse.json()}[userId]
    Log    ${Réponse.json()}[id]
    Log    ${Réponse.json()}[title]
    Log    ${Réponse.json()}[body]

    Log    ${data.userId}
    Log    ${data.id}
    Log    ${data.title}
    Log    ${data.body}

    Should Be Equal    ${Réponse.json()}[userId]    ${data.userId}
    Should Be Equal    ${Réponse.json()}[id]        ${data.id}
    Should Be Equal    ${Réponse.json()}[title]     ${data.title}
    Should Be Equal    ${Réponse.json()}[body]      ${data.body}

# {
#   "type": "array",
#   "items": [
#     {
#       "type": "object",
#       "properties": {
#         "userId": {
#           "type": "integer"
#         },
#         "id": {
#           "type": "integer"
#         },
#         "title": {
#           "type": "string"
#         },
#         "body": {
#           "type": "string"
#         }
#       },
#       "required": [
#         "userId",
#         "id",
#         "title",
#         "body"
#       ]
#     }
#   }


*** Keywords ***