*** Settings ***


*** Variables ***

*** Keywords ***

One Argument
    [Arguments]    ${arg_name}
    Log    Got argument ${arg_name}   console=True

Three Arguments
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Log    1st argument: ${arg1}    console=True
    Log    2nd argument: ${arg2}    console=True
    Log    3rd argument: ${arg3}    console=True

One Argument With Default Value
    [Arguments]    ${arg}=default value
    [Documentation]    This keyword takes 0-1 arguments
    Log    Got argument ${arg}  console=True

Two Arguments With Defaults
    [Arguments]    ${arg1}=default 1    ${arg2}=${VARIABLE}
    [Documentation]    This keyword takes 0-2 arguments
    Log    1st argument ${arg1}
    Log    2nd argument ${arg2}

One Required And One With Default
    [Arguments]    ${required}    ${optional}=default
    [Documentation]    This keyword takes 1-2 arguments
    Log    Required: ${required}
    Log    Optional: ${optional}

Default Based On Earlier Argument
    [Arguments]    ${a}    ${b}=${a}    ${c}=${a} and ${b}
    Should Be Equal    ${a}    ${b}
    Should Be Equal    ${c}    ${a} and ${b}

Add Two Integers
  [Arguments]   ${i1}   ${i2}
  ${result}=    Evaluate    ${i1} + ${i2}
  [return]    ${result}


Swap Two Items 
  [Arguments]   ${i1}   ${i2}
  [return]    ${i2}   ${i1}

*** Test Cases ***

Example
  One Argument      "Hello, World"
  One Argument With Default Value   
  Three Arguments   arg1=A   arg3=B   arg2=C
  ${add_result}=    Add Two Integers    10    20 
  Log               ${add_result}   console=True 
  ${rv1}  ${rv2}=            Swap Two Items    10    20 
  Log               ${rv1} and ${rv2}   console=True
  No Operation
      






  