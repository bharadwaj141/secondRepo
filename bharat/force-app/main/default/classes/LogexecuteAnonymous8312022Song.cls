public class LogexecuteAnonymous8312022Song {
    public static void main(){
 //---------public static void main(List<Agreement__c> agList)-------------------------------------------PAyment Question
 
 
 //"Create a Custom field on Account - Recently Added (Lookup - Contact).
//Write an Apex script to fill the field with latest created contact record in Account relation."       
      /*   
          List<id> cid= new List<id>();
          set<id> aid= new set<id>();
          List<Contact> conList = [select id,Name from Contact];
           for(Contact con:conList){
            cid.add(con.id);
            aid.add(con.AccountId);
         }
        List<Account> accList = [Select id,name from Account where id in:aid];
        for(Account acc:accList){
            acc.Contact__c=cid[0];
            aac.add(acc);
        }
     
       update aac;
            
                                       * /
                                        
                                        
        /*
//Create a Custom Object Song and fields - Name, Favourite (Checkox) and lookup (Contact). 
//Create some dummy records related to contacts.
//Write a script to print favourite songs first and rest of the songs later related to contacts.

       List<Song__c> so= [Select name from Song__c order by Favourite__c desc ];
                       for(Song__c s:so){
                            system.debug(s.song__c);
                           }                            */
        
//------------------------------------------------------------------------------------------------------------------------      
//Write a script to find all the contacts who have the same parent account and add them to the opportunity
//   contact role under the opportunity which has the same parent account.
//Example:- Account: Birla have 3 Contacts: ajay,amar,anuj Then on Opportunity for Birla add ajay,amar & anuj 
//to Opportunity Contact roles.       
        
        
        /*    List<Contact> conList = [select id,name,AccountId from Contact where AccountId!=null]; 
                     Set<id> sid = new Set<id>();
                     for(Contact c:conList){
                         sid.add(c.AccountId);
                                            }
              List<Opportunity> oppList = [Select id,name, AccountId from Opportunity where AccountId In:sid];
              List<OpportunityContactRole> ocr = new List<OpportunityContactRole>();
                  for(Contact con:conList){
                       for(Opportunity opp:oppList){
                             if(con.AccountId==opp.AccountId){
                                  OpportunityContactRole oc =new OpportunityContactRole();
                                       oc.ContactId=con.id;
                                           oc.OpportunityId=opp.id;
                                                      ocr.add(oc);
                                          }
                                   }
                              }
                                           insert ocr;    */
//----------------------------------------------------------------------------------------------------------------------------     
//"Create a checkbox on Contact ""copy Address"".Write a script to find anyone contacts having ""copy Address"" is true 
//     and copy the account's billing address to the contact's mailing address."    
        
        /*        List<Contact> conList = [Select id,name,MailingAddress,Account.BillingStreet,Account.BillingCity,
                                                      Account.BillingState,Account.BillingPostalCode,Account.BillingCountry,AccountId
                                                      from Contact where copy_Address__c=true And AccountId!=null];


                       for(Contact con:conList){ 
                            con.MailingStreet = con.Account.BillingStreet;
                            con.MailingCity = con.Account.BillingCity;
                            con.MailingState = con.Account.BillingState;
                            con.MailingPostalCode = con.Account.BillingPostalCode;
                            con.MailingCountry =con.Account.BillingCountry;       
                           }
                       update conList;    */
//--------------------------------------------------------------------------------------------------------
//"Write a Script to creates New Account records when related contacts are more than 10 records.
//Ex:- Existing Account name is A1 and its related contacts are 14. then create a New Account with the same name A1 and added the rest 4 contacts records under new Account records.
//A1(14)----- The script is run ---->A1(10), A1(4).
//Note:-Script should maintain bulk records."
        
    /*        List<AggregateResult> result =[Select AccountId,count(id)a from Contact  Group By  AccountId Having count(id)>5];
              set<id> sid = new set<id>();
               System.debug('result -> '+result);
                   for(AggregateResult c:result){
                      System.debug('Id -> '+c.get('a'));
                       sid.add('AccountId');
               }
                   List<Account> accList =[select id,name from Account where Id In:sid];

                    List<Account> accCloneCopy  = accList.clone();
                         insert accCloneCopy;
                                                                        */              
                                                        
//------------------------------------------------------------------------------------------------------------------
//"Create a custom object Agreement with the below fields :
// - Duration (picklist values 3,6,9)
//Create another custom object Payment with the below fields :
// Start Date (type - Date )
// End Date (type - Date )
// Agreement (Lookup of agreement)
// Write a script to create payment record according to the agreement Duration.
//For Ex : If the agreement duration is 3 then create 3 payment records related to that agreement with the start date 
//of the first record must be today's date and the end date must be of one month from today's date and continue
// for other records."
        
 //agreement trigger
 //       
     /*
        List<Payment1__C> pList = new List<Payment1__c>();
        for(Agreement__c ag:trigger.new){
            for(integer i=0; i<(integer.valueof(ag.Duration__c));i++ ){
                Payment1__C paymentObj = new Payment1__C();
                paymentObj.Name='Payment'+i;
                paymentObj.Start_Date__c=system.today().addMonths(i);
                paymentObj.End_Date__c=system.today().addMonths(i+1);
                paymentObj.Agreement__c = ag.id ;
                pList.add(paymentObj);
                
            }
        }
       
       insert pList ;
        system.debug(pList);            
// }                               */
// -------------------------------------------------------------------------------------------------------------
// """Create a custom object named 'maintenance'. Create two fields on it:
//- Contact (Lookup)
//- Rating (picklist) value from 1 to 5.
//Create a custom field on contact named 'Average rating'.
//Write a program to calculate the average rating of contact and updates in the 'Average Rating' field of contact."""
  
      /*     integer rat;    -----------------------------------------------Through Trigger
    integer count=0;
     set<id> sid = new Set<id>();
        for(Maintenance__c main:Trigger.new){
            sid.add(main.Contact__c);
            rat=integer.valueOf(main.Rating__c);
    }
    for(Maintenance__c mt:[select id from Maintenance__c where Contact__C IN:sid]){
        count++;
    }
         List<Contact> conList = [select average_rating__C from contact where id IN:sid];
            for(Contact con:conList){
               if(con.Average_rating__c==null){
                   con.Average_rating__c=0;
        }
        con.average_rating__C= (con.average_rating__C+rat)/count;
       update conlist; 
    }              */

 //"Create a picklist Product Rating (Values as 1 star, 2 stars, 3 stars, 4 stars, 5 stars]
 // on Product2 and same Multi picklist fieldRate on Opportunitylineitem with the same value,
 // Write a script to get all the opportunities which got less than 3 ratings in opportunity line items
 // but the Product rate for those was 5 stars."
  
   /*     List<Opportunity> oppList =[select name,(select Rating__c,Product2.Product_Rating__c from OpportunityLineItems) from 
                                    opportunity];
        for(Opportunity opp:oppList){
            for(OpportunityLineItem opli:opp.OpportunityLineItems){
                if(opli.Rating__c=='2' && opli.Product2.Product_Rating__c=='5'){
                    system.debug(opp.name);
                }                  
            }
        }
        update oppList;      */
//-----------------------------------------  ------------------------------    
  
//Create a field highest price, lowest price both of currency type on opportunity. 
//Write a script to find the highest and lowest price from the Opportunity line item and fill their respective fields.
       
  /*      List<Opportunity> oppList = [select id,highest_price__c,lowest_price__c from Opportunity];
        
        List<AggregateResult> Agg = [select opportunityid,max(unitPrice)a,min(unitPrice)b from OpportunityLineItem 
                                     group by opportunityid];
        For(AggregateResult ag:Agg){
            for(Opportunity opp:oppList){
                if(ag.get('opportunityid')==opp.id){
                     opp.highest_price__c=integer.valueOf(ag.get('a'));
                opp.lowest_price__c=integer.valueOf(ag.get('b'));
         
                }      
            }
        }
        update oppList;                */
//--------------------------------------------------------------------------------------------------------
//Create a custom field on opportunity named(total order) and
//update the total order filled with the total no of order related to the opportunity.

   /*    List<opportunity> oppList = [Select id,name,total_order__C,(select id from Orders) from opportunity];
        for(Opportunity opp:oppList){
            for(Order o:opp.orders){
                 opp.total_order__C=opp.orders.size();
             system.debug(opp.Name);
            }          
        }
        update oppList;      */
        
//"Write a Script to get all the Products Name(in a list) which were sold with 
//one-time Quantity(Opportunitylineitem) > 100 under their Opportunities(CLOSED WON only). 
 
 /*     List<opportunity> oppList = [select id,stageName,(select quantity,Product2.name from opportunityLineItems ) from opportunity];
        for(Opportunity opp:oppList){
            for(opportunityLineItem op:opp.opportunityLineItems){
                if(op.Quantity>100 && opp.StageName=='closed won'){
                    system.debug(op.Product2.name);
                }
            }
        }
        update oppList;        */
//---------------------------------------------------------------------------------------------------
//Write a script to get all the opportunity's ContactRole name if ContactRole Account has more than 2 Contacts in them.
        
  /*      List<Account> accList= [select id,(select id,name from contacts) from Account];
        set<id> sid = new set<id>();
        set<id> oid = new set<id>();
        for(Account acc:accList){
            for(Contact con:acc.contacts){
                 if(acc.contacts.size()>2){
                sid.add(con.id);                    
               }
            }
        }   
        List<OpportunityContactRole> ocr= [select contactId,contact.name from OpportunityContactRole];
        for(OpportunityContactRole oc:ocr){
            if(sid.contains(oc.ContactId)){
                oid.add(oc.contactid);             
            }            
        }   
        List<contact> conList= [select id,name from contact where id In:oid];
        for(Contact c:conList){
            system.debug(c.name);
        }                                 */
//----------------------------------------------------------------------------------------------------------------------------        
//"""Create a custom Object : Daily Status and fields - Datetime(Login Time), Datetime (Logout Time), Lookup contact (Employee)
//Write a script to find the longest and shortest time interval of contact(Time interval = Logout time - Login time)"


//--------------------------------------------------------------------------------------------------------
// Create 2 custom lookup fileds "AccountLookup" and "ContactLookup" in Lead . If the Lead status is "Working-Contacted" 
// or "Closed-Converted"and Number of Employees are greater than 100,than a contact should be inserted in Lead's"ContactLookup" 
// and the contact's parent account should be in Lead's "AccountLookup".          
        
        List<Lead> ldList =[select id,name,Account__c,Contact__c from Lead where (status='working - contacted' OR status='closed - Converted') And NumberOfEmployees>100 ];
        List<Lead> ldList1 = new List<Lead>();
        
        Account acc = new Account();
        acc.Name= 'Ashish';
        insert acc;
        
        contact con = new contact();
        con.LastName= 'kapoor';
        con.AccountId=acc.Id;
        insert con;
        
        for(Lead ld:ldList){
             
            Lead ld1 = new Lead();
            ld1.Account__c=acc.Id;
            ld1.Contact__c= con.Id;
            ld1.Id=ld.id;
            ldList1.add(ld1);
        }
        update ldList1;
//---------------------------------------------------------------------------------------------
//        
  
    
//-------------------------------------------------------------------------------------------------    
   
    
    
    }      
}