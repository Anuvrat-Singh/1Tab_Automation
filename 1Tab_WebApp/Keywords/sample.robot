*** Settings ***
Library  SeleniumLibrary
Resource  Keywords.robot

*** Variables ***
${i}
${elem}  xpath=(//div/div/button[@class='btn btn-primary mr-1'])

*** Test Cases ***
test concatenate
    Website is up and running
    : For   ${i}   In Range    17   27
    \   ${res}=  catenate    SEPARATOR=   ${elem}  [${i}]
    \   Log to console  ${res}
    \   ${flag}  run keyword and return status  Element should be visible  ${res}
    \   Run keyword if  '${flag}'=='True'   Click element  ${res}