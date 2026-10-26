@echo off
cd /d "%~dp0.."

robot -d results ^
-t "Verify Licensed Subscription Selection in Licensed Tenant Creation" ^
-t "Verify Free Trial Deselection When Licensed Subscription is Selected" ^
-t "Verify Valid User Credits Entry in Licensed Tenant Creation" ^
-t "Verify User Credits Field Is Mandatory" ^
-t "Verify Decimal Values Are Not Accepted In User Credits" ^
-t "Verify Negative Values Are Restricted In User Credits" ^
-t "Verify Zero Credits Cannot Be Entered" ^
-t "Verify Valid Subscription Duration Can Be Entered" ^
-t "Verify Subscription Duration Is Mandatory" ^
-t "Verify Zero Subscription Duration Is Not Accepted" ^
testcases/Tenant-management2.robot

pause