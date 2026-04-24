@echo off
cd /d %~dp0..
robot -d results -t "Complete Tenant Admin Form With Conduct Check And Document Upload" testcases/tenantmanagement.robot
pause
