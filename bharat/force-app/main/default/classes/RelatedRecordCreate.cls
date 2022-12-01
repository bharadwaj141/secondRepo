public class RelatedRecordCreate {
    public static void main(){        
         List<Account> accList = new List<Account>();
          for(integer i=1;i<=5;i++){
            Account acc = new Account();
              acc.Name='monu'+i;
              acc.Phone='100446448';
              
                accList.add(acc);
                 List<Contact> conList = new List<Contact>();
                     for(integer j=1;j<=5;j++){
                         Contact con = new Contact();
                            con.FirstName='Shaghun';               
                            con.LastName='kumar'+j;
                            con.AccountId=acc.Name;   
                         
                        
                             conList.add(con);
                       }
                          insert conList;                        
          }
                          insert accList;
    }
}