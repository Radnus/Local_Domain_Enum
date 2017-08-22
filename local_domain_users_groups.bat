@echo off

:: ~~~Local Checks~~~

echo Collecting Local Users...
FOR /F "tokens=1,2,3 skip=4" %%I in ('net user') do echo %%I >> %computername%-localusers.tmp & echo %%J >> %computername%-localusers.tmp & echo %%K >> %computername%-localusers.tmp
type %computername%-localusers.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %computername%-localusers.txt

del %computername%-localusers.tmp

:: Win !1'ish'-liner below
:: FOR /F "tokens=1,2,3 skip=4" %I in ('net user') do echo %I >> %computername%-localusers.tmp & echo %J >> %computername%-localusers.tmp & echo %K >> %computername%-localusers.tmp
:: type %computername%-localusers.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO >> %computername%-localusers.txt
:: type %computername%-localusers.txt
:: del %computername%-localusers.tmp

echo Collecting Local Users Details...
FOR /F "tokens=1" %%I in (%computername%-localusers.txt) do net user %%I >> %computername%-localusers-details.txt

:: Win 1-liner below
:: FOR /F "tokens=1" %I in (%computername%-localusers.txt) do net user %I >> %computername%-localusers-details.txt

echo Collecting Localgroup Members...
del %computername%-localgroup-members.txt
for /F "skip=4 delims=*" %%i in ('net localgroup') do @net localgroup "%%i" >> %computername%-localgroup-members.txt

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net localgroup') do @net localgroup "%i" >> %computername%-localgroup-members.txt

:: ~~~Domain Checks~~~

echo Collecting Domain Users...
FOR /F "tokens=1,2,3 skip=6" %%I in ('net user /domain') do echo %%I >> %userdomain%-domain-users.tmp & echo %%J >> %userdomain%-domain-users.tmp & echo %%K >> %userdomain%-domain-users.tmp
type %userdomain%-domain-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %userdomain%-domain-users.txt

del %userdomain%-domain-users.tmp

:: Win 2-liner below
:: FOR /F "tokens=1,2,3 skip=6" %I in ('net user /domain') do echo %I >> %userdomain%-domain-users.tmp & echo %J >> %userdomain%-domain-users.tmp & echo %K >> %userdomain%-domain-users.tmp
:: type %userdomain%-domain-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO >> %userdomain%-domain-users.txt
:: type %userdomain%-domain-users.txt
:: del %userdomain%-domain-users.tmp

echo Collecting Domain Users Details...
FOR /F "tokens=1" %%I in (%userdomain%-domain-users.txt) do net user /domain %%I >> %userdomain%-domain-users-details.txt

:: Win 1-liner below
:: FOR /F "tokens=1" %I in (%userdomain%-domain-users.txt) do net user /domain %I >> %userdomain%-domain-users-details.txt

echo Collecting Domaingroup Members...
del %userdomain%-domaingroup-members.txt
for /F "skip=4 delims=*" %%i in ('net group /domain') do @net group "%%i" /domain >> %computername%-domaingroup-members.txt

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net group /domain') do @net group "%i" /domain >> %userdomain%-domaingroup-members.txt
