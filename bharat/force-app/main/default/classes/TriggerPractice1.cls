public class TriggerPractice1 {
   //     Question-1. "On Account to create a 'Default' (number of contacts= numbers of employee) contact every time an account is created./update"
   //     Solution.
        /* Trigger */
  /*      trigger AccountTrigger on Account (after insert, after update) {
           if(Trigger.isAfter && Trigger.isInsert){ CreateContactRelatedAccountClass.createContactRelatedAccountMethod(Trigger.New);
            }
            if(Trigger.isAfter && Trigger.isUpdate){    CreateContactRelatedAccountClass.updateContactRelatedAccountMethod(Trigger.Old, Trigger.New);
            }
        }             */
        
        /* Trigger Handler Class */
 /*       public class CreateContactRelatedAccountClass {
            public static void createContactRelatedAccountMethod(List<Account> accList){
                try{
                    if(!accList.isEmpty()){
                        List<Contact> conList = new List<Contact>();
                        
                        for(Account acc : accList){
                            if(acc.NumberOfEmployees > 0){
                                for(Integer i = 0; i < acc.NumberOfEmployees; i++){
                                    Contact con = new Contact();
                                    con.LastName = 'Contact - ' + i;
                                    con.AccountId = acc.Id;
                                    conList.add(con);
                                }
                            }
                        }
                        if(!conList.isEmpty()){
                            insert conList;
                        }
                    }
                }
                catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
            
            public static void updateContactRelatedAccountMethod(List<Account> oldAccList, List<Account> newAcctList){
                try{
                    if(!oldAccList.isEmpty() && !newAcctList.isEmpty()){
                        List<Contact> conInsertList = new List<Contact>();
                        List<Contact> conDeleteList = new List<Contact>();
                        
                        
                        for(Integer i = 0; i < oldAccList.size(); i++){
                            if(oldAccList.get(i).NumberOfEmployees < newAcctList.get(i).NumberOfEmployees){
                                Integer bothDiff = (newAcctList.get(i).NumberOfEmployees - oldAccList.get(i).NumberOfEmployees);
                                for(Integer j = 0; j < bothDiff; j++){
                                    Contact con = new Contact();
                                    con.LastName = 'Updated Contact ' + j;
                                    con.AccountId = oldAccList.get(i).Id;
                                    conInsertList.add(con);
                                }                     
                            }else if(oldAccList.get(i).NumberOfEmployees > newAcctList.get(i).NumberOfEmployees){
                                Integer bothDiff = (oldAccList.get(i).NumberOfEmployees - newAcctList.get(i).NumberOfEmployees);
                                conDeleteList = [SELECT Name FROM Contact WHERE AccountId =: oldAccList.get(i).Id LIMIT : bothDiff];
                            } 
                        }
                        if(!conInsertList.isEmpty()){
                            insert conInsertList;
                        }else if(!conDeleteList.isEmpty()){
                            delete conDeleteList;
                        }
                    }
                }
                catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        Question-2. On Opportunity do not let the user insert Opportunities with past closed Date with following Message "Please enter a future Closed Date""\
        Solution.                     */
        /* Trigger */
  /*      trigger OpportunityTrigger on Opportunity (before insert) {
            if(Trigger.isBefore && Trigger.isInsert){
                ErrorMessageClass.errorMessageMethod(Trigger.New);
            }
        }                     */
        
        /* Trigger Handler Class */
 /*       public class ErrorMessageClass {
            public static void errorMessageMethod(List<Opportunity> oppList){
                try{
                    for(Opportunity opp : oppList){
                        if(opp.closeDate < Date.today()){
                            opp.addError('Please enter a future Closed Date');
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        
        Question-3. On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$
        Solution.       */
        /* Trigger */
  //      trigger ProductTrigger on Product2 (after insert) {
  //          if(Trigger.isAfter && Trigger.isInsert){    AddStdPriceBookRelatedProductClass.addStdPriceBookRelatedProductMethod(Trigger.New);
  //          }
  //      }
        
        /* Trigger Handler Class */
 /*       public class AddStdPriceBookRelatedProductClass {
            public static void addStdPriceBookRelatedProductMethod(List<Product2> proList){
                try{
                    Pricebook2 stdPriceBook = [Select Id From Pricebook2 Where IsStandard=:true];
                    List<PricebookEntry> priBookEntryList = new List<PricebookEntry>();
                    for(Product2 pro : proList){
                        PricebookEntry priBookEntryObj = new PricebookEntry();
                        priBookEntryObj.IsActive = true;
                        priBookEntryObj.Product2Id = pro.Id;
                        priBookEntryObj.Pricebook2Id = stdPriceBook.Id;
                        priBookEntryObj.UnitPrice = 1;
                        priBookEntryList.add(priBookEntryObj);
                    }
                    if(!priBookEntryList.isEmpty()){
                        insert priBookEntryList;
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        Question-4. On Contact to update the Account Name field with contact Last Name, concatenated in the end. Example: If you Create A Contact whose FirstName='Sarthak' and LastName='Saxena' and the Accountname ='Tata', Then Account name must become 'TataSaxena'.
        Solution.                   */
        /* Trigger */
 /*       trigger ContactTrigger on Contact (before insert) {
            if(Trigger.isBefore && Trigger.isInsert){
        UpdateAccountWithContactName.updateAccountWithContactName(Trigger.New);
            }
        }
                        */
        
        /* Trigger Handler Class */
  /*      public class UpdateAccountWithContactName {
            public static void updateAccountWithContactName(List<Contact> conList){
                try{
                    Set<Id> accidSet = new Set<Id>();
                    for(Contact con : conList){
                        if(con.AccountId != Null){
                            accidSet.add(con.AccountId);
                        }else{
                            con.addError('Please Enter Account');
                        }
                    }
                    Map<Id,Account> accMap = new Map<Id,Account>
                        ([
                            Select Id,Name From Account Where Id IN : accidSet
                        ]);
                    List<Account> accList = new List<Account>();
                    for(Contact con : conList){
                        Account accObj = accMap.get(con.AccountId);
                        accobj.Name = accobj.Name + con.LastName;
                        accList.add(accObj);
                    }
                    if(!accList.isEmpty()){
                        Update accList;
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        Question-5. Update the above trigger5 to delete the Last Name from the Account field when a Contact is deleted without deleteing the other Last name.        
        Solution.                      */
        /* Trigger */
 /*       trigger ContactTrigger on Contact (before delete) {
            if(Trigger.isBefore && Trigger.isDelete){    UpdateAccountWithContactName.deleteContactUpdateAccountName(Trigger.Old);
            }
        }              */
        
        
        /* Trigger Handler Class */
   /*     public class UpdateAccountWithContactName {
              public static void deleteContactUpdateAccountName(List<Contact> conList){
                try{
                   Set<Id> accidSet = new Set<Id>();
                    for(Contact con : conList){
                        if(con.AccountId != Null){
                            accidSet.add(con.AccountId);
                        }else{
                            con.addError('Please Enter Account');
                        }
                    }
                    Map<Id,Account> accMap = new Map<Id,Account>
                        ([
                            Select Id,Name From Account Where Id IN : accidSet
                        ]);
                    List<Account> accList = new List<Account>();
                    for(Contact con : conList){
                        Account accObj = accMap.get(con.AccountId);
                        accobj.Name = accobj.Name.remove(con.LastName);
                        accList.add(accObj);
                    }
                    if(!accList.isEmpty()){
                        update accList;
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        
        Question-6. On Opportunity to alert the user when an Opportunity is being closed with no Opportunity line items in it
        Solution.                  */
        /* Trigger */
 /*       trigger OpportunityTrigger on Opportunity (before update) {
            if(Trigger.isBefore && Trigger.isUpdate){
           OppClosedWithNoOppLineItemClass.oppClosedWithNoOppLineItemMethod(Trigger.New);
            }
        }                  */
        
        /* Trigger Handler Class */
 /*       public class OppClosedWithNoOppLineItemClass {
            public static void oppClosedWithNoOppLineItemMethod(List<Opportunity> oppList){
                try{
                    if(oppList.size() > 0){
                        for(Opportunity opp : oppList){
                            if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
                                if(!opp.HasOpportunityLineItem){
                                    opp.addError('Not closed this opportunity because they have no Opportunity Line Item');
                                }   
                            }
                        }
                    }else{
                        System.debug('Trigger Give Null List Opportunity Type');
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        Question-7. Create an integer field "No Of Products sold" in Product standard object. Write a Trigger on Opportunity to increment the Product "No of product sold" with each Opportunity lineitem when the opportunity is getting closed Won.
        Solution.                         */
        /* Trigger */
   /*     trigger OpportunityTrigger on Opportunity (before update) {
            if(Trigger.isBefore && Trigger.isUpdate){
                IncrementSoldProdutsClass.incrementSoldProdutsMethod(Trigger.New);
            }
        }                    */
        
        /* Trigger Handler Class */
 /*       public class IncrementSoldProdutsClass {
            public static void incrementSoldProdutsMethod(List<Opportunity> oppList){
                try{
                    if(!oppList.isEmpty()){
                        Map<Id,Decimal> incSoldProMap = new Map<Id,Decimal>();
                        for(OpportunityLineItem oppLine : 
                            [Select Id,OpportunityId,Product2Id,Quantity From OpportunityLineItem
                             Where OpportunityId IN : oppList 
                             AND Opportunity.StageName = 'Closed Won']){
                                 if(!incSoldProMap.containsKey(oppLine.Product2Id)){
                                     incSoldProMap.put(oppLine.Product2Id,0);
                                 }
                                 incSoldProMap.put(oppLine.Product2Id,incSoldProMap.get(oppLine.Product2Id)  + oppLine.Quantity);
                             }
                        List<Product2> proList = new List<Product2>();
                        for(Product2 pro : [Select Id,No_of_Products_Sold__c From Product2 Where Id IN : incSoldProMap.keySet()]){
                            pro.No_of_Products_Sold__c = incSoldProMap.get(pro.Id);
                            proList.add(pro);
                        }
                        if(!proList.isEmpty()){
                            update proList;
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        
        Question-8 .Create a trigger on Opportunity to add all the Contacts having the same Account as Opportunity Account into the Opportunity "Contact Roles"
        Example:- Account: Birla have 3 Contacts: ajay,amar,anuj Then while creating an Opportunity for Birla add ajay,amar & anuj to Opportunity Contact roles--T
        Solution.                       */
        /* Trigger */
   /*     trigger OpportunityTriggeron Opportunity (after insert) {
           if(Trigger.isAfter && Trigger.isInsert){  AddContactRoleRelatedToAccountClass.addContactRoleRelatedToAccountMethod(Trigger.NewMap);
            }
        }              */
        
        /* Trigger Handler Class */
  /*      public class AddContactRoleRelatedToAccountClass {
            public static void addContactRoleRelatedToAccountMethod(List<Opportunity> oppList){
                try{
                    if(!oppList.isEmpty()){
                        for(opportunity opp : oppList){
                            if(opp.AccountId != Null){
                                List<OpportunityContactRole> oppConRoleList = new List<OpportunityContactRole>();
                                for(Contact con : [Select Id From Contact Where AccountId =: opp.AccountId]){
                                    OpportunityContactRole oppConRoleObj = new OpportunityContactRole();
                                    oppConRoleObj.ContactId = con.Id;
                                    oppConRoleObj.OpportunityId = opp.Id;
                                    oppConRoleObj.Role = 'Decision Maker';
                                    oppConRoleList.add(oppConRoleObj);
                                }
                                if(!oppConRoleList.isEmpty()){
                                    insert oppConRoleList;
                                }
                            }else{
                                opp.addError('Please Select Account');
                            }
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        Question-9. On campaign to close all the opportunities associated with the campaign when campaign status is completed. Example:Opportunities having line items in it must be closed won and opportunities having no line item must be closed lost. Send all the details of All associated opportunities.
        Solution.           */
        /* Trigger */
  /*      trigger CompaignTrigger on Campaign (After update) {
            if(Trigger.isAfter && Trigger.isUpdate){    OpportunityClosedWhenCampaignClass.OpportunityClosedWhenCampaignIsComletedMethod(Trigger.New);
            }
        }     */
        
        /* Trigger Handler Class */
 /*       public class OpportunityClosedWhenCampaignClass {
            Public static void OpportunityClosedWhenCampaignIsComletedMethod(List<Campaign> camList){
                try{
                    List<Opportunity> oppList =[Select Id, (SELECT Id FROM OpportunityLineItems) From Opportunity Where CampaignId IN : camList];
                    
                    List<Opportunity> updateOppList = new List<Opportunity>();
                    if(!oppList.isEmpty()){
                        for(Opportunity opp : oppList){
                            if(opp.OpportunityLineItems.size() > 0){
                                Opportunity oppObj = opp;
                                oppObj.StageName = 'Closed Won';
                                updateOppList.add(oppObj);
                            } 
                            else{
                                Opportunity oppObj = opp;
                                oppObj.StageName = 'Closed Lost';
                                updateOppList.add(oppObj);
                            }
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getMessage());
                }
            }  
        }
        
        
        Question-10. Write a code to clone(copy ) 1 Opportunity with all Opportunity line items into a new Opportunity with Closed Date = Old closed date + 30 days & Opportunity name = Opportunity Name+ 'Clone'
        Solution.           */
        /* Trigger */
/*        trigger OpportunityTrigger on Opportunity (before update) {
            if(Trigger.isBefore && Trigger.isUpdate){
                if(!CloneOppWithLineItemClass.flag){
                    CloneOppWithLineItemClass.flag = true;
                    CloneOppWithLineItemClass.cloneOppWithLineItemMethod(Trigger.New);
                }
            }
        }                     */
        
        /*Trigger Handler Class */
  /*      public class CloneOppWithLineItemClass {
            public static Boolean flag = false;
            public static void cloneOppWithLineItemMethod(List<Opportunity> oppList){
         try{
                    if(!oppList.isEmpty()){
                        List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>
                            ([
                                Select Id,OpportunityId,Quantity,PricebookEntryId,Opportunity.Name,Opportunity.StageName,Opportunity.CloseDate From OpportunityLineItem Where Opportunity.StageName = 'Closed Won' AND OpportunityId IN : oppList
                            ]);
                        Map<Id,Opportunity> cloneOppMap = new Map<Id,Opportunity>();
                        for(OpportunityLineItem oppLine : oppLineList){                
                            if(!cloneOppMap.containsKey(oppLine.OpportunityId)){
                                cloneOppMap.put(oppLine.OpportunityId,new Opportunity(Name = oppLine.Opportunity.Name + ' Clone', CloseDate = oppLine.Opportunity.CloseDate + 30, StageName = oppLine.Opportunity.StageName));
                            }
                        }
                        if(!cloneOppMap.isEmpty()){
                            insert cloneOppMap.Values();
                        }
                        List<OpportunityLineItem> cloneOppLineList = new List<OpportunityLineItem>();
                        for(OpportunityLineItem oppLine : oppLineList){
                            OpportunityLineItem oppLineObj = new OpportunityLineItem();
                            oppLineObj.OpportunityId = cloneOppMap.get(oppLine.OpportunityId).Id;
                            oppLineObj.PricebookEntryId = oppLine.PricebookEntryId;
                            oppLineObj.Quantity = oppLine.Quantity;
                            oppLineObj.TotalPrice = 100;
                            cloneOppLineList.add(oppLineObj);
                        }
                        if(!cloneOppLineList.isEmpty()){
                            insert cloneOppLineList;
                        } 
                    }
                    
                }catch(Exception e){
                    System.debug('Exception is ' + e.getMessage());
                }
        
            }
        }                                
        
        
        Question-11. Write a triger to stop creating opportuniyLineItem when opportunity have already more then 2 LineItem, If Opportuniy dose not have more then 2 line item then Quantity fields must have number of contact of the same Account.
        Solution.               */
        /* Trigger */
   /*     trigger OpportunityTrigger on Opportunity (after insert) {
          if(Trigger.isAfter && Trigger.isUpdate){   
        OppTriggerStopForLineItemClass.oppTriggerStopForLineItemMethod(Trigger.New);
            }
        }
                  */
        /* Trigger Handler Class */
 /*       public class OppTriggerStopForLineItemClass {
            public static void oppTriggerStopForLineItemMethod(List<Opportunity> oppList){
                try{
                    if(!oppList.isEmpty()){
                        List<Opportunity> newOppList = new List<Opportunity>
                            ([
                                Select Id,AccountId, (Select Id,Quantity From OpportunityLineItems) From Opportunity Where Id IN : oppList
                            ]);
                        List<Id> idList = new List<ID>();
                        for(Opportunity opp : newOppList){
                            if(opp.OpportunityLineItems.Size() <= 2){
                                idList.add(opp.AccountId);
                            }else{
                                opp.addError('You do not create more opportunityLineItems....');
                            }
                        }
                        Map<Id,Account> accMap = new map<Id,Account>([Select Id, (Select Id From Contacts) From Account Where Id IN : idList]);
                        List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
                        for(Opportunity opp : newOppList){
                            if(opp.OpportunityLineItems.size() == 1){
                                OpportunityLineItem oppLine = opp.OpportunityLineItems.get(0);
                                oppLine.Quantity = accMap.get(opp.AccountId).contacts.size();
                                oppLineItemList.add(oppLine);
                            }else{
                                OpportunityLineItem oppLine = opp.OpportunityLineItems.get(0);
                                oppLine.Quantity = accMap.get(opp.AccountId).contacts.size();
                                oppLineItemList.add(oppLine);
                                OpportunityLineItem oppLine1 = opp.OpportunityLineItems.get(1);
                                oppLine1.Quantity = accMap.get(opp.AccountId).contacts.size();
                                oppLineItemList.add(oppLine1);
                            }                    
                        }
                        if(!oppLineItemList.isEmpty()){
                            update oppLineItemList;
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        
        
        Question-12. Create custom fields
         - On Account object 'Total Amount' and 'Remaining Amount'.
         - On Opportunity 'Amount'.
        Write a Trigger on Opportunity update to auto-populate Remaining Amount (Total Amount - Amount) where opportunity stage = 'Closed Won'.
        Solution.                 */
        /* Trigger */
  /*      trigger OpportunityTrigger on Opportunity (after insert) {
            if(Trigger.isAfter && Trigger.isInsert){
                CalRemainingAmountClass.calRemainingAmountMethod(Trigger.New);
            }
        }        */
        
        /* Trigger Handler Class */
   /*     public class CalRemainingAmountClass {
            public static void calRemainingAmountMethod(List<Opportunity> oppList){
                try{
                    if(!oppList.isEmpty()){
                        List<Id> accIds = new List<Id>();
                        List<Opportunity> newOppList = new List<Opportunity>();
                        for(Opportunity opp : oppList){
                            if(opp.StageName == 'Closed Won' && opp.Amount != Null && opp.AccountId != Null){
                                accIds.add(opp.AccountId);
                                newOppList.add(opp);
                            }else{
                                System.debug('Please Select Closed Won Stage OR Please Enter Amount OR Please Select Account' + opp.Id);
                                opp.addError('Please Select Closed Won Stage OR Please Enter Amount OR Please Select Account' +opp.Id);
                            }
                        }
                        if(!accIds.isEmpty()){
                            System.debug(accIds);
                        }
                        
                        List<Account> accList = new List<Account>([Select Total_Amount__c,Remaining_Amount__c From Account Where Id IN : accIds]);
                        List<Account> newAccList = new List<Account>();
                        for(Account acc : accList){
                            for(Opportunity opp : newOppList){
                                acc.Remaining_Amount__c = acc.Total_Amount__c - opp.Amount;
                                newAccList.add(acc);
                            }
                        }
                        if(!newAccList.isEmpty()){
                            update newAccList;
                        }
                    }
                }catch(Exception e){
                    System.debug('Exception is ' + e.getCause());
                }
            }
        }
        
        Question-13. Create three custom objects:
        1. Doctor.(Fields{Name,Specialization})
        2. Patient.(Fields{Name,Problem})
        3. Appointment.(Fields{DoctorName,PatientName,AppointmentDate,Description}) .
        WAT to restrict a doc to have more than 8 visit request in a day and restrict a patient to visit the
        same doc in a day twice."
        Solution.               */
        /* Trigger */
        
        
        /* Trigger Handler */
        
        
        
        
        
        }