public  class lWCSheet6 {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount() {

        List<Account> accList=[SELECT Id,Name FROM Account  limit 20];
        return accList;
    }
}