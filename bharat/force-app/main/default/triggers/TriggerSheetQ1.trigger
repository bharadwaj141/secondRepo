//On Account to create a 'Default' (number of contacts= numbers of employee) contact every time an account is created

trigger TriggerSheetQ1 on Account (After insert) {
    for(Account a:Trigger.new){
        Contact con = new Contact();
        con.lastName= 'surya';
        con.AccountId=a.id;
        insert con;
    }
                }