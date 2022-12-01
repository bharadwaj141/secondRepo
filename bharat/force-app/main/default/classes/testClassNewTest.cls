@isTest
public class testClassNewTest {
@isTest
    public static void getClass(){
        Account acc = new Account();
        acc.name = 'Test Class';
        acc.Phone = '6789876789';
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'new Opportunity';
        opp.AccountId = acc.Id;
        opp.CloseDate = date.today();
        opp.StageName = 'Closed Won';
        insert opp;
        
        Test.startTest();
       
        newTest.getAccount();
        test.stopTest();   
        
    }
}