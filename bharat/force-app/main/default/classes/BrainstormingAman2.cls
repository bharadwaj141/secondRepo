//Create a custom field on opportunity named(total order) and
//update the total order filled with the total no of order related to the opportunity.

public class BrainstormingAman2 {
    public static void main(){
       List<opportunity> oppList = [Select id,name,total_order__C,(select id from Orders) from opportunity ];
        for(Opportunity opp:oppList){
            for(Order o:opp.orders){
                 opp.total_order__C=opp.orders.size();
             system.debug(opp.Name);
            }          
        }
        update oppList;       
    }
}