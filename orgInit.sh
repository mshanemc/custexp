sfdx force:org:create -f config/project-scratch-def.json -d 30 -s
sfdx shane:connectedapp:uniquify -a identity/main/default/connectedApps/ExternalIdentity.connectedApp-meta.xml -p solution2

sfdx shane:analytics:dataset:upload -f data/ea/deliveries.csv -m data/ea/deliveries.json -n deliveries -a SharedApp
sfdx shane:analytics:dataset:upload -f data/ea/testdrives.csv -m data/ea/testdrives.json -n testdrives -a SharedApp
sfdx shane:analytics:dataset:upload -f data/ea/csat.csv -m data/ea/csat.json -n csat -a SharedApp

sfdx shane:github:package:install -g mshanemc -r electron-theme
sfdx shane:github:package:install -g mshanemc -r electron-base
sfdx shane:github:package:install -g mshanemc -r community-boilerplate
sfdx force:user:permset:assign -n electron
sfdx force:source:push
# contentassets throw error when pushed at the same time as the community they're part of.
sfdx force:user:permset:assign -n customerExpPerms
sfdx shane:analytics:community:enable
sfdx shane:communities:activate -n dealers
sfdx shane:communities:activate -n externalid
sfdx shane:communities:publish -n dealers
sfdx shane:communities:publish -n externalid
sfdx shane:analytics:app:share -n SharedApp --allprm --allcsp -c
sfdx shane:theme:activate -n Electron
sfdx force:org:open
sfdx force:mdapi:deploy -d unpackagedMdapi/ -w 20 
sfdx force:apex:execute -f scripts/sampleWipe.cls
sfdx force:apex:execute -f scripts/roleAssign.cls
sfdx force:apex:execute -f scripts/DealerSetup.cls
sfdx force:apex:execute -f scripts/dealerPerms.cls

sfdx force:data:tree:import -p data/main/masterPlan.json 
sfdx force:data:tree:import -p data/360/360plan.json
sfdx force:data:record:create -s Account -v "Name=ExternalIDCustomers"

sfdx force:user:password:generate

# heroku connect section
sfdx shane:heroku:repo:deploy -g mshanemc -r electron-web-app -n `basename "${PWD/mshanemc-/}"` -t autodeployed-demos
# heroku access:add platformpmmdemos@gmail.com -a `basename "${PWD/mshanemc-/}"` --permissions deploy,operate,manage
heroku config:set DEALER_URL=`sfdx shane:communities:url --prefix dealers`  -a `basename "${PWD/mshanemc-/}"`
heroku config:set LOGIN_URL=`sfdx shane:communities:url --prefix externalid`/s/login  -a `basename "${PWD/mshanemc-/}"`
heroku pipelines:create `basename "${PWD/mshanemc-/}"` -a `basename "${PWD/mshanemc-/}"` -s production -t autodeployed-demos
heroku pipelines:connect `basename "${PWD/mshanemc-/}"` -r mshanemc/electron-web-app
sfdx shane:heroku:repo:deploy -g mshanemc -r electron-web-app -n `basename "${PWD/mshanemc-/}"`-stg -t autodeployed-demos
heroku pipelines:add `basename "${PWD/mshanemc-/}"` -a `basename "${PWD/mshanemc-/}"`-stg -s staging
sfdx shane:heroku:connect -a `basename "${PWD/mshanemc-/}"` -f assets/herokuConnect/electron-web.json -e custom