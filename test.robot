*** settings ***
Library             C:/Users/Pichau/kevin-lima/Automatizacao/Robot-Framework-Pywinauto-Library-master/PywinautoLibrary.py
Library             SikuliLibrary
Library             ./lib/loadExcelLib.py
Library             PuppeteerLibrary
Test Setup          Add Needed Image Path 
*** Variables ***
${IMAGE_DIR}        ${CURDIR}\\img
${EXCEL_DIR}        ${CURDIR}\\excel
${DEFAULT_BROWSER}    pwchrome
*** Test Cases ***
Abrir a calculadora
    Abrir a Calculadora
    Digitar Oito
    Digitar Operador Soma
    Digitar Dois
    Digitar Operador Igual
    Chamar Funcao Excel 
    Abrir Chrome
Open browser without option
    ${BROWSER} =     Get variable value    ${BROWSER}    ${DEFAULT_BROWSER}
    Open browser    http://https://www.google.com/    browser=${BROWSER}
Mouse over event
    Run Async Keywords
    ...    Mouse Over    title=Pesquisar 
    Click Element    title=Pesquisar
*** Keywords ***
Add Needed Image Path 
    Add Image Path          ${IMAGE_DIR}
Abrir a Calculadora
    Start Application       C:/Windows/System32/calc.exe
Digitar Oito
    SikuliLibrary.click     imagem_oito.png
Digitar Operador Soma
    SikuliLibrary.click     imagem_soma.png
Digitar Dois
    SikuliLibrary.click     imagem_dois.png
Digitar Operador Igual
    SikuliLibrary.click     imagem_igual.png
Chamar Funcao Excel 
    ${result}=  Obter Dados Excel
    log  result: ${result}
Abrir Chrome
    Start Application       C:/Program Files (x86)/Google/Chrome/Application/chrome.exe

