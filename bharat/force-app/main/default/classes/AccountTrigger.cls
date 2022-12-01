public class AccountTrigger {
    public static void main(List<Account> accList){
        for(Account acc:accList){
            if(acc.industry!=null && acc.industry=='media'){
                acc.rating='hot';               
            }
        }
    }
    public static void main2(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc:accList){
            Opportunity opp = new Opportunity();
            opp.Name=acc.Name;
            opp.StageName='closed won';
            opp.AccountId=acc.Id;
            opp.CloseDate=system.today();
            opp.Amount=29638;
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
          insert oppList;  
        }
        
    }
}