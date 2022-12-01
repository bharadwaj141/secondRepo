public class OutOfZip {
    /*    public static void updateAccountUpdateOutOdZip(List<Account> newList, List<Account> oldList){
            try{
                
                List<Contact> conList = [select MailingPostalCode,AccountId,Account.BillingPostalCode,Account.out_of_zip__c
                                         from Contact where AccountId =:newList];
                for(Account newAcc:newList){
                    for(Account oldAcc:oldList){
                          if(newAcc.BillingPostalcode!=oldAcc.BillingPostalcode){
                            for(Contact con:conList){
                                if(newAcc.BillingPostalCode!=con.MailingPostalCode){
                                  
                                    newAcc.Out_Of_Zip__c= true;
                                    
                                }
                             }
                        }
                    }
                }
                update newList;
            }
            catch(Exception ex ){
                System.debug('Message :: '+ex.getMessage()+' Line Number :: '+ex.getLineNumber());
            
            }
        }
        /*
    public static void main(List<Account> accList,Map<id,Account> oldMap){
           
            List<Contact> conList = [select id,Account.BillingPostalCode,MailingPostalCode,Account.Out_of_zip__c from Contact where AccountId=:accList];


    }*/
    }