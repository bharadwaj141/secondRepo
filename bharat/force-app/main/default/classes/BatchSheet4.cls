//Create Batch class to create 5 new Opportunities daily.

public class BatchSheet4 implements Database.Batchable<Sobject> {
    
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select id,name from Account limit 5');
    }
    
    public void execute(database.BatchableContext bc,List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc:accList){
            for(integer i=0;i<5;i++){
              Opportunity opp = new Opportunity();
                opp.Name='Raja ji';
                opp.AccountId=acc.id;
                opp.CloseDate=system.today();
                opp.StageName='Prospecting';
                oppList.add(opp);
            }
        }
        insert oppList;
    }
    
    public void finish(database.BatchableContext bc){
        
        
    }

}