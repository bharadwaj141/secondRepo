//Create an aura component that will be used to create a new contact with account lookup.

public class Aura8Sheet {

    @Auraenabled
    public static list<account> retrieveAccount(){
        List<Account> accList = [select Id,Name from Account];
        return accList;
    }
    @AuraEnabled
    public static void createContact(Contact con){
        insert con;
    }
}