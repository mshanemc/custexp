sfdx shane:org:delete
heroku apps:destroy -a `basename "${PWD/mshanemc-/}"` -c `basename "${PWD/mshanemc-/}"`
heroku apps:destroy -a `basename "${PWD/mshanemc-/}"`-stg -c `basename "${PWD/mshanemc-/}"`-stg