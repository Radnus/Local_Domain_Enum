@echo off 

:: Domain Checks

echo Collecting Domain Users...
FOR /F "tokens=1,2,3 skip=4" %%I in ('net user /domain') do echo %%I >> %userdomain%-users.tmp & echo %%J >> %userdomain%-users.tmp & echo %%K >> %userdomain%-users.tmp
type %userdomain%-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO > %userdomain%-users.txt

del %userdomain%-users.tmp

:: Win 2-liner below
:: FOR /F "tokens=1,2,3 skip=4" %I in ('net user /domain') do echo %I >> %userdomain%-users.tmp & echo %J >> %userdomain%-users.tmp & echo %K >> %userdomain%-users.tmp
:: type %userdomain%-users.tmp | findstr /v The | findstr /v command | findstr /v completed | findstr /v ECHO && del %computername%-localusers.tmp