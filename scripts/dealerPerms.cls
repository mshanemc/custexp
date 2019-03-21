// assign the usr a permset

// this is in a separate class to get around the mixed dml issue
list<permissionSet> PSs = [select id, name from permissionset where name = 'dealerPerms'];
list<user> users = [select id from user where name = 'Tex Hatley'];

PermissionSetAssignment psa = new PermissionSetAssignment
(PermissionSetId = PSs[0].Id, assigneeId = users[0].Id );
insert psa;      