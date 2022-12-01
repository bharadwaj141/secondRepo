public class newTest {
    public static void getAccount(){
        List<Account> accList = [select id,Name,Phone,(select id,Name,stageName from Opportunities where stageName='Closed Won') 
                                 from Account];
        
        for(Account acc:accList){
            for(Opportunity opp:acc.Opportunities){
                if(acc.Opportunities.size()>=2){
                    system.debug(acc.Name);
                }
            }
        }
    }
}