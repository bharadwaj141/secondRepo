//Create 10 Products with different Product Names,  Discrption & Family 
public class Question_5 {
    public static void main(){
        list<Product2> proList = new list<Product2>();
        for(integer i=1;i<=10;i++)
        {
            Product2 pro = new Product2();
            pro.Name = 'Garnier'+i;
            pro.Description = 'It is Very Good';
            pro.Family = 'None';
            proList.add(pro);
        }
        insert proList;
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    public static void sMethod(){
    List<Contact> conList = [select id,name,AccountId,Account.Name from Contact where AccountId!=null And Account.Name Like '%A%' limit 1];
        system.debug('before Delete list-->'+conList);
        //delete conList;
        //system.debug('After Delete list-->'+conList);
    }
}