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

list<Test_Drive__c> TDs = new list<Test_Drive__c>();
Test_Drive__c td = new Test_Drive__c();
td.Email__c = 'jliu@example.com';
td.First_Name__c = 'Jess';
td.Last_Name__c = 'Liu';
td.Location__c = '13165 Indigo Spires, Cypress TX 77429';
td.Model__c = 'Flare';
td.Phone__c = '5555783214';

Test_Drive__c td2 = new Test_Drive__c();
td2.Email__c = 'sarahbu@example.com';
td2.First_Name__c = 'Sarah';
td2.Last_Name__c = 'Brown';
td2.Location__c = 'dealer';
td2.Model__c = 'Flash';
td2.Phone__c = '5555783211';

tds.add(td);
tds.add(td2);

insert tds;


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