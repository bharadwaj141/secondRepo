@isTest
public class TestTrigger {
   @isTest
    public static void test(){
        Opportunity op = new Opportunity();
        op.stageName='Closed Won';
        Test.startTest();
        Database.SaveResult result=Database.insert(op,false);
        Test.stopTest();
        system.assert(!result.isSuccess());
    
    }
    
}