*** Settings ***
Library    String
Library    REST		 https://httpbin.org	   ssl_verify=false


# Set expectations

#     Expect response         { "status": { "enum": [200, 201, 204, 400] } }
#     Expect response         { "seconds": { "maximum": 5 } }

*** Variables ***
${post_body}=     {"title": "My First Post", "content": "Hello All! I am here!"}   

*** Test Cases ***

Create a post
  ${resp}=    POST      /post       body=${post_body}   headers={"accept": "application/json"}
  ${body}=    Set Variable   ${resp}[body][json]
  Log    X ${body}   console=True 
  Integer   response status    200
  Should Be Equal   200    200        






  