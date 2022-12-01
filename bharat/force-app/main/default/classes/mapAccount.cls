public class mapAccount {
        public static void getAccount(){
            /*       Map<Id,Integer> accMap = new Map<Id,Integer>();
    List<Contact> conList =[select id,Account.Name,AccountId from Contact WHERE accountId != null];
    for(Contact con:conList){
    if(!accMap.containsKey(con.AccountId)){
    accMap.put(con.AccountId,1);
    }
    else{
    integer sum = accMap.get(con.AccountId);
    sum = sum+1;
    accMap.put(con.AccountId,sum); 
    }
    }
    
    for(ID key: accMap.keySet()){
    System.debug(key+ '  ==> '+accMap.get(key));
    
    }
    */
            
            /*      Map<Id,List<Contact>> accVscon = new Map<Id,List<Contact>>();
    List<Contact> conList = [select id,Name,AccountId from Contact where AccountId!=null ];
    for(Contact con:conList){
    if(!accVscon.containsKey(con.AccountId)){
    accVscon.put(con.AccountId,new List<contact>{con});
    }
    else{
    accVscon.get(con.AccountId).add(con);
    }
    }
    System.debug('mapAccAndCons => '+accVscon);
    */
            
            /*     Map<Id, List<contact>> conMap = new Map<Id, List<contact>>();
    
    for(Contact conobj :[SELECT Id, Name, LastName, accountId from contact Where accountId != null]){
       if(conMap.containsKey(conObj.accountId)){
         conMap.get(conobj.accountId).add(conobj);  
    }
    else{
    conMap.put(conobj.accountId, new List<contact>{conobj} ) ;
    } 
    }
    
    for(Id objId :conMap.keySet()){
    System.debug(objId +' --> '+conMap.get(objId).size());
    for(contact con : conMap.get(objId)){
    System.debug(' Name --> '+con.LastName);
    }
    }
    */
            
            /*     List<opportunity> oppList=[select id,Name,AccountId from Opportunity where AccountId!=null];
    Map<id,List<Opportunity>> accVsOpp = new Map<id,List<Opportunity>>();
    
    for(Opportunity opp:oppList){
    if(!accVsOpp.containsKey(opp.AccountId)){
    accVsOpp.put(opp.AccountId,new List<Opportunity>{opp});
    }
    else{
    accVsOpp.get(opp.AccountId).add(opp);
    }
    }
    for(Id oppId:accVsOpp.keyset()){
    system.debug(oppId+'--->'+accVsOpp.get(oppId).size());
    for(opportunity opp:accVsOpp.get(oppId)){
    system.debug('Opportunity name--->'+opp.Name);
    }
    }
    */
            
            
              
             Map<Id,Integer> accMap = new Map<Id,Integer>();
           
            List<Opportunity> oppList = [select Id,AccountId,(select Id from OpportunityLineItems) from Opportunity];
            
            for(Opportunity opp:oppList){
                if(!accMap.containskey(opp.AccountId)){
                    accMap.put(opp.AccountId,1);
                }
                else{
                    integer sum = accMap.get(opp.AccountId);
                    sum = sum + 1;
                    accMap.put(opp.AccountId,sum);
                }
            }
             
        }
    }