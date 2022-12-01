//Create Batch to update the Account "Count" field(Create this field) with all the contacts related to that Account.

public class BatchSheet6 implements database.Batchable<Sobject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select id,name,(select id from Contacts) from Account');
                                        
  }
     public void execute(database.BatchableContext bc,List<Account> accList){
         for(Account acc:accList){
             acc.Number_of_Contact__c=acc.contacts.size();
         }
        update accList;
         
   }
    public void finish(database.BatchableContext bc){
        
    }
}