@echo off
REM Run Website as Native App Using Microsoft Edges
REM Read User Input to get the URL and put it inside "natsu_native_url" variable
:EnterForUrl
cls
set /P natsu_native_url=Please Enter the URL you want to make it as native app Example(https://youtube.com):

REM Make sure the "natsu_native_url" its not empty string
if "%natsu_native_url%"=="" (
	echo Please Enter the URL to Continue!
	REM Block user input until the timeout is over :/
	TIMEOUT 5 /NOBREAK
	cls
	goto EnterForUrl
) else (
	goto it_is_a_URL_or_domain_name
)
REM We want the full url not just a domain name
REM otherwise it will create native app for search engine only
:it_is_a_URL_or_domain_name
echo %natsu_native_url% | findstr /b /r "^https:\/\/">nul

if errorLevel 1 (
	echo Invalid URL!, the valid url must begin with https://
	TIMEOUT 5 /NOBREAK
	cls
	goto EnterForUrl
) else (
	call "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="%natsu_native_url%"
	exit
)
REM DONE