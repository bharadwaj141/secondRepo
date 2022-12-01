public class Script2 {
    public static void main(){
//------------------------------------------------------------------------------------
//       Print the fionacci series. 1, 1, 2, 3, 5, 8, 13.
       
 /*       integer a=0;
        integer b=1;
       integer c;
        for(integer i=2;i<10;i++){
            c=a+b;
            system.debug(+c);
             a=b;
             b=c;
        }  */
 //-----------------------------------------------------------------------------------
 //Print any Integer number in reverse order. Ex: 789234  => 432987.
        
    /*    integer n=4563;
     system.debug(string.valueOf(n).reverse());       
    }   */
//----------------------------------------------------------------------------------------------      
//Write a Script to get all the Contacts having same email as any Salesforce User.Email.

   /*     List<Contact> conList =[select id,name,email from Contact];
        for(Contact con : conList){
            if(con.email==userinfo.getUserEmail()){
                system.debug(con.name+'='+con.Email);
            }
        }      */
//------------------------------------------------------------------------------------------------------

 // Create several Accounts and Opportunites and products. Write a Script to get all the Accounts having more 
 // than 2 Opportunites with Closed Won."
    
   /*     List<Account> accList = [Select id,name,(select id,name,stageName from Opportunities where 
                                                 stageName='Closed Won') from Account];
        for(Account acc:accList){
            if(acc.Opportunities.size()>2){
                system.debug(acc.Name);
            }
        }   */
////----------------------------------------------------------------------------------------------------------------------------       
//Create a look up[Lead] on product so that Products come over in related list of a Lead.
//  Write script to create 3 Leads and 5 Products with Lead lookup field.
      /*        List<Lead> ldList = new List<Lead>();      
                for(integer i=1;i<=3;i++){
                Lead ld = new Lead();
                 ld.LastName='Ram'+i;
                 ld.Company='cloud Analogy';
                 ld.Status='working';
                 ld.City='Ghaziabad';
                 ld.MobilePhone='9876552525';
               ldList.add(ld);              
          }
             insert ldList;            
             List<Product2> proList = new List<Product2>();
                for(Lead ld:ldList){
                   for(integer i=1;i<=5;i++){
                      Product2 pro = new Product2();
                      pro.Name='VIVO'+i;
                       pro.Lead__c=ld.Id;
                      pro.Description='This is Nice Product';
                      proList.add(pro);
                   }
                }
                     insert proList;      */
 //-------------------------------------------------------------------------------------------------------
 //Create a Script to find out all the users in the systems 
 //who are having more than 20 Leads allocated[Owner] to them in month of feb 2019.
 
 /*                 List<AggregateResult> ldList = [select owner.name from lead group by owner.name having count(id)>5];
        for(AggregateResult l:ldList)
        {
            system.debug(l);
        }      */
//-----------------------------------------------------------------------------------------------------------
//"Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field). Another Junction Object ""Event Participant"" with 3 fields
//1. lookup Contact
//2. lookup Event
//3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
//Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer."
       
        List<Contact> conList= [select id from contact Limit 10];
        List<id> cid = new List<id>();
        List<Event__c> eList=[select id from Event__c];
       List<id> eid = new List<id>();
            
        List<Event_Participant__c> eventList = new List<Event_Participant__c>();
        for(Contact con:conList){
            cid.add(con.id);
        }
        for(Event__C eo:eList){
            eid.add(eo.id);
        }
        for(integer i=0;i<=9;i++){
            Event_Participant__c o=new Event_Participant__c();
            o.Name='Ranjana'+i;
            o.Contact__c=cid[i];
            o.Event__c=eid[0];
            if(i<3){
                o.Contact_type__c='Attendee Contact';
            }
            else if(i>=3 && i<6){
                o.Contact_type__c='Presenter Contact';
            }
            else if(i>=6){
                o.Contact_type__c='Organizer Contact';
            }
            
            eventList.add(o);
        }
        insert eventList;
        system.debug('eventList');
    }
}