//Write a Trigger to stop add more than 2 Opportunity line Items records in an Opportunity.

trigger TriggerSheetQ10 on OpportunityLineItem (before insert) {
            set<id> opli= new set<id>();

 for(OpportunityLineItem opp:trigger.new){
     
        opli.add(opp.OpportunityId);
    }
        List<Opportunity> oplist=[select id,(Select id from OpportunityLineItems) from opportunity where Id in:opli];
    for(Opportunity OLI:oplist){
       for(OpportunityLineItem opp1:trigger.new){ 
            if(OLI.OpportunityLineItems.size()>=2){
                 opp1.adderror('Can not create more than 2 OLI');
     }
    }
  }  
}