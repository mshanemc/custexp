Account acc = new Account(
    name = 'Electron of Houston'
);
insert acc;
string texEmail = 'tex@electronofhouston.com';

acc = [select id, isPartner from account where id=:acc.Id];
acc.isPartner = true;
update acc;

contact con = new Contact();
con.firstName = 'Tex';
con.Title = 'New Car Sales Representative';
con.Phone = '8324728022';
con.MobilePhone = '8324728023';
con.Department = 'New Car Sales';
con.lastname = 'Hatley';
con.accountId = acc.Id;
con.email = 'tex' + Datetime.now().format('yyyyMMddHHmmss') + '@electronofhouston.com';

insert con; 

Id partnerProfileId = [select id from profile where name='Partner Community User'].id;

// create the user
User user = new User(alias = 'test123', email=con.email,
                emailencodingkey='UTF-8', lastname=con.lastname, firstname=con.firstname, languagelocalekey='en_US',
                localesidkey='en_US', profileid = partnerProfileId, country='United States',IsActive =true,
                ContactId = con.Id,
                timezonesidkey='America/Los_Angeles', username=con.email);       
insert user;

/*

delete [select id from Account where name = 'Electron of Houston'];
delete [select id from Contact where lastname = 'Hatley'];

*/