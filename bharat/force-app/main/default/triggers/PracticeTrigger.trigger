trigger PracticeTrigger on Account (After insert) {
    list<Contact> conList = new List<Contact>();
    for(Account acc:trigger.new){
        for(integer i=0;i<acc.Number_of_Location__c;i++){
            contact con = new contact();
                con.LastName= acc.name+i;
                 con.AccountId=acc.id;
            conList.add(con);
        }
        insert conList;
    }
    
}