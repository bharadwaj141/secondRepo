trigger RemainingAccountTrigger on Opportunity (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        List<id>accId = new List<id>();
    for(Opportunity opp:trigger.new){
        if(opp.StageName=='closed won' && opp.Amount!=null && opp.AccountId!=null){
            accId.add(opp.AccountId);
        }
    }
    List<Account> accList = [select id,Total_Amount__c,Remaining_Amount__c from Account where id IN:accId];
    
    for(Account acc:accList){
        for(Opportunity opp:trigger.new){
            acc.Remaining_Amount__c= acc.Total_Amount__c-opp.Amount;
        }
    }
    update accList;
    
    }
   
    
}