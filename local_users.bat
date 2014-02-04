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
