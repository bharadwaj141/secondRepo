trigger test on Contact (After insert) {
    if(trigger.isInsert && trigger.isAfter){
        List<id> sid = new List<id>();
        for(Contact con:Trigger.new){
            sid.add(con.id);
        }
        
        List<Passenger__c> pList =[select id,Contact__c from Passenger__c];
        for(Contact con:Trigger.new){
            for(Passenger__c p:pList){
                p.contact__c = sid[0];
            }
        }
    }
}