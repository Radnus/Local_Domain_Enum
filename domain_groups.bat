@echo off 

:: Domain Checks

echo Collecting Domaingroup Members...
del %userdomain%-domaingroup-members.txt
for /F "skip=4 delims=*" %%i in ('net group /domain') do @net group "%%i" /domain >> %computername%-domaingroup-members.txt

:: net group /domain > %userdomain%-domaingroup-members.tmp
:: type %userdomain%-domaingroup-members.tmp | find /v "The command completed successfully" > %userdomain%-domaingroup-members2.tmp
:: del %userdomain%-domaingroup-members.txt
:: for /F "skip=4 delims=*" %%i in (%userdomain%-domaingroup-members2.tmp) do @net group "%%i" /domain >> %userdomain%-domaingroup-members.txt

:: del %userdomain%-domaingroup-members.tmp
:: del %userdomain%-domaingroup-members2.tmp

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net group /domain') do @net group "%i" /domain 
