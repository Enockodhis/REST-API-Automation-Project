*** Settings ***
Metadata    Author    Enock Odhiambo Omondi
Metadata    Version    1.0.0
Documentation  REST API AUTOMATION
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=    https://reqres.in

*** Test Cases ***
Put_UsersLists
    [Documentation]     Send Post Request and Validate the Status code along with the response body.
    [Tags]    Regression Tests
    Create Session    mysession    ${base_url}
    ${body}=    Create Dictionary    name=morpheus    job=leader
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    mysession    /api/users    data=${body}    headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    morpheus
    Should Contain    ${res_body}    leader
    #Should Contain    ${res_body}    883