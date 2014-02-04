@echo off 

:: Domain Checks

echo Collecting Domaingroup Members...
del %userdomain%-domaingroup-members.txt
for /F "skip=4 delims=*" %%i in ('net group /domain') do @net group "%%i" /domain >> %computername%-domaingroup-members.txt

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net group /domain') do @net group "%i" /domain >> %userdomain%-domaingroup-members.txt 
