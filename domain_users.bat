@echo off 

:: Domain Checks

echo Collecting Domain Users...
FOR /F "tokens=1,2,3 skip=6" %%I in ('net user /domain') do echo %%I >> %userdomain%-domain-users.tmp & echo %%J >> %userdomain%-domain-users.tmp & echo %%K >> %userdomain%-domain-users.tmp
type %userdomain%-domain-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %userdomain%-domain-users.txt

del %userdomain%-domain-users.tmp

:: Win 2-liner below
:: FOR /F "tokens=1,2,3 skip=6" %I in ('net user /domain') do echo %I >> %userdomain%-domain-users.tmp & echo %J >> %userdomain%-domain-users.tmp & echo %K >> %userdomain%-domain-users.tmp
:: type %userdomain%-domain-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO >> %userdomain%-domain-users.txt
:: type %userdomain%-domain-users.txt
:: del %computername%-domain-users.tmp

echo Collecting Domain Users Details...
FOR /F "tokens=1" %%I in (%userdomain%-domain-users.txt) do net user /domain %%I >> %userdomain%-domain-users-details.txt

:: Win 1-liner below
:: FOR /F "tokens=1" %I in (%userdomain%-domain-users.txt) do net user /domain %I >> %userdomain%-domain-users-details.txt
