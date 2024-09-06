# REST-API-Automation-Project
This project focuses on automating REST API tests using Robot Framework and the RequestsLibrary. It includes sending a POST request to the Reqres API, validating the status code, and verifying the content of the response body. This setup aims to simplify API testing by automating repetitive tasks and ensuring that the API behaves as expected.

![image](https://github.com/user-attachments/assets/8d3f8473-e5ca-4afc-bdd9-0f4822e7c7d8)
![image](https://github.com/user-attachments/assets/b656ef39-42e7-434b-973a-68c6f6c15df3)


# REST API Automation Project

## Overview
This project automates REST API testing using Robot Framework and the RequestsLibrary. It interacts with the Reqres API to send POST requests, validate status codes, and ensure the correctness of response content. This is particularly useful for performing regression tests and validating API behavior.

## Project Details
- **Author**: Enock Odhiambo Omondi
- **Version**: 1.0.0
- **API**: [Reqres API](https://reqres.in)
- **Robot Framework Libraries**:
  - RequestsLibrary
  - Collections

## Test Case: `Put_UsersLists`
The test case sends a POST request to the Reqres API to create a user with the following steps:
1. Establishes a session with the base URL.
2. Sends a POST request with user details (name and job).
3. Logs the status code and response content.
4. Validates the status code to ensure it is `201`.
5. Verifies the response body contains the expected user details (name: morpheus, job: leader).

### Sample Code
```robot
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

## How to Run the Tests

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/rest-api-automation.git


2. Install the necessary dependencies:

  pip install -r requirements.txt

3. Run the test case:

  robot .\TestCases\TC2_POST_USERS.robot

4. License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

5. Contact

For any questions or inquiries, please contact [enockodhiambo2@gmail.com].


