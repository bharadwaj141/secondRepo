public class BrainStorming {
    public static void main(List<Contact> conList){
        
        if(!conList.isEmpty()){
            
            
            Account acc1 = new account();
            acc1.name= 'hmm';
            insert acc1;
            
            for(Contact con:conList){
                
                if(con.Accountid==null){
                    
                    con.AccountId=acc1.Id;
                    
                    
                }
                
                
            }
            
        }
        
    }
}