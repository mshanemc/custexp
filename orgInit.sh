sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:github:package:install -g mshanemc -r electron-theme
sfdx shane:github:package:install -g mshanemc -r electron-base
sfdx shane:github:package:install -g mshanemc -r community-boilerplate
sfdx force:user:permset:assign -n electron
sfdx force:source:push
sfdx force:user:permset:assign -n customerExpPerms
sfdx shane:org:reauth -r --json
sfdx shane:theme:activate -n Electron
sfdx force:org:open
sfdx force:apex:execute -f scripts/sampleWipe.cls
sfdx force:apex:execute -f scripts/roleAssign.cls
sfdx force:apex:execute -f scripts/DealerSetup.cls
sfdx force:apex:execute -f scripts/DealerPerms.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:apex:execute -f scripts/accountGen.cls
sfdx force:user:password:generate

sfdx shane:heroku:repo:deploy -g mshanemc -r electron-web-app -n `basename "${PWD}"` -t autodeployed-demos
heroku access:add platformpmmdemos@gmail.com -a `basename "${PWD}"` --permissions deploy,operate,manage
