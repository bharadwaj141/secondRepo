public class Cloud {
    public static void main(){
        List<Account> accList = new List<Account>();
        for(integer i=0;i<=5;i++){
            Account acc = new Account();
            acc.Name='Ashish'+i;
            acc.Phone='376362233';           
            accList.add(acc);
        }        
        insert accList;
        List<Contact> conList = new List<Contact>();
        for(Account acc :accList){           
            for(integer j=0;j<=5;j++){
                Contact con = new Contact();
                con.firstName='Shubham';
                con.lastname='Kumar'+j;
                con.AccountId=acc.id;
                conList.add(con);
            }          
        }
         insert conList;
            system.debug('accList---->'  +accList);
                    system.debug('accList---->'  +conList);
    }
}