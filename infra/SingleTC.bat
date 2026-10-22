@echo off
cd /d "%~dp0.."
robot -d results -t "Verify Admin Able To Create Manual Tenant" testcases/Tenant-management2.robot
pause
