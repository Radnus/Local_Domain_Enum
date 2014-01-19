@echo off 

:: Local Checks

echo Collecting Localgroup Members...
del %computername%-localgroup-members.txt
for /F "skip=4 delims=*" %%i in ('net localgroup') do @net localgroup "%%i" >> %computername%-localgroup-members.txt

:: Win 1-liner below
:: for /F "skip=4 delims=*" %i in ('net localgroup') do @net localgroup "%i" 
