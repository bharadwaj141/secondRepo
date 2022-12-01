public with sharing class lWCSheet1 {
    @auraEnabled(cacheable=true)
    public static List<Account> getAccount() {
       List<Account>accList = [select id,Name from Account limit 30];
       return accList;
    }
     
    @AuraEnabled
    public static List<Contact> getContact(string accId){
      
        List<Contact>conList = [select id,lastname,AccountId from Contact where AccountId =:accId limit 30];
            return conList;
             
        
    }
    @AuraEnabled
    public static List<Opportunity> getOpportunity(string accId){
        
        List<Opportunity>oppList = [select id,name,AccountId from Opportunity where AccountId =:accId limit 30];
            return oppList;
        
    }
   
}