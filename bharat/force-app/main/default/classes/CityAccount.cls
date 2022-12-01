//  In Account Object create a Multi picklist ""Working in (ASIA, EMA, NA, SA)"" Multi picklist.
//          Write a script to get the total Quantity of Products sold in only Accounts working in ASIA."

public class CityAccount {
    public static void main(){
        
   List<Account> accList =[select id,name,working_in__c from Account Where working_in__c = 'Asia'];   
   List<OpportunityLineItem> oppLineItemList=[select id,Quantity,OpportunityId from OpportunityLineItem where Opportunity.AccountId IN : accList];
        Map<Id,Decimal> totalAmountRelatedToAcc = new Map<Id,Decimal>();
        for(OpportunityLineItem oppLineItemObj : oppLineItemList){
            if(totalAmountRelatedToAcc.containsKey(oppLineItemObj.Opportunity.AccountId)){
                
                Id accountId = oppLineItemObj.Opportunity.AccountId;
                Decimal lineItemPreQuantity = totalAmountRelatedToAcc.get(accountId);
                Decimal lineItemQuantity = oppLineItemObj.Quantity;
                Decimal totalLineItemQuantity = lineItemPreQuantity + lineItemQuantity;
                totalAmountRelatedToAcc.put(accountId,totalLineItemQuantity);
            }else{
                Id accountId = oppLineItemObj.Opportunity.AccountId;
                Decimal lineItemQuantity = oppLineItemObj.Quantity;         
                totalAmountRelatedToAcc.put(accountId,lineItemQuantity);
            }
        }
    }
}