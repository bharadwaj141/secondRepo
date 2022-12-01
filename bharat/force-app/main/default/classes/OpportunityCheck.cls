//Create custom fields
// - Matching record(checkbox) on opportunity
 //- Record(Text) on opportunityLineItem
// write a trigger on opportunity to checked the matching record field when opportunity name is matched in Record field.

public class OpportunityCheck {
    public static void main(List<OpportunityLineItem> newList){
       
        set<id> sid = new Set<id>();
        for(OpportunityLineItem ocr:newList){
            sid.add(ocr.OpportunityId);
        }
        List<opportunity> oppList = [select id,Matching_Record__c,name,(select id,Opportunity_Record__c from OpportunityLineItems
                                     where Opportunity_Record__c!=null) 
                                     from Opportunity where id In:sid];
       
       system.debug('Before Update--->'+oppList);
        for(Opportunity opp:oppList){
            if(opp.OpportunityLineItems.size()>0){
                for(OpportunityLineItem opli:opp.OpportunityLineItems){
                    if(opli.Opportunity_Record__c==opp.Name){
                       opp.Matching_Record__c = true;
                      
                    }
                }
            }
        }
        system.debug('After Update----->'+oppList);
        update oppList;
    }
}