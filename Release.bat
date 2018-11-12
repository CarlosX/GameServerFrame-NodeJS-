@echo off

if not exist %cd%\Release md %cd%\Release
if not exist %cd%\Release\GateServer md %cd%\Release\GateServer
if not exist %cd%\Release\FightServer md %cd%\Release\FightServer
if not exist %cd%\Release\CenterServer md %cd%\Release\CenterServer
if not exist %cd%\Release\GateServer\SSL md %cd%\Release\GateServer\SSL
if not exist %cd%\Release\FightServer\SSL md %cd%\Release\FightServer\SSL

rem ����App
copy /y %cd%\src\app.js %cd%\Release\

rem ���������ļ�
copy /y %cd%\GateServer.bat %cd%\Release\
copy /y %cd%\CenterServer.bat %cd%\Release\
copy /y %cd%\FightServer.bat %cd%\Release\

rem ����cert
copy /y %cd%\ssl.cer %cd%\Release\GateServer\SSL\
copy /y %cd%\ssl.key %cd%\Release\GateServer\SSL\

copy /y %cd%\ssl.cer %cd%\Release\FightServer\SSL\
copy /y %cd%\ssl.key %cd%\Release\FightServer\SSL\

rem ����node_modules
xcopy /d /e /i /f /y %cd%\node_modules %cd%\Release\node_modules

rem �����������Ŀ�
xcopy /d /e /i /f /y %cd%\src\Core %cd%\Release\Core /EXCLUDE:exclude.txt

rem ����Common
xcopy /d /e /i /f /y %cd%\src\Common %cd%\Release\Common /EXCLUDE:exclude.txt

rem �������ķ���������
xcopy /d /e /i /f /y %cd%\src\CenterServer %cd%\Release\CenterServer /EXCLUDE:exclude.txt

rem ����ս��������
xcopy /d /e /i /f /y %cd%\src\FightServer %cd%\Release\FightServer /EXCLUDE:exclude.txt

rem �������ط�����
xcopy /d /e /i /f /y %cd%\src\GateServer %cd%\Release\GateServer /EXCLUDE:exclude.txt

echo =================================
echo Install succeefully!
pause