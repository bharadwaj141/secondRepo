//Create Custom Field on Opportunity-> countContactRole (Number)
//Write a Trigger when insert contactRole then count contactRole and update countContactRole field.
// condition:   have minimum 3 opportunityLineItems and opportunity is closed Won

public class CaseCreate {
    public static void main(List<OpportunityContactRole> ocrList){
        System.debug('ocrList :: '+ocrList);
        set<id> sid = new Set<id>();
        
        for(OpportunityContactRole ocr:ocrList){
            sid.add(ocr.OpportunityId);
        }
        System.debug('sid :: '+sid);
        List<opportunity> oppList = [select id,countContactRole__c,stageName,(select id from OpportunityContactRoles) 
                                     from opportunity where  stageName='closed won' And  id =:sid ];
        for(opportunity opp:oppList){
            System.debug('before update :: '+opp);
        }
        for(opportunity opp:oppList){
            for(OpportunityContactRole ocr:opp.OpportunityContactRoles){
                if(opp.OpportunityContactRoles.size()>2){
                    System.debug('opp.OpportunityContactRoles.size() :: '+opp.OpportunityContactRoles.size());
                    opp.countContactRole__c = opp.OpportunityContactRoles.size();
              }
            }
        }
        for(opportunity opp:oppList){
            System.debug('after update :: '+opp);
        }
        update oppList;
    }
}