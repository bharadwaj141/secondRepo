//    Get Total Amount of only those Opportunity whose Opportunity's close date falls in next 30 days
 //                    and OpportunityLineItem quantity is more than 50.


public class GetOpportunity {
    public static void main(){
        List<Opportunity> opplist = [select id ,name,Amount,CloseDate,(select id,quantity from OpportunityLineItems where quantity>50)from opportunity where CloseDate>:date.today() And CloseDate<:date.today()+30];
        for(Opportunity opp:oppList){
            system.debug(opp.Name +'----'+ opp.Amount);
        }
        
    }
}