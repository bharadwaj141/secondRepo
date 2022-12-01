public class priceBookEntry {
    public static void main(){
        Product2 pro = new Product2();
        pro.Name= 'Coffee';
        pro.ProductCode='453';
        insert pro;
        
        pricebook2 pb=[select id,name from pricebook2 where isStandard=true limit 1];
        system.debug(pb);
        PricebookEntry pbe= new PricebookEntry();
       	//pbe.Pricebook2Id = pb.id;
        
        
    }
}