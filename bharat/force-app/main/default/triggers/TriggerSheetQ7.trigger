//"Create a trigger on Opportunity to add all the Contacts having the same Account as Opportunity.
//Account into the Opportunity ""Contact Roles""
//Example:- Account: Birla have 3 Contacts: ajay,amar,anuj 
//Then while creating an Opportunity for Birla add ajay,amar & anuj to Opportunity Contact roles--T"

trigger TriggerSheetQ7 on Opportunity (After insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        set<id> sid = new Set<id>();
        List<Id> lid = new List<Id>();
        for(Opportunity opp:Trigger.new){
            sid.add(opp.AccountId);
            lid.add(opp.Id);
        }
        List<OpportunityContactRole> opList = new List<OpportunityContactRole>();
        List<contact> conList = [select id from Contact where AccountId IN:sid];
        for(Contact con:conList){
           OpportunityContactRole opcr = new OpportunityContactRole();
            opcr.OpportunityId=lid[0];
            opcr.ContactId=con.Id;
            opList.add(opcr);
        }
        insert opList;
    }
}