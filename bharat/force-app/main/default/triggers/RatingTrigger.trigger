trigger RatingTrigger on Maintenance__c (After insert) {
   integer rat;
    integer count=0;
    set<id> sid = new Set<id>();
        for(Maintenance__c main:Trigger.new){
            sid.add(main.Contact__c);
            rat=integer.valueOf(main.Rating__c);
    }
    for(Maintenance__c mt:[select id from Maintenance__c where Contact__C In:sid]){
        count++;
    }
         List<Contact> conList = [select average_rating__C from contact where id IN:sid];
            for(Contact con:conList){
               if(con.Average_rating__c==null){
                   con.Average_rating__c=0;
        }
        con.average_rating__C= (con.average_rating__C+rat)/count;
       update conlist; 
    }
}