sfdx shane:org:delete
heroku apps:destroy -a `basename "${PWD}"` -c `basename "${PWD}"`