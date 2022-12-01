@isTest
public class TestAccount {
    @isTest
    public static void Testmain(){
        Account acc= new Account();
        acc.name='test';
        insert acc;
        Contact con = new Contact();
        con.lastname='test';
        con.AccountId=acc.Id;
        insert con;

    }
}