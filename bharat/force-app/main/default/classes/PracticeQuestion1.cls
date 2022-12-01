public class PracticeQuestion1 {
        public static void main(){
            
      /*
       *       Question-1. Create 20 new Accounts Records in salesforce with atleast 5 fields filled.
    Solution.
    public class CreateAccountClass {
        public static void createAccountMethod(){
            try{
                List<Account> accList = new List<Account>();
                for(Integer i=0; i<20; i++) {
                    Account acc = new Account();
                    acc.Name = 'Name '+ i;
                    acc.AccountNumber = '100' + i;
                    acc.BillingCity = 'Delhi Pincode = 10' + i;
                    acc.Rating = 'Rating ' + i ;
                    acc.Description = 'Description ' + i;
                    acc.Fax = '1000' + i;
                    accList.add(acc);
                }
                if(!accList.isEmpty()){
                    insert accList;
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-2. Create 10 Contacts with different Account(LookUp) values(Relationship) with no same 2 account in them.
    Solution.
    public class AddContactClass {
        public static void addContactMethod(){
            try{
                List<Account> accList = new List<Account>();
                accList = [SELECT ID,Name FROM Account LIMIT 10];
                List<Contact> conList = new List<Contact>();
                for(Integer i=0; i<10; i++) {
                    Contact con = new Contact();
                    con.LastName = accList.get(i).Name;
                    con.AccountId = accList.get(i).id;
                    conList.add(con);
                }
                if(!conList.isEmpty()){
                    insert conList;
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-3. Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
    Solution.
    public class AddOpportunityClass {
        public static void addOpportunityMethod(){
            try{
                List<Opportunity> oppList = new List<Opportunity>();
                for(Integer i=0; i<20; i++) {
                    Opportunity opp = new Opportunity();
                    opp.Name = 'Opportunity '+i;
                    opp.CloseDate = System.today();
                    opp.StageName = 'Value Prepostion ' + i;
                    opp.Probability = 70;
                    oppList.add(opp);
                }
                if(!oppList.isEmpty()){
                    insert oppList;                
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-4. Create 10 Products with different Product Names,  Discrption & Family 
    Solution.
    public class AddProductClass {
        public static void addProductMethod(){
            try{
                List<Product2> proList = new List<Product2>();
                for(Integer i=0; i<10 ;i++) {
                    Product2 pro = new Product2();
                    pro.Name = 'Product ' + i;
                    pro.Description = 'Description ' + i;
                    pro.Family = 'Family ' + i;
                    proList.add(pro);
                }
                if(!proList.isEmpty()){
                    insert proList;
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-5. Delete all contacts belonging to Accounts Name FIELD having 'A' in them.
    Solution.
    public class DeleteContactClass {
        public static void deleteContactMethod(){
            try{
                List<Contact> conList = [SELECT ID FROM Contact WHERE Account.Name LIKE '%a%'];
                if(!conList.isEmpty()){
                                System.debug(conList);
                    delete conList;                
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-6. Update all Opportunity with future CloseDate by Opportunity Name=Opportunity Name + 'F'
    Solution.
    public class UpdateOpportunityClass {
        public static void updateOpportunityMethod() {
            try{
                Date Today = System.today();
                List<Opportunity> oppList = [SELECT Name, CloseDate FROM Opportunity WHERE CloseDate > Today];
                List<Opportunity> updateOppList = new List<Opportunity>();
                for(Opportunity opp : oppList) {
                    opp.Name = opp.Name + 'F';
                    updateOppList.add(opp);
                }
                if(!updateOppList.isEmpty()){
                    System.debug(updateOppList);
                    update updateOppList;
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-7. Create a apex class with a function that show  a message "Welcome to Salesforce "
    Solution.
    public class ShowMessageClass {
        public static void showMessageMethod() {
            try{
                System.debug('Welcome to Salesforce');
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-8. Execute the above function from Apex Class.
    Solution.
    public class ApexClass {
        public static void apexMethod() {
            try{
                CreateAccountClass.createAccountMethod();
                AddContactClass.addContactMethod();
                AddOpportunityClass.addOpportunityMethod();
                AddProductClass.addProductMethod();
                DeleteContactClass.deleteContactMethod();
                UpdateOpportunityClass.updateOpportunityMethod();
                ShowMessageClass.showMessageMethod();
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-9. Find the current username, email and phone number from the system administration
    Solution.
    public class CurrentUserClass {
        public static void currentUserMethod() {
            try{
                User userObj = [SELECT Name, Email, MobilePhone FROM User WHERE ID=:UserInfo.getUserId()];
                System.debug('User Name is ' + userObj.Name);
                System.debug('User Email is ' + userObj.Email);
                System.debug('User Mobile Phone Number is ' + userObj.MobilePhone);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-10. Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'
    Solution.
    public class ReverseAccountNameClass {
        public static void ReverseAccountNameMethod() {
            try{
                List<Account> accNameList = [SELECT Name FROM Account LIMIT 2];
                List<String> revAccNameList = new List<String>();
                String tempStr = '';
                for(Account acc : accNameList) {
                    String accNameString = acc.Name;
                    for(Integer i=accNameString.length(); i>=0; i--) {
                        if(accNameString.substring(i).length() > 1) {
                            tempStr+=accNameString.substring(i).substring(0,1);
                        } else{
                            tempStr+=accNameString.substring(i);
                        }
                    }
                    revAccNameList.add(tempStr);
                    tempStr='';
                }
                System.debug('Account Name List :' + accNameList);
                System.debug('Reverse Account Name List : ' + revAccNameList);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-11. Print the fibonacci series. 1, 1, 2, 3, 5, 8, 13..
    Solution.
    public class FibonacciSeriesClass {
        public static void fibonacciSeriesMethod(Integer n){
            try{
                Integer first = 0;
                Integer second = 1;
                Integer prevSum;
                List<Integer> fib = new List<Integer>();
                while(n>0) {
                    fib.add(first);
                    prevSum = first + second;
                    first = second;
                    second = prevSum;
                    n--;
                }
                System.debug('Fibonacci Series : ' + fib);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-12. Print any Integer number in reverse order. Ex: 789234  => 432987
    Solution.
    public class NumberReverseClass {
        public static void numberReverseMethod(Integer n) {
            try{
                Integer rev = 0;
                Integer mod;
                System.debug('Number is ' + n);
                while(n!=0) {
                    mod=math.mod(n, 10);
                    rev=rev*10 + mod;
                    n=n/10;
                }
                System.debug('Reversed Number is ' + rev);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-13. Find all the Products having Description field containing 'a' in it.
    Solution.
    public class FindProductClass {
        public static void findProductMethod() {
            try{
                List<Product2> proList = [SELECT ID,Name,Description FROM Product2 WHERE Description LIKE '%a%'];
                List<Product2> findedProList = new List<Product2>();
                for(Product2 pro : proList) {
                    findedProList.add(pro);
                }
                if(!findedProList.isEmpty()){
                    System.debug('All products that are description contain A ' + findedProList);
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-14. Create new price book 'Algo Price Book' and 10 products with Prices in the Pricebook
    Solution.
    public class AddPriceBookClass {
        public static void addPriceBoolMethod() {
            Try{                 
                Pricebook2 priBookObj = new Pricebook2();
                priBookObj.Name = 'Algo Price Book';
                priBookObj.Description = 'Algo price book description';
                priBookObj.IsActive = true;
                insert priBookObj;
                
                List<Product2> proList = new List<Product2>();
                for(Integer i=0; i<10; i++) {
                    Product2 proObj = new Product2();
                    proObj.Name = 'Product Object ' + i;
                    proObj.IsActive = true;
                    proList.add(proObj);
                }
                if(!proList.isEmpty()){
                    insert proList;                          
                }            
                
                List<PricebookEntry> priBookEntryList1 = new List<PricebookEntry>();
                PriceBook2 stdPriceBook = [SELECT ID FROM Pricebook2 WHERE IsStandard=true];
                for(Product2 pro : proList) {            
                    PricebookEntry priBookEntryObj = new PricebookEntry();
                    priBookEntryObj.UnitPrice = 250;
                    priBookEntryObj.Pricebook2Id = stdPriceBook.id;
                    priBookEntryObj.Product2Id = pro.id;
                    priBookEntryList1.add(priBookEntryObj);
                }
                if(!priBookEntryList1.isEmpty()){
                    insert priBookEntryList1;                
                }
                
                List<PricebookEntry> priBookEntryList2 = new List<PricebookEntry>();
                for(Product2 pro : proList) {            
                    PricebookEntry priBookEntryObj = new PricebookEntry();
                    priBookEntryObj.UnitPrice = 255;
                    priBookEntryObj.Pricebook2Id = priBookObj.id;
                    priBookEntryObj.Product2Id = pro.id;
                    priBookEntryList2.add(priBookEntryObj);
                }
                if(!priBookEntryList2.isEmpty()){
                    insert priBookEntryList2;                
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }        
        }
    }
    
    Question-15. WAP to enter a startDate='06:07:55 2-jan-2016' & endDate='07:08:55 5-feb-2016' and display the difference between two dates in Years, months, days, hours, minutes,seconds.
    Solution.
    public class DateTimeClass {
        public static void dateTimeMethod(String startDate, String endDate){
            try{
                Map<String, Integer> monthMap = new Map<String, Integer>();
                monthMap.put('jan',1);
                monthMap.put('feb',2);
                monthMap.put('mar',3);
                monthMap.put('apr',4);
                monthMap.put('may',5);
                monthMap.put('jun',6);
                monthMap.put('jul',7);
                monthMap.put('aug',8);
                monthMap.put('sep',9);
                monthMap.put('oct',10);
                monthMap.put('nov',11);
                monthMap.put('dec',12);
                String startTime = startDate.substring(0,8);
                String endTime = endDate.substring(0,8);
                
                String preDate = startDate.substring(9,startDate.length());
                String nextDate = endDate.substring(9,endDate.length());
                
                String []preDateArray = preDate.split('-');
                Date preDateObj = Date.newInstance(Integer.valueOf(preDateArray[2]), monthMap.get(preDateArray[1]), Integer.valueOf(preDateArray[0]));
                
                String []nextDateArray = nextDate.split('-');
                Date nextDateObj = Date.newInstance(Integer.valueOf(nextDateArray[2]), monthMap.get(nextDateArray[1]), Integer.valueOf(nextDateArray[0]));
                
                System.debug('Days Difference: ' + preDateObj.daysBetween(nextDateObj));
                System.debug('Months Difference: ' + (monthMap.get(nextDateArray[1]) - monthMap.get(preDateArray[1])));
                System.debug('Years Difference: ' + (Integer.valueOf(nextDateArray[2]) - Integer.valueOf(preDateArray[2])));
                
                
                String []startTimeArray = startTime.split(':');
                String []endTimeArray = endTime.split(':');
                
                Integer inHour = (24 - Integer.valueOf(startTimeArray[0]));
                Integer inMinute = (60 - Integer.valueOf(startTimeArray[1]));
                Integer inSeconds = (60 - Integer.valueOf(startTimeArray[2]));
                
                Integer hoursDifference = (24 * preDateObj.daysBetween(nextDateObj)) + (inHour + Integer.valueOf(endTimeArray[0]));
                Integer minuteDifference = (60 * hoursDifference) - (inMinute + Integer.valueOf(endTimeArray[1]));
                Integer secondsDifference = (60 * minuteDifference) - (inSeconds + Integer.valueOf(endTimeArray[2]));
                
                System.debug('Hour Difference : '+hoursDifference);
                System.debug('Minute Difference : '+minuteDifference);
                System.debug('Seconds Difference : '+secondsDifference);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    
    Question-16. WAP to add two binary nos. '100101' & '0101101' which are in text format.
    Solution.
    public class BinarySumClass {
        public static void binarySumMethod() {
            try{
                String str1 = '0100101';
                String str2 = '0101101';
                Integer carry = 0;
                String sum = '';
                Integer num;
                for(Integer i = str1.length()-1; i>=0; i--){
                    num = Integer.valueOf((str1.charAt(i)) - 48) + Integer.valueOf((str2.charAt(i)) - 48) + carry;
                    if(num < 2){
                        sum = num + sum;
                        carry = 0 ;
                    }else{
                        sum = (num-2) + sum;
                        carry = 1;
                    }
                }
                if(carry == 1){
                    sum = carry + sum;
                }
                System.debug(str1 + ' + ' + str2 + ' = ' + sum);
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-17. Write a program in Salesforce to create another System admin user in your dev org with your email. Register the user manually.
    Solution.
    public class CreateSystemAdminClass {
        public static void createSystemAdminMethod() {
            try{
                Profile profileObj = [SELECT ID FROM Profile WHERE Name=:'System Administrator' LIMIT 1];
                User userObj = new User();
                userObj.Email = 'SystemAdmin101@gmail.com';
                userObj.Username = 'SystemAdmin101@gmail.com';
                userObj.ProfileId = profileObj.Id;
                userObj.Alias = 'Alias';
                userObj.LastName = 'System Admin';
                userObj.EmailEncodingKey = 'UTF-8';
                userObj.LocaleSidKey = 'en_US';
                userObj.TimeZoneSidKey = 'GMT';
                userObj.LanguageLocaleKey = 'en_US';
                insert userObj;
            }catch(Exception e) {
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-18. WAP to create 5 Case Records with all the values(Account, Contact, etc) filled in.
    Solution.
    public class AddCaseClass {
        public static void addCaseMethod() {
            try{
                  List<Account> accList = [SELECT ID FROM Account LIMIT 5];
            List<Contact> conList = [SELECT ID FROM Contact LIMIT 5];
            List<Case> caseList = new List<Case>();
            for(Integer i=0; i<5; i++){
                Case caseObj = new Case();
                caseObj.status = 'Working';
                caseObj.Origin = 'Phone';
                caseObj.AccountId = accList.get(i).id;
                caseObj.ContactId = conList.get(i).id;
                caseObj.type = 'Electrical';
                caseObj.Reason = 'Performance';
                caseObj.Priority = 'High';
                caseObj.Subject = 'Subject ' + i;
                caseList.add(caseObj);
            }
            if(!caseList.isEmpty()){
                insert caseList;            
            }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-19. Manually add 2 (jpg and PDF) attachments under Accounts related list.WAP to copy the attachments to Contact associated(parent child) with Account
    Solution.
    public class AddFilesClass {
        public static void addFileMethod() {
            List<ContentDocumentLink> conDocLinkList = new List<ContentDocumentLink>();
            
            for(Contact con : [SELECT ID,AccountId FROM Contact WHERE AccountId=:'0015g00000Mv1mnAAB' LIMIT 1]){
                for(ContentDocumentLink conDoc : [SELECT ContentDocumentID FROM ContentDocumentLink WHERE LinkedEntityID=:con.AccountId]){
                    ContentDocumentLink conDocLinkObj = new ContentDocumentLink();
                    conDocLinkObj.LinkedEntityId = con.ID;
                    conDocLinkObj.ContentDocumentId = conDoc.ContentDocumentId;
                    conDocLinkList.add(conDocLinkObj);
                }
            }
            
            if(!conDocLinkList.isEmpty()){
                insert conDocLinkList;
            }
        }
    }
    
    Question-20. Create new opportunity and clone that opportunity with all the related Line Items and "Closed Date = Old closed date + 30 days & Opportunity name = Opportunity Name+ 'Clone'"
    Solution.
    public class CloneOpportunityClass {
        public static void cloneOpportunityMethod(){        
            for(Opportunity opp : [Select Id, Name,StageName,CloseDate,Pricebook2Id From Opportunity Where Name=:'My Opportunity' LIMIT 1]){
                Opportunity oppObj = new  Opportunity();
                oppObj.Name = opp.Name+' Clone';
                oppObj.StageName = opp.StageName;
                oppObj.CloseDate = opp.CloseDate +30;
                oppObj.Pricebook2Id = opp.Pricebook2Id;
                insert oppObj;
                
                List<OpportunityLineItem> insertLineList = new List<OpportunityLineItem>();
                for(OpportunityLineItem oppLine: [Select Id,Product2Id,PricebookEntryId From OpportunityLineItem Where OpportunityId =:opp.Id]){
                    OpportunityLineItem oppLineItemObj = new OpportunityLineItem();
                    oppLineItemObj.OpportunityId = oppObj.Id;
                    oppLineItemObj.Product2Id = oppLine.Product2Id;
                    oppLineItemObj.UnitPrice = 10;
                    oppLineItemObj.Quantity = 1;
                    oppLineItemObj.PricebookEntryId = oppline.PricebookEntryId;
                    insertLineList.add(oppLineItemObj);
                }
                if(!insertLineList.isEmpty()){
                    insert insertLineList;   
                }
            }
        }
    }
    
    Question-21. Write a Script to get all the Products Name(in a list) which were sold with Quantity(Opportunitylineitem) > 100 under their Opportunities(CLOSED WON only).
    Note - Consider Only that OpportunityLineItems whose first enterd Quantity value > 100.
    For example - OpportunityLineItem - OppL1 (Product - p)-> Quantity = 120
     OppL2 (Product - p1)-> Quantity = 80
     OpplL3 (Product - p1) -> Quantity = 30
    Only OppL1 should be considered for ProducName.
    Solution.
    public class QuantityFindOfProducts {
        public static void quantityFindOfProductsMethod(){
            try{
                List<Opportunity> oppList = new List<Opportunity>([Select Id,Name From Opportunity Where StageName =: 'Closed Won' LIMIT 150]);
                List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>();
                if(!oppList.isEmpty()){
                    oppLineList = [Select Id,Quantity,Product2Id From OpportunityLineItem Where OpportunityId IN : oppList];
                }
                //System.debug(oppList);
                //System.debug(oppLineList);
                
                List<Id> proId = new List<Id>();
                if(!oppLineList.isEmpty()){
                    for(OpportunityLineItem oppLineItem : oppLineList){
                        if(oppLineItem.Quantity > 100){
                            proId.add(oppLineItem.Product2Id);
                        }
                    } 
                }
                //System.debug(proId);            
                
                List<Product2> proList = new List<Product2>([Select Name From Product2 Where Id IN : proId]);
                List<String> proName = new List<String>();
                if(!proList.isEmpty()){
                    for(Product2 pro : proList){
                        proName.add(pro.Name);
                    }
                }
                
                if(!proName.isEmpty()){
                    System.debug(proName);
                }
   /*         }catch(Exception e){
                System.debug('Exception is ' + e.getCause());
            }
        }
    }
    
    
    Question-22. In Account Object create a Multi picklist ""Working in (ASIA, EMA, NA, SA)"" Multi picklist.
          Write a script to get the total Quantity of Products sold in only Accounts working in ASIA."
    Solution.
    public class TotalSoldProductsClass {
        public static void totalSoldproductsMethod(){
            try{
                List<AggregateResult> aggList = new List<AggregateResult>([Select Id oppId from Opportunity Where AccountId != Null And Account.Working__c = 'Asia' Group By Id]);
                List<Id> ids = new List<Id>();
                if(!aggList.isEmpty()){
                    for(AggregateResult agr : aggList){

                        ids.add((Id)agr.get('oopId'));
                    }
                }
                List<Decimal> qnList = new List<Decimal>();
                List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>([select OpportunityId, Quantity from OpportunityLineItem Where OpportunityId IN : ids]);
                for(Id oppId: ids){     
                    Decimal qnSum = 0;
                    for(OpportunityLineItem oppLine : oppLineList){
                        if(oppLine.OpportunityId == oppId){
                            qnSum = qnSum + oppLine.Quantity;  
                        }
                    }
                    qnList.add(qnSum);
                }
                if(!qnList.isEmpty()){
                    system.debug(qnList);
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getCause());
            }
        }
    }
    
    Question-23. Write a Script to get all the Accounts having Opportunity Line Items Quantity > 100 under their Opportunities(CLOSED WON only).Using Map.
    Solution.
    public class AccountOpportunityLineItemClass {
        public static void accountOpportunityLineItemMethod(){
            List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>
                ([
                    Select Id,Opportunity.AccountId,Opportunity.Account.Name From OpportunityLineItem Where Quantity > 100 AND Opportunity.StageName = 'Closed Won'
                ]);
            Map<Id,String> accNameMap = new Map<Id,String>();
            for(OpportunityLineItem oppLine : oppLineList){
                if(!accNameMap.containsKey(oppLine.Opportunity.AccountId)){
                    accNameMap.put(oppLine.Opportunity.AccountId,'');
                }
                accNameMap.put(oppLine.Opportunity.AccountId,Oppline.Opportunity.Account.Name);
            }
            for(Id key : accNameMap.keySet()){
                System.debug('Account Name --> ' + accNameMap.get(key));
            }
        }
    }
    
    
    Question-24. Write a script to count opportunitylineItem on each Account using Map(code should be bulkify).
    Solution.
    public class CountOppLineItemRelAccClass {
        public static void countOppLineItemRelAccMethod(){
            List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>
                ([
                    Select Id,OpportunityId,Opportunity.AccountId From OpportunityLineItem Where Opportunity.AccountId != Null
                ]);
            Map<Id,Integer> countOppLineMap = new Map<Id,Integer>();
            for(OpportunityLineItem oppLine : oppLineList){
                if(!countOppLineMap.containsKey(oppLine.Opportunity.AccountId)){
                    countOppLineMap.put(oppLine.Opportunity.AccountId,0);
                }
                countOppLineMap.put(oppLine.Opportunity.AccountId,countOppLineMap.get(oppLine.Opportunity.AccountId) + 1);
            }
            for(Id key : countOppLineMap.keySet()){
                System.debug('Account Id --> ' + key + ' : Total OpportunityLineItem is --> ' + countOppLineMap.get(key));
            }
        }
    }
    
    Question-25. Create a custom object 'Building' with below fields:
     - No. of Units (picklist value 1 to 10).
     - Floor No. (Integer)
    Create a custom object 'Flat' with below fields:
     - Building (Lookup)
    Write a script to create a building record with all the fields filled and For each building create the Flat record as per the 'No.' of units of that building. Also, the flat name must be in the following form:
    For ex: If a building record has Floor no. : 1 and No. of Units : 3 then the flat records name should be 101 + Building Name, 102 + Building Name, 103 + Building Name
    If a building record has Floor no. : 2 and No. of Units : 3 then the flat records name should be 201 + Building Name, 202 + Building Name, 203 + Building Name
    Solution.
    public class CreateFlatsUsingBuildingClass {
        public static void createFlatsUsingBuildingMethod(){
            try{
                List<Flat__c> flatList = new List<Flat__c>();        
                for(Building__c building : [select Id,Name,Floor_No__c,No_Of_Units__c from Building__c limit 5]){
                    for(Integer i  = 1; i <= integer.valueOf(building.No_Of_Units__c); i++){    
                        Flat__c flatObj =  new flat__c();
                        flatObj.Building__c = building.id;
                        flatObj.name = building.Floor_No__c + '0' + i + ' ' + building.name;
                        flatList.add(flatObj);
                    }
                }
                if(!flatList.isEmpty()){
                    insert flatList;
                }     
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }      
        }
    }
    
    Question-26. Write a Script to get all the Accounts having Opportunity Line Items Quantity > 100
under their Opportunities(CLOSED WON only).
    Solution.
    public class GetAccountHavingOppLineClass {
        public static void getAccountHavingOppLineMethod(){
            try{
                List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>
                    ([
                        Select Id,OpportunityId,Quantity,Opportunity.AccountId,Opportunity.Account.Name From OpportunityLineItem Where OpportunityId != Null AND Opportunity.AccountId != Null AND Opportunity.StageName = 'Closed Won' AND Quantity > 100
                    ]);
                Map<Id,String> accMap = new Map<Id,String>();
                for(OpportunityLineItem oppLine : oppLineList){
                    if(!accMap.containsKey(oppLine.Opportunity.AccountId)){
                        accMap.put(oppLine.Opportunity.AccountId,oppLine.Opportunity.Account.Name);
                    }
                }
                for(Account acc : [Select Id,Name From Account Where Id IN : accMap.keySet()]){
                    System.debug(acc);
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    Question-27. Requirements:Create StartDate and EndDate custom fields of datatype date on Account and Contact Objects.
                   Calculate the difference between each contacts startdate and enddate fields and
                   
the contact which has the minimum difference of startdate and enddate, populate that
                   contacts startdate and enddate fields on the account objects startdate and enddate fields.
    Solution.
    public class MinDiffDatePutInRelatedAccClass {
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
    }
    
    Question-28. Create a new Product "Gandhiji Chasma". Add Price as 100$ in standard price book and any other price books as well. Create few oppportunites with Opportunity line item "Gandhiji Chasma". Write a script to get the total Price of all the Opportunity sold having Product "Gandhiji Chasma”.
    Solution.
    public class GetTotalPriceSoldProductClass {
        public static void getTotalPriceSoldProductMethod(){
            try{
                List<OpportunityLineItem> oppLineList = new List<OpportunityLineItem>
                    ([
                        Select Id,OpportunityId,Product2Id,Quantity From OpportunityLineItem Where Product2.Name = 'Gandhiji Chasma'
                    ]);
                Map<Id,Double> totalQuantityMap = new Map<Id,Double>();
                for(OpportunityLineItem oppLine : oppLineList){
                    if(!totalQuantityMap.containsKey(oppLine.Product2Id)){
                        totalQuantityMap.put(oppLine.Product2Id, 0);
                    }
                    totalQuantityMap.put(oppLine.Product2Id,totalQuantityMap.get(oppLine.Product2Id) + oppLine.Quantity);
                } 
                for(Id key : totalQuantityMap.keySet()){
                    System.debug('Total Amount of Product (' + key + ') : ' + totalQuantityMap.get(key) * 100);
                }
            }catch(Exception e){
                System.debug('Exception is ' + e.getMessage());
            }
        }
    }
    
    
    */
            
        }
    }