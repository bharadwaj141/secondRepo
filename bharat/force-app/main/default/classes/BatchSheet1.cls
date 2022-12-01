//Write a Batch class to delete accounts created in 10 days before.

public class BatchSheet1 implements Database.Batchable<Sobject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
      
   
        return Database.getQueryLocator([select id,name,createddate from Account where createddate=Last_N_Days:17]); 
        
        
    }
    public void Execute(Database.BatchableContext bc,List<Account> accList){
    
        if(accList.size()>0){
              database.delete (accList,false);
        }
      
        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}