//WAP to create 5 Case Records with all the values(Account, Contact, etc) filled in.

public class CreateCase {
    public static void main(){
     
          List<Account> accList = [Select id from Account limit 5];
        List<Contact> conList = [Select id from Contact limit 5];
        List<Case> caseList = new List<Case>();
        for(integer i=0;i<5;i++){
            Case c = new Case();
            c.Status='working';
            c.Origin='phone';
            c.AccountId=accList[i].id;
            c.ContactId=conList[i].id;
            c.Priority='high';
            caseList.add(c);
            
        }
        insert caseList;
        system.debug(caseList);  
    
//----------------------------------------------------------------------------------------------------
//Create a field highest price, lowest price both of currency type on opportunity.
// Write a script to find the highest and lowest price from the Opportunity line item and fill their respective fields.

   /*      List<Opportunity> oppList = [select id,highest_price__c,lowest_price__c from Opportunity];
        
        List<AggregateResult> Agg = [select opportunityid,max(unitPrice)a,min(unitPrice)b from OpportunityLineItem 
                                     group by opportunityid];
        For(AggregateResult ag:Agg){
            for(Opportunity opp:oppList){
                if(ag.get('opportunityid')==opp.id){
                     opp.highest_price__c=integer.valueOf(ag.get('a'));
                opp.lowest_price__c=integer.valueOf(ag.get('b'));
         
                }      
            }
        }
        update oppList;
                                  */
                  
    }
}