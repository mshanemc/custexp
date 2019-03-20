userrole ceo = [select id from userrole where DeveloperName = 'CEO'];
user u = [select id, userroleid from user where id =: UserInfo.getUserId()];
u.userroleid = ceo.id;
update u;