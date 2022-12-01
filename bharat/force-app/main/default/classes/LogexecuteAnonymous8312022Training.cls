//Create 4 custom fileds in Opportunity "1:Sum of TotalPrice" ," 2: sum of UnitPrice","3: Maximum Quantity","4: minimum Quantity" 
// Write a script to calculate total price, TOtal unit, maximum Quantity, and minimum Quantity of the opportuniyLineItem ,
// and store the values in Every opportunity custom fields.


public class LogexecuteAnonymous8312022Training {
     public static void main(){
   // public static void main(List<Lead> ldList){
 //-----------------------------       
/*        List<Opportunity> oppList = [select Sum_of_Total_Price__c,Sum_of_Unit_Price__c,Maximum_Quantity__c,Minimum_Quantity__c,
                                     (select totalprice,unitprice,quantity from OpportunityLineItems) from Opportunity];
        List<Opportunity> UpdatedList = new List<Opportunity>();
        for(Opportunity opp:oppList){
            if(opp.OpportunityLineItems.size()>0){
                List<Decimal> QuantityList = new List<Decimal>();
             Decimal totalPrice=0.0;
            Decimal totalUnitPrice=0.0;
            for(opportunityLineItem  opli:opp.OpportunityLineItems){
                QuantityList.add(opli.Quantity);
                totalPrice += opli.TotalPrice;
                totalUnitPrice += opli.UnitPrice;               
            }
            opp.Sum_of_Total_Price__c=totalPrice;
            opp.Sum_of_Unit_Price__c=totalUnitPrice;
            QuantityList.sort();
            opp.Maximum_Quantity__c=QuantityList.get(QuantityList.size()-1);
            opp.Minimum_Quantity__c=QuantityList.get(0);
            UpdatedList.add(opp);
            
        }
        if(!UpdatedList.isEmpty()){
            update UpdatedList;
            }
            
        }                   */
 //---------------------------------------------------
 //Write a script to get all the opportunity name if opportunity' account name is same as the ContactRole Account name and 
//    Opportunity is Closed won or closed lost.
       
  /*      List<Opportunity> oppList = [select name,Account.name,stageName,(select Contact.Account.name from OpportunityContactRoles) from Opportunity where StageName='closed won' OR stageName='closed Lost'];
        for(opportunity opp:oppList){
            for(OpportunityContactRole ocr:opp.OpportunityContactRoles){
                if(opp.Account.name==ocr.contact.Account.name){
                    system.debug(opp.Name);
                }
            }
        }                   */
//------------------------------------------------------------------------------
// Get Total Amount of only those Opportunity whose Opportunity's close date falls in next 30 days 
// and OpportunityLineItem quantity is more than 50.
 /*   
     List<opportunity> oppList = [select name,Amount,closedate,(select id,quantity from OpportunityLineItems where quantity>50) from Opportunity where closedate>:date.today() And closedate<:date.today()+30];
        for(Opportunity opp:oppList){
            system.debug(opp.name);
        }
                            */
//---------------------------------------------------------------------------------
//  Create an Object "QuickLinks" and "Help" both having the following fields. 
//  1. Account Lookup "Account"   2. Contact Lookup "Contact"  3. Company Name as Text field  4. URL field as URL. 
//    Write a Script to copy all Quick link URLs on Help only for Accounts which are having exactly one Help 
//   and one Quick links in its related list ."

   /*     List<QuickLinks__c> accList = [select Account__C,URL__c,Contact__c from QuickLinks__c];
        List<Help__c> hList= [select Account__c from Help__c ];
        List<Help__c> hList1 = new List<Help__c>();
        
        for(QuickLinks__c q:accList){
            for(Help__c h:hList){
                if(q.Account__c==h.Account__c){
                    h.URL__c=q.URL__c;
                    h.contact__c=q.contact__c;
                    hList1.add(h);
                }
            }
        }
        
        update hList1;        */
        
//---------------------------------------------------------------------------------
// create a checkbox field on contact "copy address to contact". Write a script to find all the contact
//   with this field as true and copy the billing address from account in its related contact in which the field is true.
         
 /*   List<Account> accList = [select  BillingStreet,BillingCity, BillingState,BillingPostalCode,BillingCountry,
                             (Select  copy_Address__c,MailingStreet,MailingCity, MailingState,MailingPostalCode,MailingCountry
                             from Contacts) from Account];
        List<contact> conList = new List<contact>();
        for(Account acc:accList){
            for(Contact con:acc.contacts){
                if(con.copy_Address__c==true){
                    con.MailingStreet= acc.BillingStreet;
                    con.MailingCity= acc.BillingCity;
                    con.MailingState= acc.BillingState;
                    con.MailingPostalCode= acc.BillingPostalCode;
                    con.MailingCountry= acc.BillingCountry;
                    conList.add(con);
            }
          }
        }
           update conList;               */
//----------------------------------------------------------------------------------------------
//"Create Custom Object-- Financial Account. Create field. 1- Total Fees
// Create Custom Object-- Receivables. Create field.. 1- Total Amount-- 2- Financial Account(Lookup field)
//Update the sum of all the total Amount field of Receivables to the total fees of Financial Account." 
       
  /*      List<Financial_Account__c> fList =[select Total_fees__c,(select Total_Amount__c from Receivables__r) from Financial_Account__c];
        
        
            List<Financial_Account__c> fl = new List<Financial_Account__c>();
          
        for(Financial_Account__c f:fList){           
            Decimal totalAmount=0.0;
            for(Receivables__c r:f.Receivables__r){
                  totalAmount = totalAmount + r.Total_Amount__c;
            }
            f.Total_fees__c = totalAmount;
            fl.add(f);
        }    
        update fl;              */
//--------------------------------------------------------------------------------------------------------
//Create custom object Name as 'Time'.Create Two Fields Start_date and End_Date datatype as date 
//Create a Relation between Contact(Parent) and Time(Child) Object. Write a Trigger whenever a Time record will be inserted or 
//updated which name Starts with "A" and End Date exist in last month then It will create or 
//update. contact record last name with same name as time record. 


/*   public class TimeObject {
    public static void main(List<Time__c> tList){

        List<Contact> conList = new List<Contact>();

        for(Time__c timeObj : tList){
            Integer previousMonth = timeObj.End_Date__c.month();
            if((timeObj.Name.startsWith('A') || timeObj.Name.startsWith('a')) && previousMonth == date.today().month() - 1 && timeObj.Contact__c != null){
                Contact con = new Contact();
                con.Id = timeObj.Contact__c;
                con.LastName = timeObj.Name + ' Time';
                conList.add(con);
            }
        }
        update ConList;        
    }    
}                */
//--------------------------------------------------------------------------------------------------------------
// Create a custom field called duplicate(checkbox) in Account. Write a script to check if the contact in the Account
//  and contact roles in its related opportunity are same then set the checkbox to true.        
         
  /*       
        
        map<id,contact> AcConMap= new map<id,contact>();
        List<Account> aclist=[select Duplicate_contact__c,id,(select name from contacts) from account];
        for(Account ac:aclist){
            for(contact co:ac.contacts){
               AcConMap.put(ac.id,co); 
            }
        }
              
   List<Opportunity> oplist=[select name,id,accountid,(select contact.name from OpportunityContactRoles) 
                               from opportunity where accountid in:AcConMap.keyset()];
        for(Opportunity op:oplist){
            for(OpportunityContactRole ocr:op.OpportunityContactRoles){
                if(ocr.contact.name==AcConMap.get(op.accountid).name){
                    Account ac= new Account();
                    ac.id=op.AccountId;
                    ac.Duplicate_contact__c=true;
                    update ac;
                }
            }
        }
    
    
      
     
                                                  */
//--------------------------------------------------------------------------------------------
// Create 2 custom lookup fileds "AccountLookup" and "ContactLookup" in Lead . If the Lead status is "Working-Contacted" 
// or "Closed-Converted"and Number of Employees are greater than 100,than a contact should be inserted in Lead's"ContactLookup" 
// and the contact's parent account should be in Lead's "AccountLookup".      
        
     /*   Map<Id, Contact> conMap = new Map<Id,Contact>();
        for(Lead ld1:ldList){
        
            if((ld1.Status=='working-Contacted' || ld1.Status=='Closed-Converted') && ld1.NumberOfEmployees>100 && ld1.Account__c != NULL){
                contact con = new Contact();
                con.LastName = 'sdfghjk';
                 con.AccountId=ld1.Account__c;
                 conMap.put(ld1.id,con);
            }
        }
        if(!conMap.isEmpty() || conMap.size() > 0){
        	insert conMap.values();
        }
        List<Lead> newLeadList = new List<Lead>();
        for(Lead ld1:ldList){
            if(conMap.containskey(ld1.id)){
                ld1.Contact__c = conMap.get(ld1.id).Id;
                newLeadList.add(ld1);
            }
        }
        update ldList;
                                   */
//----------------------------------------------------------------        
   /*     List<Lead> ldList1 = [select id,Name, Account__c,Contact__c from Lead where (status='working - Contacted' OR status='closed - Converted') AND NumberOfEmployees>100 ];
        List<Lead>ldList2 = new List<Lead>();
               
          Account acc = new Account();
                acc.Name= 'Allu';
                insert acc;
                      
                contact con = new Contact();
                con.LastName='Arjun';
                con.AccountId=acc.Id;
                 insert con;
        
        for(Lead ld: ldList1){
            
           Lead ld1 = new Lead();
            ld1.Id=ld.Id;
            ld1.Account__c= acc.Id;
            ld1.Contact__c=con.id;
            ldList2.add(ld1);
        }
        if(!ldList2.isEmpty()){
             update ldList2;
            
        }
                        */      
    
    
//----------------------------------------------------------------------------------------------------------
//  Create three custom objects: 1. Doctor.(Fileds{Name,Specilation}) 2. Paitent.(Fields{Name,Problem}) 
    // 3. Appointment.(Fields{Doc,Paitent,AppointmentDate,Descreption}) .
    // WA Trigger to restrict a doctor to have more than 8 visit request in a day and restrict a patient to visit the same doctor in a day twice."
    
  
        
  /*   public static void restrictPatient(List<Appointment__c> newAppList){
     
     List<Appointment__c> appList = [Select Name, Doctor__c, Patient__c,AppointmentDate__c From Appointment__c ];
     
     for(Appointment__c ap: newAppList){
     
     Integer patientcount = 1;
     Integer docCount = 1;
     
     
        for(Appointment__c a: appList){
     
           if(a.Doctor__c == ap.Doctor__c && a.AppointmentDate__c == ap.AppointmentDate__c){
     
            docCount++;
      }
     
     if(a.Patient__c == ap.Patient__c && a.Doctor__c == ap.Doctor__c && a.AppointmentDate__c == ap.AppointmentDate__c){
     patientCount++;
     }
     
     if(patientCount>1){
     ap.AddError('you can not get appointment try again next day');
     }
     
     if(docCount>8){
     ap.AddError(' you can not have any more appoinments today');
     }     
         }
       }
    }          */
//---------------------------------------------------------------------------------------------------
// Create a field on Account called “Out_of_Zip”, checkbox, default off
// Assignment:  When a Billing Address is modified, get the new Postal Code.
//  Then check which Contacts on the Account are outside that Postal Code. 
//  If 1 or more Contacts are outside of the Postal Code,mark Out_of_Zip as TRUE.    
    
 /*         public static void updateAccountUpdateOutOdZip(List<Account> newList, List<Account> oldList){
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
        }             */
//-----------------------------------------------------------------------------------------------------------
/* public class MinDiffDatePutInRelatedAccClass {
        public static void minDiffDatePutInRelatedAccMethod(){
            try{         
                List<Contact> conList = [SELECT AccountId,StartDate__C, EndDate__C, Name From Contact WHERE EndDate__C != Null AND StartDate__C != Null AND AccountId != Null];
                
                Set<Id> accIdSet = new Set<Id>();
                for(Contact con : conList){
                    accIdSet.add(con.AccountId);
                }
                
                Set<Id> conIdSet = new Set<Id>();
                for(Id accId : accIdSet){
                    ID conId;
                    Integer oldDateDiff = 1000;
                    for(Contact con : conList){
                        if(accId.equals(con.AccountId)){
                            Integer newDateDiff = (con.StartDate__c.daysBetween(con.EndDate__c));
                            if(newDateDiff < oldDateDiff){
                                oldDateDiff = newDateDiff;
                                conId = con.Id;
                                System.debug(conId);
                            }
                        }
                    }
                    conIdSet.add(conId);
                }
                
                List<Contact> conList1 = [SELECT Account.Name, Account.StartDate__C, Account.EndDate__C, StartDate__C, EndDate__C, Name FROM Contact WHERE Id =: conIdSet];
                List<Account> accList = new List<Account>();
                if(conList1 != null){
                    for(Contact con : conList1){
                        Account acc = con.Account;
                        acc.StartDate__c = con.StartDate__c;
                        acc.EndDate__c = con.EndDate__c;
                        accList.add(acc);
                    }
                }
                
                if(!accList.isEmpty()){
                    update accList;
                }
            }
            catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }              */        
 //----------------------------------------------------------------------------------------------
 /* Question 2 :"Create a custom object ""Actors"" having lookup with Account name
        and having a field rating[number] on it. Create a custom field on Account ""Total Rating"" .
      write a script find all ""Actors"" who have rating more or equal than 10,Add all the ratings 
      and update in Total Rating filed on Account which is related the the Actors name Starts with 'A' or 'D'."
        Solution: 

        public class FindActor {
            public static void findAcctorInAccount(){
                try{
                    List<Account> accList = [SELECT id, (SELECT Name__c, Ra__c FROM Actors__r WHERE Name__c LIKE 'A%' OR Name__c LIKE 'D%') FROM Account];
                    List<Account> updateAccList = new List<Account>();
                    
                    if(!accList.isEmpty()){
                        for(Account acc : updateAccList){
                            Integer actorRating = 0;
                            for(Actors__c actor :  acc.Actors__r){
                                if(actor.Ra__c  >= 10){
                                    actorRating = actorRating + Integer.valueOf(actor.Ra__c);
                                }
                            }
                            acc.Total_Rating__c = actorRating;
                            updateAccList.add(acc);
                        }
                        
                        if(!updateAccList.isEmpty()){
                            update updateAccList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception '+ex.getMessage());
                }
            }
        }                                                 */
         
//------------------------------------------------------------------------------
/* Question 3 :Create custom fields
        - Matching record(checkbox) on opportunity
        - Record(Text) on opportunityLineItem
        write a trigger on opportunity to checked the matching record
        field when opportunity name is matched in Record field.
        
        /*Trigger*/
    /*    trigger OpportunityTrigger on Opportunity (After update, Before insert, Before update) {
            
            /*if(Trigger.isAfter && Trigger.isUpdate){
                if(!EnableMatchRecordFieldOnOpp.flag){
                    EnableMatchRecordFieldOnOpp.flag = true;
                    EnableMatchRecordFieldOnOpp.enableMatchRecords(Trigger.new);
                }
            }
        }
                            */
        
        /*Trigger Handler Class*/
  /*      public class EnableMatchRecordFieldOnOpp {
            public static Boolean flag = false;
            public static void enableMatchRecords(List<OpportunityLineItem> newList){
                try{
                      set<id> sid = new Set<id>();
        for(OpportunityLineItem ocr:newList){
            sid.add(ocr.OpportunityId);
        }
        List<opportunity> oppList = [select id,Matching_Record__c,name,(select id,Opportunity_Record__c from OpportunityLineItems
                                     where Opportunity_Record__c!=null) from Opportunity where id In:sid];
       
       system.debug('Before Update--->'+oppList);
        for(Opportunity opp:oppList){
            if(opp.OpportunityLineItems.size()>0){
                for(OpportunityLineItem opli:opp.OpportunityLineItems){
                    if(opli.Opportunity_Record__c==opp.Name){
                       opp.Matching_Record__c = true;
                      
                    }
                }
            }
        }
        system.debug('After Update----->'+oppList);
        update oppList;
                }
                catch(Exception ex){
                    System.debug('Exception '+ex.getMessage());
                }
            } 
        }                         */                       
//-----------------------------------------------------------------------
/* Question 12: "Create a trigger on Lead to run when the lead stage is ""Completed"" to 
  * create an Opportunity with Opportunity line Item and Product from Lead related list.[create custom lookup]
 Ex:- If Lead is having 3 Products in its related list then Opportunity must have
          3 Opportunity line Items with those products and 1 quantity."
        
        
        /*Trigger*/
/*        trigger LeadTrigger on Lead (before update) {
             if(Trigger.isBefore && Trigger.isUpdate){
                CreateOppWithLead.createOpportunityWithOppLineItem(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/
 /*       public class CreateOppWithLead {
            public static void createOpportunityWithOppLineItem(List<Lead> leadList){
                try{
                    if(!leadList.isEmpty()){
                        List<PricebookEntry> pbEntryList = [SELECT Id, Product2.Name,UnitPrice FROM PricebookEntry WHERE Product2.Lead_Product__c IN :leadList AND Pricebook2.IsStandard =true];
                        List<Opportunity> oppList = new List<Opportunity>();
                        
                        for(Lead led : leadList){
                            if(led.Status.equals('Closed - Converted')){
                                Opportunity opp = new Opportunity();
                                opp.Name = 'New-Lead-Opportunity';
                                opp.CloseDate = Date.today();
                                opp.StageName = 'Closed Lost';
                                oppList.add(opp);
                            }
                        }
                        
                        if(!oppList.isEmpty()){
                            insert oppList;
                        }
                        
                        List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
                        for(Opportunity opp : oppList){
                            for(PricebookEntry pbEntry : pbEntryList){
                                OpportunityLineItem oppItems = new OpportunityLineItem();
                                oppItems.opportunityId = opp.Id;
                                oppItems.pricebookEntryId = pbEntry.Id;
                                oppItems.Quantity = 1;
                                oppItems.UnitPrice = pbEntry.UnitPrice;
                                oppLineItemList.add(oppItems);
                            }
                        }
                        
                        if(!oppLineItemList.isEmpty()){
                            insert oppLineItemList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ ex.getMessage());
                }
            }
        }                        */                     
//-------------------------------------------------------------------------------
/* Question 23 : "create a custom object 'Trello', and create lookupfield with contact onit.
        write trigger to update Trello name when contact lastname update."
        /* Trigger */ 
/*        trigger ContactTrigger on Contact (Before insert, Before update) {
            if(Trigger.isUpdate && Trigger.isUpdate){
                UpdateTrelloName.updateTerlloName(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/
 /*       public class UpdateTrelloName {
            public static void updateTerlloName(List<Contact> conList){
                try{
                    List<Trello__c> terlloList = [SELECT Name, TerlloLookup__c  FROM Trello__c WHERE TerlloLookup__c =:conList];  
                    List<Trello__c> updateTerlloList = new List<Trello__c>();
                    
                    if(!terlloList.isEmpty()){
                        for(Contact con : conList){
                            for(Trello__c trello : terlloList){
                                if(con.Id == trello.TerlloLookup__c){
                                    trello.Name = con.LastName;
                                    updateTerlloList.add(trello);
                                }
                            }
                        }
                        
                        if(!updateTerlloList.isEmpty()){
                            update updateTerlloList;
                        }
                    } 
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }                             */
//---------------------------------------------------------------------------------------
/*       Question 4 : Write a Trigger to auto Create not more than 2 Contacts and Opportunities when the account is inserted and updated where status is Active.
        
        /*Trigger */
 /*       trigger AccountTrigger on Account (After insert, After update) {     
             if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){   
                AutoContactAndOpportunity.createContactAndOpportunity(Trigger.new);   
            }
        }
        
        /*Trigger Handler Class*/
/*        public class AutoContactAndOpportunity {
            public static void createContactAndOpportunity(List<Account> accList){
                try{
                    List<Contact> conList = new List<Contact>();
                    List<Opportunity> oppList = new List<Opportunity>();
                    for(Account acc : accList){
                        if(acc.Status__c == true){
                            for(Integer i = 1; i < 3; i++){
                                Contact con = new Contact();
                                con.AccountId = acc.Id;
                                con.LastName = 'Contact - '+i;
                                conList.add(con);
                                
                                Opportunity opp = new Opportunity();
                                opp.Name = 'Opp - '+i;
                                opp.AccountId = acc.Id;
                                opp.StageName = 'Close Won';
                                opp.CloseDate = Date.today();
                                oppList.add(opp);
                            }
                        }
                    }
                    if(!conList.isEmpty() && !oppList.isEmpty()){
                        insert conList;
                        insert oppList;
                    }
                }
                catch(Exception ex){
                    System.debug('Exception '+ex.getMessage());
                }
            }
        }          */ 
//---------------------------------------------------------------------------------
//Write a Trigger on lead to show error message when a lead is getting allocated[Owner] 
// to a user when the Owner User has reached the limit of 30 Lead owner in a particular month."   */

    /*    trigger TriggerSheetQ19 on Lead (before insert) {
        Integer count=0;
            List<Lead> l= [select id,owner.Name from lead where CreatedDate=THIS_MONTH];
            For(lead ld:l){
                if(ld.owner.name==userinfo.getName()){
                count++;
                } }
            for(Lead l1:trigger.new){
                If(count>30){
                    l1.adderror('Limit exceeded');
                }
            }  
        }              */   
    }   
}