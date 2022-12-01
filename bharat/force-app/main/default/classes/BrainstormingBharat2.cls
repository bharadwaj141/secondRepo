//Create a field highest price, lowest price both of currency type on opportunity.
//Write a script to find the highest and lowest price from the Opportunity line item and fill their respective fields.

public class BrainstormingBharat2 {
    public static void main(){
        
        List<Opportunity> oppList = [select id,highest_price__c,lowest_price__c from Opportunity];
        
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
  
           }
}