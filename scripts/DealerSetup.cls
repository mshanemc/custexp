Account acc = new Account(
    name = 'Electron of Houston'
);
insert acc;
string texEmail = 'tex@electronofhouston.com';

contact con = new Contact(
    firstName = 'Tex',
    lastname = 'Hatley',
    accountId = acc.Id,
    email = 'tex' + System.now().millisecond() + '@electronofhouston.com';
);

insert con ; 