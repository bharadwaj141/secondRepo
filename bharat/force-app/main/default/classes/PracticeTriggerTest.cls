@isTest
public class PracticeTriggerTest {
@isTest
    public static void main(){
        Account acc =  new Account();
         acc.name= 'Alia';
        acc.Description='yes awesome';
        insert acc;
        
        contact con = new contact();
        con.LastName= acc.name ;
        con.AccountId= acc.Id;
        insert con;
    }
}