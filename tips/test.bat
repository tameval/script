@set @temp=0/*
@echo off

REM カスタマイズPOPUPメッセージ
REM --------------------------------------------------------------------------------------------------------------
set _CMKILLPRO="セキュリティ対策ソフトで端末の不審な振る舞いを検知したため、IT管理者により対象プロセスが停止されました。||XXホールディングス　セキュリティ担当 03-1234-5678"
set _CMISOMACH="セキュリティ対策ソフトで端末の不審な振る舞いを検知したため、IT管理者により端末がネットワークから隔離されました。||XXホールディングス　セキュリティ担当 03-1234-5678"
set _CMQUAFILE="セキュリティ対策ソフトで端末の不審な振る舞いを検知したため、IT管理者により対象のファイルが隔離されました。||XXホールディングス　セキュリティ担当 03-1234-5678"
set _CMDELREGI="セキュリティ対策ソフトで端末の不審な振る舞いを検知したため、IT管理者により対象のレジストリ値が削除されました。||XXホールディングス　セキュリティ担当 03-1234-5678"
REM --------------------------------------------------------------------------------------------------------------

:: Continue script here
REM --------------------------------------------------------------------------------------------------------------
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Cybereason\ActiveProbe" /v "epui.res.RemediationKillProcess" /t REG_SZ /d %_CMKILLPRO% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Cybereason\ActiveProbe" /v "epui.res.RemediationIsolateMachine" /t REG_SZ /d %_CMISOMACH% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Cybereason\ActiveProbe" /v "epui.res.RemediationQuarantineFile" /t REG_SZ /d %_CMQUAFILE% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Cybereason\ActiveProbe" /v "epui.res.RemediationDeleteRegistry" /t REG_SZ /d %_CMDELREGI% /f
