public class GetAllAccounts {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> getAccounts = new List<Account>([SELECT Name FROM Account]);
        return getAccounts;
    }
}