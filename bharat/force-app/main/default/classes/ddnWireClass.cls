public class ddnWireClass {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        List<Account> accList =[select Id,Name,phone from Account limit 10];
        return accList;
    }
    
}