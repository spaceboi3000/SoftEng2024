echo Executing: se2407 logout
se2407 logout
read -p "Press any key to continue..."

echo Executing: se2407 login --username admin --passw admin
se2407 login --username admin --passw admin
read -p "Press any key to continue..."

echo Executing: se2407 healthcheck
se2407 healthcheck
read -p "Press any key to continue..."

echo Executing: se2407 resetpasses
se2407 resetpasses
read -p "Press any key to continue..."

echo Executing: se2407 healthcheck
se2407 healthcheck
read -p "Press any key to continue..."

echo Executing: se2407 resetstations
se2407 resetstations
read -p "Press any key to continue..."

echo Executing: se2407 healthcheck
se2407 healthcheck
read -p "Press any key to continue..."

echo Executing: se2407 admin --addpasses --source passes07.csv
se2407 admin --addpasses --source passes07.csv
read -p "Press any key to continue..."

echo Executing: se2407 healthcheck
se2407 healthcheck
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station AM08 --from 20220210 --to 20220224 --format json
se2407 tollstationpasses --station AM08 --from 20220210 --to 20220224 --format json
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station NAO04 --from 20220210 --to 20220224 --format csv
se2407 tollstationpasses --station NAO04 --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station NO01 --from 20220210 --to 20220224 --format csv
se2407 tollstationpasses --station NO01 --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format csv
se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station XXX --from 20220210 --to 20220224 --format csv
se2407 tollstationpasses --station XXX --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format YYY
se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format YYY
read -p "Press any key to continue..."

echo Executing: se2407 errorparam --station OO03 --from 20220210 --to 20220224 --format csv
se2407 errorparam --station OO03 --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station AM08 --from 20220211 --to 20220222 --format json
se2407 tollstationpasses --station AM08 --from 20220211 --to 20220222 --format json
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station NAO04 --from 20220211 --to 20220222 --format csv
se2407 tollstationpasses --station NAO04 --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station NO01 --from 20220211 --to 20220222 --format csv
se2407 tollstationpasses --station NO01 --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format csv
se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station XXX --from 20220211 --to 20220222 --format csv
se2407 tollstationpasses --station XXX --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format YYY
se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format YYY
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop AM --tagop NAO --from 20220210 --to 20220224 --format json
se2407 passanalysis --stationop AM --tagop NAO --from 20220210 --to 20220224 --format json
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop NAO --tagop AM --from 20220210 --to 20220224 --format csv
se2407 passanalysis --stationop NAO --tagop AM --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop NO --tagop OO --from 20220210 --to 20220224 --format csv
se2407 passanalysis --stationop NO --tagop OO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop OO --tagop KO --from 20220210 --to 20220224 --format csv
se2407 passanalysis --stationop OO --tagop KO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop XXX --tagop KO --from 20220210 --to 20220224 --format csv
se2407 passanalysis --stationop XXX --tagop KO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop AM --tagop NAO --from 20220211 --to 20220222 --format json
se2407 passanalysis --stationop AM --tagop NAO --from 20220211 --to 20220222 --format json
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop NAO --tagop AM --from 20220211 --to 20220222 --format csv
se2407 passanalysis --stationop NAO --tagop AM --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop NO --tagop OO --from 20220211 --to 20220222 --format csv
se2407 passanalysis --stationop NO --tagop OO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop OO --tagop KO --from 20220211 --to 20220222 --format csv
se2407 passanalysis --stationop OO --tagop KO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passanalysis --stationop XXX --tagop KO --from 20220211 --to 20220222 --format csv
se2407 passanalysis --stationop XXX --tagop KO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop AM --tagop NAO --from 20220210 --to 20220224 --format json
se2407 passescost --stationop AM --tagop NAO --from 20220210 --to 20220224 --format json
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop NAO --tagop AM --from 20220210 --to 20220224 --format csv
se2407 passescost --stationop NAO --tagop AM --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop NO --tagop OO --from 20220210 --to 20220224 --format csv
se2407 passescost --stationop NO --tagop OO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop OO --tagop KO --from 20220210 --to 20220224 --format csv
se2407 passescost --stationop OO --tagop KO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop XXX --tagop KO --from 20220210 --to 20220224 --format csv
se2407 passescost --stationop XXX --tagop KO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop AM --tagop NAO --from 20220211 --to 20220222 --format json
se2407 passescost --stationop AM --tagop NAO --from 20220211 --to 20220222 --format json
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop NAO --tagop AM --from 20220211 --to 20220222 --format csv
se2407 passescost --stationop NAO --tagop AM --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop NO --tagop OO --from 20220211 --to 20220222 --format csv
se2407 passescost --stationop NO --tagop OO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop OO --tagop KO --from 20220211 --to 20220222 --format csv
se2407 passescost --stationop OO --tagop KO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 passescost --stationop XXX --tagop KO --from 20220211 --to 20220222 --format csv
se2407 passescost --stationop XXX --tagop KO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid NAO --from 20220210 --to 20220224 --format json
se2407 chargesby --opid NAO --from 20220210 --to 20220224 --format json
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid GE --from 20220210 --to 20220224 --format csv
se2407 chargesby --opid GE --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid OO --from 20220210 --to 20220224 --format csv
se2407 chargesby --opid OO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid KO --from 20220210 --to 20220224 --format csv
se2407 chargesby --opid KO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid NO --from 20220210 --to 20220224 --format csv
se2407 chargesby --opid NO --from 20220210 --to 20220224 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid NAO --from 20220211 --to 20220222 --format json
se2407 chargesby --opid NAO --from 20220211 --to 20220222 --format json
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid GE --from 20220211 --to 20220222 --format csv
se2407 chargesby --opid GE --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid OO --from 20220211 --to 20220222 --format csv
se2407 chargesby --opid OO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid KO --from 20220211 --to 20220222 --format csv
se2407 chargesby --opid KO --from 20220211 --to 20220222 --format csv
read -p "Press any key to continue..."

echo Executing: se2407 chargesby --opid NO --from 20220211 --to 20220222 --format csv
se2407 chargesby --opid NO --from 20220211 --to 20220222 --format csv

se2407 logout