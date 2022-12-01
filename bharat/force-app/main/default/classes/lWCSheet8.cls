public class lWCSheet8 {
    @AuraEnabled
    public static List<Account> getAccount() {
     List<Account> accList=[select Id,Name from Account limit 20];
     return accList;
    }

    @AuraEnabled
    public static void getcontact(Contact con) {
     
     insert con;
}
}