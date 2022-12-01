@isTest
public class TestBatch4 {
@isTest
    public static void Testmain(){
        Account acc = new Account();
        acc.Name ='BharatTest';
        acc.Phone = '5678987654';
        insert acc;
        
        opportunity opp = new Opportunity();
        opp.Name = 'Bhushan Test';
        opp.StageName = 'closed won';
        opp.CloseDate = date.today();
        insert opp;
        
        Test.startTest();
        BatchSheet4 b = new BatchSheet4();
        database.executeBatch(b);
        Test.stopTest();
        
    }
}