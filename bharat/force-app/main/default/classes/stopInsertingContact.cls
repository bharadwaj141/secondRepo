// Write a trigger to stop inserting more than two contacts in opportunity if it has 2 line items and the stage name is 
//Prospecting or Qualification. [7]

public class stopInsertingContact {
    
    public static void main(List<OpportunityLineItem> OppList){
        set<Id> sid = new Set<id>();
        for(OpportunityLineItem o:oppList){
           sid.add(o.opportunityId);
        }
    List<Opportunity> oppList1 = [select id ,name,stageName,(select id from OpportunityLineItems) from Opportunity where id IN : sid];       
        for(Opportunity opp:oppList1){
            if(opp.StageName == 'Prospecting'){
                   for(OpportunityLineItem opli:oppList){
                    if(opp.OpportunityLineItems.size()>=2){
                        opli.adderror('you cannot create opli');
                    }
                }
            }
             
            
        }
    }
}