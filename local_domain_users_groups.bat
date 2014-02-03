@echo off 

:: ~~~Local Checks~~~

echo Collecting Local Users...
FOR /F "tokens=1,2,3 skip=4" %%I in ('net user') do echo %%I >> %computername%-localusers.tmp & echo %%J >> %computername%-localusers.tmp & echo %%K >> %computername%-localusers.tmp
type %computername%-localusers.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %computername%-localusers.txt

del %computername%-localusers.tmp

:: Win 1'ish'-liner below
:: FOR /F "tokens=1,2,3 skip=4" %I in ('net user') do echo %I >> %computername%-localusers.tmp & echo %J >> %computername%-localusers.tmp & echo %K >> %computername%-localusers.tmp && type %computername%-localusers.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO >> %computername%-localusers.txt
:: type %computername%-localusers.txt
:: del %computername%-localusers.tmp

echo Collecting Localgroup Members...
del %computername%-localgroup-members.txt
for /F "skip=4 delims=*" %%i in ('net localgroup') do @net localgroup "%%i" >> %computername%-localgroup-members.txt

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net localgroup') do @net localgroup "%i" 

:: ~~~Domain Checks~~~

echo Collecting Domain Users...
FOR /F "tokens=1,2,3 skip=4" %%I in ('net user /domain') do echo %%I >> %userdomain%-domain-users.tmp & echo %%J >> %userdomain%-domain-users.tmp & echo %%K >> %userdomain%-domain-users.tmp
type %userdomain%-domain-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %userdomain%-domain-users.txt

del %userdomain%-domain-users.tmp

:: Win 2-liner below
:: FOR /F "tokens=1,2,3 skip=4" %I in ('net user /domain') do echo %I >> %userdomain%-users.tmp & echo %J >> %userdomain%-users.tmp & echo %K >> %userdomain%-users.tmp
:: type %userdomain%-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO && del %computername%-localusers.tmp

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
