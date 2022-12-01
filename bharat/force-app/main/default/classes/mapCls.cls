public class mapCls {
    
    public static void testMap(){
        
        map<Id,string> accIdVsaccName = new Map<Id,string>();
        
        List<Account> accList = [Select Id,Name From Account Limit 10 ];
        
        for(Account a: accList){
            
            accIdVsaccName.put(a.Id,a.Name);
            
        }
        
        system.debug('map-->'+accIdVsaccName);
        
        
        
       system.debug('returned value-->'+ accIdVsaccName.get('0015i00000BhGuQAAV'));
    
        Set <Id> accIdSet = new Set<Id>();
        accIdSet = accIdVsaccName.keySet();
        
        system.debug('account key-->'+accIdSet);
    }

}