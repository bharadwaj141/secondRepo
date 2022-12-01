@isTest
public class BharatTestClass {
@isTest
    public static void main(){
        opportunity opp = new opportunity();
          opp.Name='raj';
          opp.StageName='closed won';
        opp.CloseDate= system.today();
        insert opp;
        
        
        product2 pro = new Product2();
        pro.name='eye';
        insert pro;
        List<id> lid = new List<id>();
        List<pricebook2> pb=[select id from pricebook2 where isStandard=true];
        for(pricebook2 p:pb){
            lid.add(p.id);
        }
        
        
        
        
    }
}