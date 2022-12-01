//Finds all account records that are passed in by the start() method using a QueryLocator 
//and updates the associated contacts with their account’s mailing address.

public class BatchApexPractice implements Database.Batchable<sobject> {
    public Database.QueryLocator Start(Database.BatchableContext bc){       
     return Database.getQueryLocator([Select id,name,ShippingCity,ShippingState,Shippingpostalcode,ShippingStreet,ShippingCountry From Account]);
    }
    public void Execute(Database.BatchableContext bc,List<Account>accList){
     List<Contact>  conList =[select id,name,AccountId,MailingCity,MailingState,Mailingpostalcode,MailingStreet,MailingCountry from Contact where AccountId!=null];
        for(Account acc:accList){
            for(Contact con: conList){
                if(con.AccountId==acc.id){
                    con.MailingStreet=acc.ShippingStreet;
                    con.MailingCity=acc.ShippingCity;
                    con.MailingState=acc.ShippingState;
                    con.MailingPostalCode=acc.ShippingPostalCode;
                    con.MailingCountry=acc.ShippingCountry;
                }
            }
        }
        update accList;           
      }
    public void Finish(Database.BatchableContext bc){
   }
}