public class PracticeQuestion2 {
        
 /*           Question 1 :Create custom field -Number of Contacts on Account(Number)
        Write a script to find the number of contacts which are related to same emailId using Map and when we change emailId then number of contacts also change.
        Solution.
        
        public class FindContactOnAccount {
            public static void findNumOfContactWithSameEmail(){
                try{
                    Map<Id,Account> accMap = new Map<Id,Account>([SELECT id,(SELECT id, Email FROM Contacts WHERE Email != null) FROM Account]);
                    A
                    List<Account> accList = new List<Account>();
                    if(!accMap.isEmpty()){
                        for(Account acc : accMap.values()){
                            if(acc.Contacts.size() > 0){
                                Map<String,Integer> checkEmailMap = new Map<String,Integer>();
                                for(Contact con : acc.Contacts){
                                    if(!checkEmailMap.containsKey(con.Email)){
                                        checkEmailMap.put(con.Email,0);
                                    }
                                    else{
                                        checkEmailMap.put(con.Email,(checkEmailMap.get(con.Email) + 1));
                                    }
                                }
                                List<Integer> emailRepatationList = checkEmailMap.values();
                                emailRepatationList.sort();
                                acc.Number_Of_Contacts__c = (emailRepatationList.get((emailRepatationList.size()-1))+1);
                                accList.add(acc);
                            }
                        }
                    }
                    
                    if(!accList.isEmpty()){
                        update accList;
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
    Question 2 :"Create a custom object ""Actors"" having lookup with Account name
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
        }
        
        Question 3 :Create custom fields
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
            public static void enableMatchRecords(List<Opportunity> newOppList){
                try{
                    List<Opportunity> oldOppList = [SELECT Name, (SELECT Record__c FROM OpportunityLineItems WHERE Record__c != null) FROM Opportunity WHERE Id IN : newOppList];
                    List<Opportunity> oppUpdateList = new List<Opportunity>();
                    System.debug('Opp List '+oldOppList);
                    
                    if(!oldOppList.isEmpty()){
                        for(Opportunity opp : oldOppList){
                            if(opp.OpportunityLineItems.size() > 0){
                                for(OpportunityLineItem oppLine : opp.OpportunityLineItems){
                                    if(opp.Name.equals(oppLine.Record__c)){
                                        opp.Matching_Record__c = true;
                                        oppUpdateList.add(opp);
                                        break;
                                    } 
                                }
                            }
                        }
                    }
                    System.debug('Opp List : '+oppUpdateList);
                    if(!oppUpdateList.isEmpty()){
                        update oppUpdateList;
                    }
                }
                catch(Exception ex){
                    System.debug('Exception '+ex.getMessage());
                }
            } 
        }                                  */
        
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
        }
        
        
        Question 5: Create custom fields
        - TotalMoney(currency) on Order
        - Money(currency) on OrderItem
        Write a script to create orderItems for order with the help of custom pricebook and count the money and put into TotalMoney.
        Solution 
        public class CreateOrderItemOnOrder {
            public static void createOrderItem(){
                try{
                    List<Order> orderList = [SELECT id, Pricebook2Id, (SELECT id FROM OrderItems) FROM Order];
                    Set<Id> priceBookIdSet = new Set<Id>();
                    
                    if(!orderList.isEmpty()){
                        for(Order ord : orderList){
                            priceBookIdSet.add(ord.Pricebook2Id); 
                        } 
                    }
                    
                    List<OrderItem> orderItemList = new List<OrderItem>();
                    if(!priceBookIdSet.isEmpty()){
                        List<PricebookEntry> priceBookEntryList = [SELECT Id, UnitPrice FROM PricebookEntry WHERE Pricebook2Id IN: priceBookIdSet];
                        for(Order ord : orderList){
                            if(ord.OrderItems.size() <= 0){
                                for(PricebookEntry pbe : priceBookEntryList){
                                    OrderItem ordItem = new OrderItem();
                                    ordItem.OrderId = ord.Id;
                                    ordItem.UnitPrice = pbe.UnitPrice;
                                    ordItem.Quantity = 1;
                                    ordItem.PricebookEntryId = pbe.Id;
                                    ordItem.Money__c = 200;
                                    orderItemList.add(ordItem);
                                } 
                            }
                        }
                    }
                    if(!orderItemList.isEmpty()){
                         insert orderItemList;  
                    }
                    
                    List<OrderItem> ordItemList = [SELECT OrderId, Money__c FROM OrderItem WHERE OrderId IN: OrderList];
                    List<Order> updateOrderList = new List<Order>();
                    if(!ordItemList.isEmpty()){
                        for(Order ord : orderList){
                            Integer totalMoney = 0;
                            for(OrderItem ordItem : ordItemList){
                                if(ord.Id.equals(ordItem.OrderId)){
                                    totalMoney += Integer.valueOf(ordItem.Money__c);
                                }
                            }
                            ord.TotalMoney__c = totalMoney;
                            updateOrderList.add(ord);
                        }
                    }
                    
                    if(!updateOrderList.isEmpty()){
                        update updateOrderList;
                    }
                }    
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 6: "Create a Multi picklist field ""Rate"" [Values as 1 star, 2 stars, 3 stars, 4 stars, 5 stars] on Product2 and same Multi picklist field ""Rate"" on Opportunitylineitem with the same value. Write a script to get all the Products which got less than 3 ratings in opportunity line items but the Product rate for those was 5 star."
        
        public class FindFiveStarsProductInOppLineItem {
            public static void findFiveStarsProduct(){
                try{
                    List<OpportunityLineItem> oppLineItemList = [SELECT id, Rate__c, Product2.Name,Product2.Rate__c FROM OpportunityLineItem WHERE Rate__c != null];
                    if(!oppLineItemList.isEmpty()){
                        String productName = '';
                        for(OpportunityLineItem oppLineItem : oppLineItemList){
                            List<String> starsList = oppLineItem.Rate__c.split(';');
                            List<String> proStarsList = oppLineItem.Product2.Rate__c.split(';');
                            
                            if(starsList.contains('1 stars') || starsList.contains('2 stars')){
                                productName = productName+oppLineItem.Product2.Name+', ';
                            }         
                            
                            if(!proStarsList.contains('5 stars')){
                                productName = productName.remove(oppLineItem.Product2.Name);
                            }
                        }
                        
                        System.debug('Product Name.: '+productName);
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 7 : Write a trigger on OpportunityLineItem when we insertd opportunitylineitem then contact with name as product name and contactRole with the same contact also created.
        
        /*Trigger*/
 /*       trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert) {
            if(Trigger.isAfter && Trigger.isInsert){
                CreateContactUsingProductName.createContactUsingProductNameInOppLineItem(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/
 /*       public class CreateContactUsingProductName {
            public static void createContactUsingProductNameInOppLineItem(List<OpportunityLineItem> oppLineList){
                try{
                    List<OpportunityLineItem> oppLineItemList = [SELECT Id,Opportunity.Name, OpportunityLineItem.Opportunity.AccountId, Product2.Name FROM OpportunityLineItem WHERE Id IN:oppLineList];
                    Map<id,List<Contact>> oppConMap = new Map<id,List<Contact>>();
                  
                    if(!oppLineItemList.isEmpty()){
                        for(OpportunityLineItem oppItem : oppLineItemList){
                            Contact con = new Contact();
                            con.FirstName = 'Product - ';
                            con.LastName = oppItem.Product2.Name;
                            con.AccountId = oppItem.Opportunity.AccountId;
                            if(!oppConMap.containsKey(oppItem.OpportunityId)){
                                oppConMap.put(oppItem.OpportunityId,new List<Contact>());
                            }
                            oppConMap.get(oppItem.OpportunityId).add(con);
                        }
                        
                        List<Contact> conList = new List<Contact>();
                        for(List<Contact> accConList : oppConMap.values()){
                            conList.addAll(accConList); 
                        }
                        
                        if(!conList.isEmpty()){
                           insert conList; 
                        }
                        
                        List<OpportunityContactRole> oppConList = new List<OpportunityContactRole>();
                        for(Id oppId : oppConMap.keySet()){
                            for(Contact con : oppConMap.get(oppId)){
                                OpportunityContactRole oppConRole = new OpportunityContactRole();
                                oppConRole.OpportunityId = oppId;
                                oppConRole.ContactId = con.Id;
                                oppConList.add(oppConRole);
                            }
                        }
                        
                        if(!oppConList.isEmpty()){
                            insert oppConList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 8: Create custom fields
        - On Account object 'Total Amount' and 'Remaining Amount'.
        - On Opportunity 'Amount'.
        
        Write a Trigger on Opportunity update to auto-populate Remaining Amount (Total Amount - Amount) where opportunity stage = 'Closed Won'.
        
        /*Trigger*/
  /*      trigger OpportunityTrigger on Opportunity (before insert, after insert) {
                
            if(Trigger.isInsert){
                UpdateRemainingAmountOnAcconut.updateRemainingAmount(Trigger.newMap);  
            }
        }
        
        /*Trigger Handler Class*/
  /*      public class UpdateRemainingAmountOnAcconut {
            public static void updateRemainingAmount(Map<Id,Opportunity> oppMap){ 
                try{
                    List<Opportunity> oppList = [SELECT Name, Amount, Account.Total_Amount__c, Account.Remaining_Amount__c FROM
                                                 Opportunity WHERE StageName = 'Closed Won' AND Id IN:oppMap.keyset()];
                    
                    List<Account> accList = new List<Account>();
                    for(Opportunity opp : oppList){
                        Account acc = opp.Account.clone(true,false,false,false);
                        if(acc.Total_Amount__c > opp.Amount){
                            acc.Remaining_Amount__c = (acc.Total_Amount__c - opp.Amount);
                            accList.add(acc);
                        }
                    }
                    
                    if(!accList.isEmpty()){
                        update accList;
                    }
                }
                catch(Exception ex){
                    System.debug('Exception cause :-> '+ex.getCause());
                }
            }
        }
        
        Question 9: Create 4 custom fileds in Opportunity "1: Sum of TotalPrice" , " 2: sum of UnitPrice", "3: Maximum Quantity", "4: minimum Quantity" .
        Write a script to calculate total price, TOtal unit, maximum Quantity, and minimum Quantity of the opportuniyLineItem ,
        and store the values in Every opportunity custom fields.
        Solution;
        public class FindTotalPriceTotalUnitORQuantityOnOpp {
            public static void findTotalPriceUnitPriceOrQuantityOppLineItem(){
                try{
                    List<Opportunity> oppList = [SELECT Sum_Of_TotalPrice__c, Sum_Of_UnitPrice__c, Maximum_Quantity__c, Minimum_Quantity__c, 
                                                 (SELECT TotalPrice, Unitprice, Quantity FROM OpportunityLineItems) FROM Opportunity];
                    List<Opportunity> udateOppList = new List<Opportunity>();
                    if(!oppList.isEmpty()){
                        for(Opportunity opp : oppList){
                            if(opp.OpportunityLineItems.size() > 0){
                                List<Double> quantityList = new List<Double>();
                                Double totalPrice = 0.0;
                                Double totalUnitPrice = 0.0;
                                for(OpportunityLineItem oppLineItem : opp.OpportunityLineItems){
                                    quantityList.add(oppLineItem.Quantity);
                                    totalPrice = totalprice + oppLineItem.TotalPrice;
                                    totalUnitPrice += oppLineItem.UnitPrice;
                                }
                                
                                opp.Sum_Of_TotalPrice__c = totalPrice;
                                opp.Sum_Of_UnitPrice__c = totalUnitPrice;
                                quantityList.sort();
                                opp.Maximum_Quantity__c = quantityList.get(quantityList.size()-1);
                                opp.Minimum_Quantity__c = quantityList.get(0);
                                udateOppList.add(opp);
                            }
                        }
                        
                        if(!udateOppList.isEmpty()){
                            update udateOppList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        
        Question 10: "Create an Object ""QuickLinks"" and ""Help"" both having the following fields. 1. Account Lookup ""Account"" 2. Contact Lookup ""Contact"" 3. Company Name as Text field 4. URL field as URL. Write a Script to copy all Quick link URLs on Help only for Accounts which are having exactly one Help and one Quick links in its related list ."
        Solution:
        public class CopyQuickLinksDetailsToHelp {
            public static void copyQuickLinksDetailsToHelps(){
                try{
                    Map<Id,Account> accQuickLinksList = new Map<Id,Account>([SELECT id, (SELECT URL__c FROM QuickLinks__r) FROM Account]);
                    Map<Id,Account> accHelpsList = new Map<Id,Account>([SELECT id, (SELECT URL__c FROM Helps__r) FROM Account]);
                    List<Help__c> helpList = new List<Help__c>();
                    
                    if(!accQuickLinksList.isEmpty() && !accHelpsList.isEmpty()){
                        for(Id accId : accQuickLinksList.keySet()){
                            if((accQuickLinksList.get(accId).QuickLinks__r.size() == 1 && accHelpsList.get(accId).Helps__r.size() == 1)){
                                Help__c help = accHelpsList.get(accId).Helps__r.get(0);
                                help.URL__c = accQuickLinksList.get(accId).QuickLinks__r.get(0).URL__c;
                                helpList.add(help);
                            }
                        }
        
                        if(!helpList.isEmpty()){
                            update helpList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 11 :create a custom Single picklist field named (working_in)={'india', 'china', 'usa', 'brazil'} in account.
        write a trigger to stop creating or updating opportunities with account having "working_in" = "india" and
        already 2 closed won opportunity under same account.
        
        /*Trigger*/
 /*       trigger OpportunityTrigger on Opportunity (Before insert, Before update) {   
           if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){   
                PreventOppInAccount.preventToCreateOpportunityInAccount(Trigger.new);  
            }
        }
        
        /*Trigger Handler Class*/
        
        
        
        
        
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
        }
        
   Question 13 : Get Total Amount of only those Opportunity whose Opportunity's close date falls in next 30 days
                     and OpportunityLineItem quantity is more than 50.
        
        public class FindOpportunityAmount {
            public static void findOpportunityAmount(){
                try{
                    List<OpportunityLineItem> oppLineItemList = [Select Id,Quantity,Opportunity.Name,Opportunity.CloseDate,Opportunity.Amount From OpportunityLineitem Where OpportunityId != Null AND (Opportunity.CloseDate > : Date.today() AND Opportunity.CloseDate < : Date.today() + 30) AND Quantity > 50];
                    
                    Set<String> oppLineItemSet = new Set<String>();
                    for(OpportunityLineItem oppLineItem : oppLineItemList){
                        oppLineItemSet.add(oppLineItem.Opportunity.Name+' : '+oppLineItem.Opportunity.Amount);
                    }
                    
                    for(String oppItem : oppLineItemSet){
                        System.debug(oppItem);
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 14 :"Create a Custom Object Order_locoation.__c Create 3 fields in Order_locoation__c.
        1. Total Distance(Integers)
        2. Travel Location(A,B,C,D,E,F) single picklist.
        3. Account Lookup.
        5. Created a custom field in account Location single picklist type(A,B,C,D,E,F).
        6. criteria Distance b/w location as follows:
        A to B- 10km
        B to C- 20km
        C to D- 38 km
        D to E- 83 km
        E to F- 73 km
        Write a script to update the the total distance fields of Order_locoation__c with distance b/w travel Location and account Location if and only if account having location A or F."
        
        
        
        Question 15 : Create a Custom fields in Account named "Associated_Contacts__c". Updates "Associated_Contacts__c" with the number of contacts associated with the account .
        Whenever new contact creates/removed from the account ,The respective count would be increased/Decreased accordingly.
        
        /*Trigger*/
  /*      trigger ContactTrigger on Contact (Before insert, Before delete) {
            if(Trigger.IsBefore && Trigger.isDelete){
                UpdateAssociateContactsInAccount.deleteAssociateContactsInAccount(Trigger.Old);
            }
            else if(Trigger.isBefore && Trigger.isInsert){
                UpdateAssociateContactsInAccount.updateAssociateContactsInAccount(Trigger.new);
            }	
        }
        
        /*Trigger Handler Class*/
  /*      public class UpdateAssociateContactsInAccount {
            public static void updateAssociateContactsInAccount(List<Contact> conList){
                try{
                    Set<Id> accIdSet = new Set<Id>();
                    for(Contact con : conList){
                        accIdSet.add(con.AccountId);
                    }
                    
                    if(!accIdSet.isEmpty()){
                        List<Contact> allConList = [SELECT id, AccountId FROM Contact WHERE AccountId IN : accIdSet  AND AccountId !=null];
                        Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                        if(!conList.isEmpty()){
                            for(Contact con : allConList){
                                if(!conMap.containsKey(con.AccountId)){
                                    conMap.put(con.AccountId, new List<Contact>());
                                }
                                conMap.get(con.AccountId).add(con);
                                conMap.put(con.AccountId, conMap.get(con.AccountId));
                            }
                        }
                        
                        List<Account> updateAccList = new List<Account>();
                        if(!conMap.isEmpty()){
                            List<Account> accList = [SELECT Associated_Contacts__c FROM Account WHERE Id IN : conMap.keySet()];
                            for(Account acc : accList){
                               acc.Associated_Contacts__c = conMap.get(acc.Id).size()+1;
                               updateAccList.add(acc);
                            }
                        }
                        
                        if(!updateAccList.isEmpty()){
                            update updateAccList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
            
            public static void deleteAssociateContactsInAccount(List<Contact> conList){
                try{
                    Set<Id> accIdSet = new Set<Id>();
                    for(Contact con : conList){
                        accIdSet.add(con.AccountId);
                    }
                    
                    if(!accIdSet.isEmpty()){
                        List<Contact> allConList = [SELECT id, AccountId FROM Contact WHERE AccountId IN : accIdSet  AND AccountId !=null];
                        Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                        if(!conList.isEmpty()){
                            for(Contact con : allConList){
                                if(!conMap.containsKey(con.AccountId)){
                                    conMap.put(con.AccountId, new List<Contact>());
                                }
                                conMap.get(con.AccountId).add(con);
                                conMap.put(con.AccountId, conMap.get(con.AccountId));
                            }
                        }
                        
                        List<Account> updateAccList = new List<Account>();
                        if(!conMap.isEmpty()){
                            List<Account> accList = [SELECT Associated_Contacts__c FROM Account WHERE Id IN : conMap.keySet()];
                            for(Account acc : accList){
                               acc.Associated_Contacts__c = conMap.get(acc.Id).size()-1;
                               updateAccList.add(acc);
                            }
                        }
                        
                        if(!updateAccList.isEmpty()){
                            update updateAccList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        
        Question 16: Write a trigger on Account that whenever an Account is created an contact and task should be created and relate account as well as contact with task.
        
        /* Trigger */
  /*      trigger AccountTrigger on Account (after insert,after update) {
            if(Trigger.isAfter && Trigger.isInsert){
                AccountHandler.createContactWithTask(Trigger.New);
             }
        }
        
        /*Trigger Handler Class*/
 /*       public class CreateTaskWithAccountAndContact {
            public static void createTaskWithAccountAndContact(List<Account> accList){
                try{
                    if(!accList.isEmpty()){
                        Map<Id,Contact> newConMap = new Map<Id,Contact>();
                        for(Account acc : accList){
                            Contact con = new Contact();
                            con.AccountId = acc.Id;
                            con.LastName = 'Contact of ' + acc.Name;
                            newConMap.put(acc.Id,con);
                        }
                        if(!newConMap.isEmpty()){
                            insert newConMap.values();
                        }
                        
                        List<Task> taskList = new List<Task>();
                        for(Id accId : newConMap.keySet()){
                            Task conAccTask = new Task();
                            conAccTask.WhatId = accId;
                            conAccTask.WhoId = newConMap.get(accId).Id;
                            conAccTask.Status = 'Completed';
                            conAccTask.Priority = 'High';
                            conAccTask.Subject = 'Task of ' + newConMap.get(accId).LastName;
                            taskList.add(conAccTask);
                        }
                        
                        if(!taskList.isEmpty()){
                            insert taskList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        Question 17 : create a checkbox field on contact "copy address to contact". Write a script to find all the contact
        with this field as true and copy the billing address from account in its related contact in which the
        field is true.
        
        Solution.
        public class CopyAccountAddressToContact {
            public static void copyAccountAddressToContact(){
                try{
                    List<Contact> conList = [SELECT AccountId, MailingCity, MailingState, MailingCountry, MailingPostalCode,MailingStreet FROM Contact WHERE AccountId != null AND Copy_Address_To_Contact__c = true];
                    Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                    if(!conList.isEmpty()){
                        for(Contact con : conList){
                            if(!conMap.containsKey(con.AccountId)){
                                conMap.put(con.AccountId, new List<Contact>());
                            }
                            conMap.get(con.AccountId).add(con);
                            conMap.put(con.AccountId,conMap.get(con.AccountId));
                        }
                        
                        if(!conMap.isEmpty()){
                            List<Account> accList = [SELECT BillingCity, BillingCountry, BillingPostalCode, BillingState,BillingStreet FROM Account WHERE Id IN : conMap.keySet()];
                            List<Contact> updateConList = new List<Contact>();
                            
                            for(Account acc : accList){
                                for(Contact con : conMap.get(acc.Id)){
                                    con.MailingCity = acc.BillingCity;
                                    con.MailingCountry  = acc.BillingCountry;
                                    con.MailingPostalCode = acc.BillingPostalCode;
                                    con.MailingState = acc.BillingState;
                                    con.MailingStreet = acc.BillingStreet;
                                    updateConList.add(con);
                                }
                            }
                            
                            if(!updateConList.isEmpty()){
                                update updateConList;
                            }
                        } 
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 18 : "Find atleast 5 Account from your ORG having highest number of Contacts and It should be displayed in ascending order.Create a map to store number of contacts in key and list of associated contacts in value.If two Accounts having the same number of Contacts then it should display only one Account among them(Accounts having same no. of Contacts)."
        
        public class FindFiveHighestContactOfAccount {
            public static void fiveHighestContactOfAccount(){
                try{
                    List<Account> accList = [SELECT Name, (SELECT id FROM Contacts) FROM Account];
                    Map<Integer,String> conMap = new Map<Integer,String>();
                    if(!accList.isEmpty()){
                        for(Account acc : accList){
                            if(acc.Contacts.size() > 0){
                                if(!conMap.containsKey(acc.Contacts.size())){
                                    conMap.put(acc.Contacts.size(),acc.Name);
                                }
                            }
                        }
                        
                        List<Integer> conNumList = new List<Integer>(conMap.keySet());
                        conNumList.sort();
                        
                        System.debug('conmap : '+conNumList.size());

                        if(conNumList.size() >= 5){
                            for(Integer i = (conNumList.size() - 5); i < conNumList.size(); i++){
                                System.debug('Account Name : '+conMap.get(conNumList.get(i))+' Number of contacts. '+conNumList.get(i));
                            }
                        }
                        else{
                            for(Integer i = 0; i < conNumList.size(); i++){
                                System.debug('Account Name : '+conMap.get(conNumList.get(i))+' Number of contacts. '+conNumList.get(i));
                            }
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 19 : Make two number fields on contact object
        Amount_X
        Amount_Y
        
        2) Make one picklist field "Type" , values ('Positive', 'Negative') on Account Object
        
        3) Make two number fields on account
        Rollup_Amount_X
        Rollup_Amount_Y
        Rollup_Amount
        
        4) Make one trigger on contact object, which will do following:
        --> Sum all child of contact's field "Amount_X" and store in parent account's "Rollup_Amount_X" Where Type is "Positive"
        --> Sum all child of contact's field "Amount_Y" and store in parent account's "Rollup_Amount_Y" Where Type is "Negative"
        --> Sum all child of contact's field "Amount_X" + "Amount_Y" and store in parent account's "Rollup_Amount"
        
        /* Trigger */ 
 /*       trigger ContactTrigger on Contact (Before insert, Before update) {
            if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
                CalculateRollupAmountInAccount.calculateRollupAmountInAccount(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/ 
  /*      public class CalculateRollupAmountInAccount {
            public static void calculateRollupAmountInAccount(List<Contact> conList){
                try{
                    Set<Id> accIdSet = new Set<Id>();
                    for(Contact con : conList){
                        accIdSet.add(con.AccountId); 
                    }
                    
                    if(!accIdSet.isEmpty()){
                        List<Contact> conAccList = [SELECT id, AccountId,Amount_x__c, Amount_y__c FROM Contact WHERE AccountId IN:accIdSet AND AccountId != null];
                        
                        Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                        for(Contact con : conAccList){
                            if(!conMap.containsKey(con.AccountId)){
                                conMap.put(con.AccountId, new List<Contact>());
                            }
                            conMap.get(con.AccountId).add(con);
                            conMap.put(con.AccountId,conMap.get(con.AccountId));
                        }
                        
                        List<Account> updateAccList = new List<Account>();
                        if(!conMap.isEmpty()){
                            List<Account> accList = [SELECT id, Type__c, Rollup_Amount_x__c, Rollup_Amount_y__c, Rollup_Amount__c FROM Account WHERE id IN:conMap.keySet()];
                            for(Account acc : accList){
                                Double Amount_X = 0.0;
                                Double Amount_Y = 0.0;
                                
                                for(Contact con : conMap.get(acc.Id)){
                                    if(acc.Type__c.equals('Positive')){
                                        Amount_X += con.Amount_x__c;
                                    }
                                    else{
                                        Amount_Y += con.Amount_y__c;
                                    }
                                }
                                acc.Rollup_Amount_x__c = Amount_X;
                                acc.Rollup_Amount_y__c = Amount_Y;
                                acc.Rollup_Amount__c = (Amount_X + Amount_Y);
                                updateAccList.add(acc);
                            }
                        }
                        
                        if(!updateAccList.isEmpty()){
                            update updateAccList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 20 :write trigger, if opportunity stage name update then its account related contact
        lastname should also update as same opportunity stage name.
        
        /* Trigger */ 
            
  /*      trigger OpportunityTrigger on Opportunity (After update, Before insert, Before update) {    
            if(Trigger.isAfter && Trigger.isUpdate){
                UpdateContactLastNameInAccount.updateContactLastNameInAccount(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/ 
            
   /*     public class UpdateContactLastNameInAccount {
            public static void updateContactLastNameInAccount(List<Opportunity> oppList){
                try{
                    Set<Id> accIdSet = new Set<Id>();
                    for(Opportunity opp : oppList){
                        accIdSet.add(opp.AccountId);
                    }
                    
                    if(!accIdSet.isEmpty()){
                        List<Contact> conList = [SELECT AccountId, LastName FROM Contact WHERE AccountId IN:accIdSet];
                        Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                        for(Contact con : conList){
                            if(!conMap.containsKey(con.AccountId)){
                                conMap.put(con.AccountId, new List<Contact>());
                            }
                            conMap.get(con.AccountId).add(con);
                            conMap.put(con.AccountId,conMap.get(con.AccountId));
                        }
                        
                        List<Contact> updateConList = new List<Contact>();
                        if(!conMap.isEmpty()){
                            for(Opportunity opp : oppList){
                                for(Contact con : conMap.get(opp.AccountId)){
                                    con.LastName = opp.StageName;
                                    updateConList.add(con);
                                }
                            }
                            
                            if(!updateConList.isEmpty()){
                                update updateConList;
                            }
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 21: When ever account is created with ownership ( Single PickList ) as public then create a contact for account,contact lastname as account name and contact phone as account phone
        
        /* Trigger */
 /*       trigger AccountTrigger on Account (After insert, After update, Before insert, Before update) {     
            if(Trigger.isAfter && Trigger.isInsert){   
                CreateAccountWithOwnerShip.createAccountWithOwnerShip(Trigger.new);   
            }    
        }
        
        /*Trigger Handler Class*/
 /*       public class CreateAccountWithOwnerShip {
            public static void createAccountWithOwnerShip(List<Account> accList){
                List<Contact> conList = new List<Contact>();
                for(Account acc : accList){
                    if(acc.OwnerShip__c.equals('Public')){
                        Contact con = new Contact();
                        con.AccountId = acc.Id;
                        con.LastName = acc.Name;
                        conList.add(con);
                    }
                }
                
                if(!conList.isEmpty()){
                    insert conList;
                }
            } 
        }
        
        
        Question 23 : "create a custom object 'Trello', and create lookupfield with contact onit.
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
        }
        
        
        Question 24 :In Account Object create a Multi picklist ""Working in (A, B, C, D)"" Multi picklist.
        Write a script to get the total Quantity of Products sold in only Accounts working in B." 
        
        
        public class GetSoldProductWorkingInB {
            public static void getSoldProductWorkingInB(){
                try{
                    List<OpportunityLineItem> oppLineItem = [SELECT id, Quantity, OpportunityLineItem.Opportunity.Account.Name,OpportunityLineItem.Opportunity.Account.Working_In__c FROM OpportunityLineItem];
                    Integer totalSoldProduct = 0;
                    for(OpportunityLineItem oppLine : oppLineItem){
                        if(oppLine.Opportunity.Account.Working_In__c != null){
                            List<String> workingList = oppLine.Opportunity.Account.Working_In__c.split(';');
                            if(workingList.contains('B')){
                                totalSoldProduct += (Integer)oppLine.Quantity;
                            }
                        }
                    }
                    System.debug('Total sold product : '+totalSoldProduct);
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        Question 25 :Create one contact related to each of those account, who have more than 2
        lineitem in their opportunity. and contact lastname should be opportunity
        stage name.
        
        public class CreateContactInAccount {
            public static void createContactInAccount(){
                try{
                    List<OpportunityLineItem> oppLineItemList = [SELECT Opportunity.AccountId, Opportunity.StageName FROM OpportunityLineItem];
                    if(!oppLineItemList.isEmpty()){
                        Map<Id,List<OpportunityLineItem>> oppLineItemMap = new Map<Id, List<OpportunityLineItem>>();   
                        Map<Id,String> accMap = new Map<id,String>();
                        
                        for(OpportunityLineItem oppLineItem : oppLineItemList){
                            if(!oppLineItemMap.containsKey(oppLineItem.Opportunity.AccountId)){
                                oppLineItemMap.put(oppLineItem.Opportunity.AccountId, new List<OpportunityLineItem>());
                            }
                            oppLineItemMap.get(oppLineItem.Opportunity.AccountId).add(oppLineItem);
                            oppLineItemMap.put(oppLineItem.Opportunity.AccountId, oppLineItemMap.get(oppLineItem.Opportunity.AccountId));
                            
                            if(oppLineItemMap.get(oppLineItem.Opportunity.AccountId).size() > 2){
                                accMap.put(oppLineItem.Opportunity.AccountId,oppLineItem.Opportunity.StageName);
                            }
                        }
                        
                        List<Contact> conList = new List<Contact>();
                        if(!oppLineItemMap.isEmpty() && !accMap.isEmpty()){
                            for(Id accId : oppLineItemMap.keySet()){
                                if(oppLineItemMap.get(accid).size() > 2){
                                    Contact con = new Contact();
                                    con.FirstName = 'First - ';
                                    con.LastName = accMap.get(accId);
                                    con.AccountId = accId;
                                    conList.add(con);
                                }
                            }
                        }
                        if(!conList.isEmpty()){
                            insert conList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        Question 26: Write a trigger to insert or update account. when account updated , Opportunities must be created count the opportunity from NumberOfEmployees
        fields from account NumberOfEmployees.
        Example=: if updated account and opportunities are more then NumberOfEmployees then opportunity must be deleted and if opportunity is less then NumberOfEmployees
        the opportunity must be inserted .
        
        /* Trigger */
  /*      trigger AccountTrigger on Account (After insert, After update, Before insert, Before update) {     
            if(Trigger.isAfter && Trigger.isInsert){
                BalanceTheOpportunityInAccount.insertNumberOfEmployessOpportunity(Trigger.new);
            }
            else if(Trigger.isBefore && Trigger.isUpdate){      
                BalanceTheOpportunityInAccount.updateNumberOfEmployeeOpportunity(Trigger.oldMap, Trigger.newMap);
            }
        }
        
        /*Trigger Handler Class*/
  /*      public class BalanceTheOpportunityInAccount {
            public static void insertNumberOfEmployessOpportunity(List<Account> accList){
                try{
                    if(!accList.isEmpty()){
                        List<Opportunity> oppList = new List<Opportunity>();
                        for(Account acc : accList){
                            if(acc.NumberOfEmployees > 0){
                                for(Integer i = 0; i < acc.NumberOfEmployees; i++){
                                    Opportunity opp = new Opportunity();
                                    opp.Name = acc.Name+' - Opportunity-'+i;
                                    opp.CloseDate = Date.today()+i;
                                    opp.StageName = 'Closed Won';
                                    opp.AccountId = acc.Id;
                                    oppList.add(opp);
                                }
                            }
                        }
                        
                        if(!oppList.isEmpty()){
                            insert oppList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception casue :-> '+ex.getCause());
                }
            }
            
             public static void updateNumberOfEmployeeOpportunity(Map<Id,Account> oldAccMap, Map<Id,Account> newAccMap){
                try{
                    List<Opportunity> allOppList = [SELECT id, AccountId FROM Opportunity WHERE AccountId IN: newAccMap.keySet()];
                    
                    if(!oldAccMap.isEmpty() && !newAccMap.isEmpty() && (oldAccMap.size() == newAccMap.size())){
                        List<Opportunity> addOppList = new List<Opportunity>();
                        List<Opportunity> oppIdList = new List<Opportunity>();
                        
                        for(Account acc :  oldAccMap.values()){
                            if(oldAccMap.get(acc.Id).NumberOfEmployees < newAccMap.get(acc.Id).NumberOfEmployees){
                                Integer oppGap = (newAccMap.get(acc.Id).NumberOfEmployees - oldAccMap.get(acc.Id).NumberOfEmployees);
                                
                                for(Integer j = 0; j < oppGap; j++){
                                    Opportunity opp = new Opportunity();
                                    opp.Name = acc.Name+' - Updated Opportunity-'+j;
                                    opp.CloseDate = Date.today()+j;
                                    opp.StageName = 'Closed Won';
                                    opp.AccountId = acc.Id;
                                    addOppList.add(opp);
                                }
                            }
                            else{
                                Integer oppGap = (oldAccMap.get(acc.Id).NumberOfEmployees - newAccMap.get(acc.Id).NumberOfEmployees);
                                Integer count = 0;
                                for(Opportunity opp : allOppList){
                                    if(opp.AccountId.equals(acc.Id)){
                                        oppIdList.add(opp);
                                        count += 1;
                                        if(count == oppGap){
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                     
                        if(!oppIdList.isEmpty()){
                            delete oppIdList;                    
                        }
                        
                        if(!addOppList.isEmpty()){
                            insert addOppList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception casue :-> '+ex.getMessage());
                }
            }
        }
        
        
        Question  27 : Write a trigger to create Help record when QuickLinks record created and also make sure that their is not more then one record of help in Account related list if record exist update help record with the new quick link details.
        
        /* Trigger */
 /*       trigger QuickLinksTrigger on QuickLinks__c (After insert) {
            if(Trigger.isAfter && Trigger.isInsert){
                CreateHelpsWithQuickLinks.createHelpsWithQuickLinks(Trigger.new);
            }
        }
        
        /*Trigger Handler Class*/
 /*       public class CreateHelpsWithQuickLinks {
            public static void createHelpsWithQuickLinks(List<QuickLinks__c> quickLinkList){
                try{
                    Map<Id,QuickLinks__c> accMap = new Map<Id,QuickLinks__c>();
                    for(QuickLinks__c quick : quickLinkList){
                        if(!accMap.containsKey(quick.Account_LookUp__c)){
                            accMap.put(quick.Account_LookUp__c,quick);
                        }
                    }    
                    
                    if(!accMap.isEmpty()){
                        List<Help__c> helpList = new List<Help__c>();
                        List<Help__c> updateHelpList = new List<Help__c>();
        
                        List<Account> accList = [SELECT id,(SELECT Name, Company_Name__c, Contact_LookUp__c, Account_LookUp__c FROM Helps__r) FROM Account WHERE id IN:accMap.keySet()];  
                        for(Account acc : accList){
                            if(acc.Helps__r.size() <= 0){
                                for(QuickLinks__c quick : quickLinkList){
                                    Help__c help = new Help__c();
                                    help.Name = quick.Name;
                                    help.Account_LookUp__c = quick.Account_LookUp__c;
                                    help.Contact_LookUp__c = quick.Contact_LookUp__c;
                                    help.Company_Name__c = quick.Company_Name__c;
                                    help.URL__c = quick.URL__c;
                                    helpList.add(help);
                                }
                            }
                            else{
                                for(Help__c help : acc.Helps__r){
                                    help.Name = accMap.get(acc.Id).Name;
                                    help.Account_LookUp__c = accMap.get(acc.Id).Account_LookUp__c;
                                    help.Contact_LookUp__c = accMap.get(acc.Id).Contact_LookUp__c;
                                    help.Company_Name__c = accMap.get(acc.Id).Company_Name__c;
                                    help.URL__c = accMap.get(acc.Id).URL__c;
                                    updateHelpList.add(help);
                                }
                            }
                        }
                        
                        if(!helpList.isEmpty()){
                            insert helpList;
                        }
                        else{
                            update updateHelpList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        Question 28 : Write a script when account does not contain at least on opportunity then Create Opportunity with OpportunityLineItems in that account. 
        
        public class CreateOppWithOppLineItem {
            public static void createOpportunityWithOppLineItem(){
                try{
                    List<Account> accList = [SELECT id,(SELECT id FROM Opportunities) FROM Account];
                    if(!accList.isEmpty()){
                        List<Opportunity> oppList = new List<Opportunity>();
                        for(Account acc:accList){
                            if(acc.Opportunities.Size() == 0){
                                Opportunity NewOpp = new opportunity();
                                NewOpp.name =  'OPP';
                                NewOpp.CloseDate = date.today() + 30;
                                NewOpp.AccountId = acc.Id;
                                NewOpp.StageName = 'Closed Won';
                                oppList.add(NewOpp);
                            }
                        }
                        if(!oppList.IsEmpty()){
                            insert oppList;
                        }
                       
                        PricebookEntry pricebook = [Select id from PricebookEntry WHERE Pricebook2.isStandard = true];  
                        List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
                        
                        for(Opportunity opp:oppList){
                            OpportunityLineItem oppLineItem = new OpportunityLineItem();
                            oppLineItem.OpportunityId = opp.Id;
                            oppLineItem.UnitPrice = 10;
                            oppLineItem.PricebookEntryId = pricebook.id;
                            oppLineItem.Quantity = 1;
                            oppLineItemList.add(oppLineItem);
                        }
                        if(!oppLineItemList.IsEmpty()){
                            insert oppLineItemList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        Question 29 : Create custom fields in account Product name, Quantity,total amount,orderDate these all fields will longtext area type. you have write a script to update these fields with appending all Product name, Quantity,total amount and orderDate values of order,product associate with account.
        
        
        Question 30 : create a checkbox field on contact "copy address to conta"Create a custom object ""Actors"" having lookup with Account name
        Account Name and having a field rating[number] on it. Create a custom field on Account ""Total Rating"" .write a script find all ""Actors"" who have rating more or equal than 10,Add all the ratings and update in Total Rating filed on Account which is related the the Actors name Starts with 'A' or 'D'."ct". Write a script to find all the contact
        with this field as true and copy the billing address from account in its related contact in which the
        field is true.
        
        public class CopyAccountAddressToContact {
            public static void copyAccountAddressToContact(){
                try{
                    List<Contact> conList = [SELECT AccountId, MailingCity, MailingState, MailingCountry, MailingPostalCode,MailingStreet FROM Contact WHERE AccountId != null AND Copy_Address_To_Contact__c = true];
                    Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();
                    if(!conList.isEmpty()){
                        for(Contact con : conList){
                            if(!conMap.containsKey(con.AccountId)){
                                conMap.put(con.AccountId, new List<Contact>());
                            }
                            conMap.get(con.AccountId).add(con);
                            conMap.put(con.AccountId,conMap.get(con.AccountId));
                        }
                        
                        if(!conMap.isEmpty()){
                            List<Account> accList = [SELECT BillingCity, BillingCountry, BillingPostalCode, BillingState,BillingStreet FROM Account WHERE Id IN : conMap.keySet()];
                            List<Contact> updateConList = new List<Contact>();
                            
                            for(Account acc : accList){
                                for(Contact con : conMap.get(acc.Id)){
                                    con.MailingCity = acc.BillingCity;
                                    con.MailingCountry  = acc.BillingCountry;
                                    con.MailingPostalCode = acc.BillingPostalCode;
                                    con.MailingState = acc.BillingState;
                                    con.MailingStreet = acc.BillingStreet;
                                    updateConList.add(con);
                                }
                            }
                            
                            if(!updateConList.isEmpty()){
                                update updateConList;
                            }
                        } 
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 31: Create a custom field on opportunity named(total order) and update the total order filled with the total no of order related to the opportunity Account. 
        
        public class FindTotalOrderInOpportunity {
            public static void findTotalOrderInOpportunity(){
                try{
                    List<Order> orderList = [SELECT id, AccountId FROM Order WHERE Accountid!= null];
                    Map<Id,List<Order>> orderMap = new Map<Id,List<Order>>();
                    
                    if(!orderList.isEmpty()){
                        for(Order ord : orderList){
                            if(!orderMap.containsKey(ord.AccountId)){
                                orderMap.put(ord.AccountId, new List<Order>());
                            }
                            orderMap.get(ord.AccountId).add(ord);
                            orderMap.put(ord.AccountId, orderMap.get(ord.AccountId));
                        }
                        
                        List<Opportunity> updateOppList = new List<Opportunity>();    
                        if(!orderMap.isEmpty()){
                            List<Opportunity> oppList = [SELECT total_Order__c, AccountId FROM Opportunity WHERE AccountId IN : orderMap.keySet() ];
                            for(Opportunity opp : oppList){
                                if(orderMap.get(opp.AccountId).size() > 0){
                                    opp.total_Order__c = orderMap.get(opp.AccountId).size();
                                    updateOppList.add(opp);
                                }
                            }
                        }
                     
                        if(!updateOppList.isEmpty()){
                            update updateOppList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 32: Create a custom field in contact named Account City. Write a Trigger on Account to update the field created on associated Contact with Billing City whenever the Billing Address of Account is changed. Make sure this will happen only if Accounts Email field in not Empty.
        
        /* Trigger */
 /*       trigger AccountTrigger on Account ( After update) {       
            if(Trigger.isAfter && Trigger.isUpdate){
                UpdateContactAccountCity.updateCotactAccountCity(Trigger.newMap);
            }
        }
        
        /*Trigger Handler Class*/
/*        public class UpdateContactAccountCity {
            public static void updateCotactAccountCity(Map<Id,Account> accMap){
                try{
                    List<Contact> conList = [SELECT Account_City__c, Account.BillingCity FROM Contact WHERE AccountId IN : accMap.keySet()];
                    
                    if(!conList.isEmpty()){
                        List<Contact> updateConList = new List<Contact>();
                        for(Contact con : conList){
                            if(accMap.get(con.AccountId)!= null){
                                con.Account_City__c = con.Account.BillingCity;
                                updateConList.add(con);
                            }
                        }
                        if(!updateConList.isEmpty()){
                            update updateConList;
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        Question 33: Create a custom field in Account( named as Number of Line Items)
        and whenever the Opportunity line item is inserted under the Opportunity of the Account, increment the Number of Line Items field that you've created above by one on the corresponding Account.
        
        /* Trigger */
 /*       trigger OpportunityTrigger on Opportunity (After update) {
            if(Trigger.isAfter && Trigger.isUpdate){
                CountNumberOfLineItemInAccount.countNumberofLineItemInAccount(Trigger.new);
            }    
        }
        
        /*Trigger Handler Class*/
  /*      public class CountNumberOfLineItemInAccount {
            public static void countNumberofLineItemInAccount(List<Opportunity> oppList){
                try{
                    Set<Id> accIdList = new Set<Id>();
                    for(Opportunity opp : oppList){
                        accIdList.add(opp.AccountId);
                    }
                    if(!accIdList.isEmpty()){
                        List<OpportunityLineItem> oppLineItemList = [SELECT id, Opportunity.AccountId FROM OpportunityLineItem WHERE Opportunity.AccountId IN : accIdList];
                        Map<Id,List<OpportunityLineItem>> accMap = new Map<Id,List<OpportunityLineItem>>();
                        
                        if(!oppLineItemList.isEmpty()){
                            for(OpportunityLineItem oppLineItem : oppLineItemList){
                                if(!accMap.containsKey(oppLineItem.Opportunity.AccountId)){
                                    accMap.put(oppLineItem.Opportunity.AccountId, new List<OpportunityLineItem>());
                                }
                                accMap.get(oppLineItem.Opportunity.AccountId).add(oppLineItem);
                                accMap.put(oppLineItem.Opportunity.AccountId, accMap.get(oppLineItem.Opportunity.AccountId));
                            }
                            
                            if(!accMap.isEmpty()){
                                List<Account> updateAccList = new List<Account>();
                                List<Account> accList = [SELECT Number_Of_Line_Items__c FROM Account WHERE Id IN : accMap.keySet()];
                                
                                if(!accList.isEmpty()){
                                    for(Account acc : accList){
                                        acc.Number_Of_Line_Items__c = accMap.get(acc.Id).size();
                                        updateAccList.add(acc);
                                    }
                                    90
                                    if(!updateAccList.isEmpty()){
                                        update updateAccList;
                                    }
                                }
                            }
                        }
                    }
                }
                catch(Exception ex){
                    System.debug('Exception : '+ex.getMessage());
                }
            }
        }
        
        
        
        */
        
            
        }