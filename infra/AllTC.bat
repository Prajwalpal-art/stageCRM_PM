@echo off
cd /d %~dp0..
robot -d results testcases/
pause
