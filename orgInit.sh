sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:github:package:install -g mshanemc -r electron-theme
sfdx shane:github:package:install -g mshanemc -r electron-base
sfdx force:user:permset:assign -n electron
sfdx force:source:push
sfdx shane:org:reauth -r --json
sfdx shane:theme:activate -n Electron
sfdx force:org:open