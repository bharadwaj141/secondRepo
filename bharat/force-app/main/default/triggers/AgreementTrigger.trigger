trigger AgreementTrigger on Agreement__c (After update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        list<integer> dur =new List<integer>();
        Set<id> lid = new Set<id>();
        for(Agreement__c agg:trigger.old){
            lid.add(agg.Id);
            dur.add(integer.valueOf(agg.Duration__c));
        }
      
    
    List<Payment1__c> payList=[select End_Date__c,name from Payment1__c where  Agreement__c in :lid  order by End_Date__c];
    
        Date updatedDate;
        
        for(Payment1__c p:payList){
            updatedDate= p.End_Date__c;
        }
        integer j=0;
        
        List<Payment1__c> pList = new List<Payment1__c>();
        for(Agreement__c agg1:trigger.new){
            if(integer.valueOf(agg1.Duration__c)<dur[0]){
                
                integer diff = integer.valueOf(agg1.Duration__c);
              List<Payment1__c> payList1=[select id,name from Payment1__c where  Agreement__c in :lid offset: diff];
                delete payList1;
            }
               for(integer i=dur[0]+1;i<=integer.valueOf(agg1.Duration__c);i++){
                Payment1__c pay =new Payment1__c();
                   
                pay.Name= 'Payment'+i  ;
                pay.Agreement__c=agg1.Id;
                pay.Start_Date__c=updatedDate.addMonths(j);
                pay.End_Date__c=updatedDate.addMonths(j+1);
                pList.add(pay);
                   j++;
            }
        }
        insert pList;
        
    }
}