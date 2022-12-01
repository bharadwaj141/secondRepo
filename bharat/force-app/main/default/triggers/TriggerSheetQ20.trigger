// Write a trigger on Contact and fill its Mailing Address with its Account's Shipping Address.

trigger TriggerSheetQ20 on Contact (before insert,before Update) {
    List<id> cid = new List<id>();
    for(Contact con:Trigger.new){
        if(con.AccountId!=null){
          cid.add(con.AccountId);

        }
    }
    
    List<Account> accList = [select id,name,ShippingCity,ShippingState,Shippingpostalcode,ShippingStreet,
                                                    ShippingCountry from Account where id IN:cid];
    for(Account acc:accList){
        for(Contact con:Trigger.new){
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