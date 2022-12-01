public class contactComponentAuraSheet2 {
 
    /*   @AuraEnabled
    public static List<contact> getContact(){
        List<contact> con=[select id,LastName,Email,Phone from Contact where Phone!=null limit 50];
        return con;
    }                     */
    
//-----------------------------------------------    
    @AuraEnabled 
    public static List<Account> getAccount(){
        List<Account> accList = [select id,name from Account];
        return accList;
    }
    
    @AuraEnabled
    public static List<Contact> getContact(String accId){
        List<Contact> conList = [select id,LastName from Contact where AccountId =:accId];
        return conList;
    }
      @AuraEnabled
    public static List<Opportunity> getOpportunity(String accId){
        List<Opportunity> oppList = [select id,Name from Opportunity where AccountId =:accId];
        return oppList;
    }        
//-----------------------------     
/*     @AuraEnabled
     public static void getOpportunity(String oppId,date close){
         Opportunity opp = new Opportunity();
         opp.Id=oppId;
         opp.CloseDate=close;
         update opp;
     }
                  */
    
}