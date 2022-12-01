@isTest
public class TestRamsir {
@isTest
    public static void main(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        
        Opportunity opp =  new opportunity();
        opp.Name = 'test opp';
        opp.StageName = 'closed won';
        opp.CloseDate = system.today();
        insert opp;
        
        product2 pro = new product2();
        pro.Name= 'phone';
        insert pro;
        
        id pricebookid = test.getStandardPricebookId();
        system.debug(pricebookid);
        
     /* pricebookentry pbe = new pricebookentry();
         pbe.Pricebook2Id = pricebookid;
        pbe.Product2Id = pro.Id;
        pbe.UnitPrice ='332';
        insert pbe;
     
        
      
        opportunityLineItem opli = new opportunityLineItem();
        opli.Product2Id = pro.Id;
        opli.OpportunityId = opp.Id;
        opli.PricebookEntryId = pbe;
        insert opli; */
        
        test.startTest();
        ramSir.main();
        test.stopTest();
    }
}