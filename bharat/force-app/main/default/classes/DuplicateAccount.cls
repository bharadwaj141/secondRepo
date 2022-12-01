// Create a custom field called duplicate(checkbox) in Account. Write a script to check if the contact in the Account
//  and contact roles in its related opportunity are same then set the checkbox to true.

public class DuplicateAccount {
    public static void main(){
        
        List<contact> conList  = [select id,name,AccountId,Account.Duplicate__c from Contact];
        set<id> sid = new set<id>();
        List<opportunityContactRole> oppList = [select Id,OpportunityId,opportunity.AccountId,ContactId from opportunityContactRole];
        for(contact con:conList){
            for(opportunityContactRole ocr:oppList){
                if(con.AccountId==ocr.opportunity.AccountId  && con.id==ocr.ContactId){
                    sid.add(con.AccountId);
                }else {
                    sid.remove(con.AccountId);
                }
            }
        }
        List<Account> accList = [select id,Duplicate__c from Account where id =:sid];
        for(Account acc:accList){
            acc.duplicate__c=true;
        }
        
        
        update accList;
        
        
        /*     for(Contact con : conList){
if(AccVsCon2.containsKey(con.AccountId)){
AccVsCon2.get(con.AccountId).add(con);   
}else{
AccVsCon2.put(con.AccountId,new List<Contact>());  
}
}
System.debug('map 2 :: '+AccVsCon2);          */
    }

}