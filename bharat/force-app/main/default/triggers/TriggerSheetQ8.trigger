//On campaign to close all the opportunities associated with the campaign when campaign status is completed. 
//Example:Opportunities having line items in it must be closed won and opportunities having no line item must be closed lost. 
//Send all the details of All associated opportunities.

trigger TriggerSheetQ8 on Campaign (After update) {
set<id> cid= new set<id>();
    set<id> oid= new set<id>();
    
    for(Campaign cm:trigger.new){       
        cid.add(cm.id);        
    }
    
    List<Opportunity> oppList= [select id,stagename,Campaign.status,(select id from OpportunityLineItems) 
                           from Opportunity where CampaignId in:cid];
    
    for(Opportunity o:oppList){
            integer count= 0;
        for(OpportunityLineItem oli:o.OpportunityLineItems){
            count++;
        }
             if(o.campaign.status=='Completed'){
            if(count>0){
                o.stagename='Closed won';
            }   
            if(count==0){
                o.stagename='Closed Lost';
            }                    
        }
    }
    update oppList; 

}