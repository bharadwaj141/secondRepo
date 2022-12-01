//"Create custom fields
    //   - TotalMoney(currency) on Order
    //   - Money(currency) on OrderItem
    // Write a script to create orderItems for order with the help of custom pricebook and count the money and put into TotalMoney."
    
    public class ramSir {
        public static void main(){
            /*       List<order> oddlist = [select id,Pricebook2Id,Total_Money__c from order];
    
    Set<Id> PricebookIdSet = new Set<Id>();
    
    for(order odd:oddlist){
    PricebookIdSet.add(odd.pricebook2Id);
    }
    
    List<Schema.PricebookEntry> pbeList = [select Id,UnitPrice from PricebookEntry where PriceBook2Id In:PricebookIdSet];
    List<OrderItem> odItem = new List<OrderItem>();
    for(order od:oddlist){
    for(Schema.PricebookEntry pbe:pbeList){
    orderItem oI = new orderItem();
    oI.OrderId=od.Id;
    oI.PricebookEntryId=pbe.Id;
    oI.UnitPrice=pbe.UnitPrice;
    oI.Quantity=2;
    oI.Money__c=120;
    
    odItem.add(oI);
    
    
    }
    }
    insert odItem;
    system.debug(odItem);
    
    List<order> UpdateorderList = new List<order>();
    List<orderItem> oderItems = [select Id,Money__c from orderItem];
    for(order o:oddlist){
    integer totalMoney=0;
    for(orderItem oItem:oderItems){
    totalMoney = totalMoney + integer.valueOf(oItem.Money__c); 
    }
    o.Total_Money__c = totalMoney;
    
    UpdateorderList.add(o);
    } 
    update UpdateorderList;
    system.debug(UpdateorderList);                */
            
            //--------------------------------------------------------------------------------------------------------------------        
            //"create a checkbox field on contact ""copy address to contact"". Write a script to find all the contact
            // with this field as true and copy the billing address from account in its related contact in which the
            // field is true."
            
            /*      List<contact> conList = [select id,MailingStreet,MailingCity,MailingState,MailingPostalCode,MailingCountry,Account.BillingStreet,Account.BillingCity,
    Account.BillingState,Account.BillingPostalCode,Account.BillingCountry,AccountId
    from Contact where copy_Address__c=true And AccountId!=null];
    for(contact con:conList){
    con.MailingStreet = con.Account.BillingStreet;
    con.MailingCity = con.Account.BillingCity;
    con.MailingState = con.Account.BillingState;
    con.MailingPostalCode = con.Account.BillingPostalCode;
    con.MailingCountry = con.Account.BillingCountry;
    
    
    }
    update conList;
    system.debug(conList);                         */
            //--------------------------------------------------------------------------------------
            // "Create a field on Account called “Out_of_Zip”, checkbox, default off.
            // When a Billing Address is modified, get the new Postal Code. Then check which Contacts on 
            // the Account are outside that Postal Code. If 1 or more Contacts are outside of the Postal Code,mark Out_of_Zip as TRUE."
            
            /*    public static void main(List<Account> oldAcc,List<Account> newAcc){
    List<contact> conList =[select Id,LastName,MailingPostalCode,Account.BillingPostalCode,Account.Out_of_Zip__c from Contact where AccountId =:newAcc];
    
    For(Account acc:oldAcc){
    for(Account acc1:newAcc){
    if(acc1.BillingPostalCode!=acc.BillingPostalCode){
    for(Contact con:conList){
    if(acc1.BillingPostalCode!=con.MailingPostalCode){
    acc1.Out_of_Zip__c = true;
    }
    }
    }
    }
    }
    update conList;
    }       */
//------------------------------------------------------------------------------------------------------------
// "Create 2 custom lookup fileds ""AccountLookup"" and ""ContactLookup"" in Lead . 
// If the Lead status is ""Working-Contacted"" or ""Closed-Converted"" andNumber of Employees are greater than 100, 
// than a contact should be inserted in Lead's ""ContactLookup"" and the contact's parent account 
//  should be in Lead's ""AccountLookup""."
            
            
/*      List<Lead> ldList = [select Id , Name,Account__c,Contact__c from lead where (status= 'Working - Contacted' OR Status = 'Closed - Converted') And NumberOfEmployees>100];
    
    Account acc = new Account();
            acc.Name = 'Dharmesh';
            insert acc;
        
    Contact con = new Contact();
    con.LastName = 'Sultan';
    con.AccountId = acc.Id;               
    insert con;
    
    for(Lead ld:ldList){
    
    ld.id=ld.Id;
    ld.Account__c= acc.Id;
    ld.Contact__c = con.Id;
    }
    update ldList;
    system.debug(ldList);     */ 
//--------------------------------------------------------------------------------------------------------------------
//Get Total Amount of only those Opportunity whose Opportunity's close date falls in next 30 days
// and OpportunityLineItem quantity is more than 50.         
          
/*        List<opportunity> oppList = [select name,Amount,closeDate,(select id,quantity from OpportunityLineItems where quantity>50) from Opportunity where closeDate>:date.today() And closeDate<:date.today()+30];
    decimal sum =0;
    for(Opportunity opp:oppList){
    sum=sum+opp.Amount;
    }
    system.debug(sum);       */
            //---------------------------------------------------------------------------------------------------------------------------
            //"Write a Script to get all the Products Name(in a list) which were sold with Quantity(Opportunitylineitem) > 100 under their Opportunities(CLOSED WON only).
            //Note - Consider Only that OpportunityLineItems whose first enterd Quantity value > 100.
            //For example - OpportunityLineItem - OppL1 (Product - p)-> Quantity = 120
            // OppL2 (Product - p1)-> Quantity = 80
            // OpplL3 (Product - p1) -> Quantity = 30
            //Only OppL1 should be considered for ProducName."          
            
            /*         List<OpportunityLineItem> opList = [select Id,Product2.Name,Opportunity.StageName,Quantity from OpportunityLineItem where opportunity.stageName='closed Won' ];
    for(OpportunityLineItem opli:opList){
    if(opli.Quantity>50){
    system.debug(opli.Product2.Name);
    }
    }   */
            //----------------------------------          
            /*    List<opportunity> oppList = [select id,Name,stageName,(select quantity,Product2.name from opportunityLineItems ) from opportunity];
    for(Opportunity opp:oppList){
    for(opportunityLineItem op:opp.opportunityLineItems){
    if(op.Quantity>50 && opp.StageName=='closed won'){
    system.debug(op.Product2.name);
    break;
    }
    }
    }    */
            //---------------------------------------------------------------------------------------------------------
            //"Find atleast 5 Account from your ORG having highest number of Contacts and It should be displayed in ascending order.
            //Create a map to store number of contacts in key and list of associated contacts in value.If two Accounts having 
            //the same number of Contacts then it should display only one Account among them(Accounts having same no. of Contacts)."
   /*         try{
                
                 Map<Integer,List<Contact>> accVsCon = new Map<Integer,List<Contact>>();
                List<Account> accList =[select Name,(select Id,LastName from Contacts) from Account order by Name desc limit 5];
                 for(Account acc:accList){
                   if(accVsCon.containskey(acc.contacts.size())){
                         accVsCon.put(acc.contacts.size(),acc.contacts);
                  }
                     else{
                          accVsCon.put(acc.contacts.size(),acc.contacts);
                     }
               }
                for(Integer key:accVsCon.keySet()){
                    system.debug(key+'--->'+accVsCon.get(key));
                }
            }
            catch(Exception e){
                system.debug('error -->'+e.getMessage()+' at line number --> '+e.getLineNumber());
            }                 */
//----------------------------------------------------------------------------------------------------------------------
//In Account Object create a Multi picklist ""Working in (ASIA, EMA, NA, SA)"" Multi picklist. 
//Write a script to get the total Quantity of Products sold in only Accounts working in ASIA."
 /*        set<id> sid= new Set<Id>();
            List<opportunity> oppList = [select Id,Name,AccountId,Account.Working_In__c from opportunity where Account.Working_In__c = 'Asia' And AccountId!=null];
            for(Opportunity opp:oppList){
                sid.add(opp.Id);
            }
            
            List<opportunityLineItem> opliList =[select Id,OpportunityId,Quantity from opportunityLineItem where OpportunityId In:sid];
               decimal qnsum=0;
            List<Decimal> updateList = new List<Decimal>();
            for(opportunityLineItem opli:opliList){
                qnsum = qnsum + opli.quantity;
                system.debug(opli.quantity);
               
            }
             updateList.add(qnsum);
            system.debug(updateList);           */
//------------------------------------------------------------------------------------------------------------------------------
//"Create an Object ""QuickLinks"" and ""Help"" both having the following fields. 1. Account Lookup ""Account""
// 2. Contact Lookup ""Contact"" 3. Company Name as Text field 4. URL field as URL. Write a Script to copy all
//  Quick link URLs on Help only for Accounts which are having exactly one Help and one Quick links in its related list ."            
       
  /*        //  Map<ID,List<QuickLinks__c>> qVmap = new Map<Id,List<QuickLinks__c>>();
            List<QuickLinks__c> qList = [select Id,Account__c,url__c from QuickLinks__c where Account__c!=null];
            
            List<Help__c> hList = [select Id,Account__c,url__c from help__c where account__c!=null];
         //   Map<ID,List<Help__c>> hVmap = new Map<Id,List<Help__c>>();
            
            for(QuickLinks__c q:qList){
                for(help__c h:hList){
                    if(q.Account__c == h.Account__c){
                        h.URL__c = q.URL__c;
                    }
                }
            }
            update hList;
            system.debug(hList);                   */
//--------------------------------------------------------------------------------------------------------------------
//"""Create a Multi picklist field """"Rate"""" [Values as 1 star, 2 stars, 3 stars, 4 stars, 5 stars]
//on Product2 and same Multi picklist field """"Rate"""" on Opportunitylineitem with the same value. 
//Write a script to get all the Products which got less than 3 ratings in opportunity line items 
//but the Product rate for those was 5 star.""                                        
                                 
      /*      List<opportunityLineItem> opli = [select Name,Rating__c,Product2.Product_Rating__c,product2.Name from opportunityLineItem];
            for(opportunityLineItem op:opli){
                if(op.Rating__c<'3' && op.Product2.Product_Rating__c=='5'){
                    system.debug(op.Product2.Name);
                }
            }                       */

//-------------------------------------------------------------------------------------------------------------------
//"Create one contact related to each of those account, who have more than 2lineitem in their opportunity.
// and contact lastname should be opportunity stage name."

  /*          List<opportunity> oppList = [select Id,AccountId,stageName,(select Id from opportunityLineItems) from Opportunity where AccountId!=null];
            for(opportunity opp:oppList){
                for(opportunityLineItem opli:opp.opportunityLineItems){
                    if(opp.opportunityLineItems.size()>2){
                        contact con = new Contact();
                        con.LastName = opp.StageName;
                        con.AccountId = opp.AccountId;
                        insert con;
                          system.Debug(con);
                
                    }
                    
                }
                
            }
                               */
//-------------------------------------------------------------------------------------------------------------------     
//Lead conversion Process--------------------------------------------------------------------------------------------                  
  /*    		List<Lead> ldList = [select Id from Lead where isConverted = false AND Status != 'Closed - Converted' ];
            
            
            List<Database.LeadConvert> lcList = new List<Database.LeadConvert>();
            for(Lead le: ldList){
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(le.Id);
                lc.ConvertedStatus = 'Closed - Converted';
                
				lcList.add(lc);                
            }
            System.debug('lcList> '+ lcList);
            List<Database.LeadConvertResult> lcrList = Database.convertLead(lcList);
            System.debug('lcrList>> '+ lcrList);         */
//------------------------------------------------------------------------------------------------------------------------            
        
  
 //-------------------------------------------------------------------------------------------------------------
 // Count the Line Items related to Account.
  
  /*      List<OpportunityLineItem> oppList =[select Id,opportunity.AccountId from OpportunityLineItem 
                                      where opportunity.AccountId!=null];         
            
             Map<Id,List<OpportunityLineItem>> oplimap = new  Map<Id,List<OpportunityLineItem>>();
           
            for(OpportunityLineItem opli:oppList){
                if(!oplimap.containskey(opli.opportunity.AccountId)){
                    oplimap.put(opli.opportunity.AccountId,new List<OpportunityLineItem>{opli});
                }
                else{
                    oplimap.get(opli.opportunity.AccountId).add(opli);
                }
            }
              
            List<Account> accList =[select Id,Account_LineItem__c from Account where Id In:oplimap.keyset()];
            List<Account> updateAcc = new List<Account>();
            
            for(Account acc:accList){
                Account acc1 = new Account();
                acc1.Id = acc.Id;
                acc1.Account_LineItem__c = oplimap.get(acc.Id).size();
                updateAcc.add(acc1);
            }
            update updateAcc;       */
//--------------------------------------------------------------
            
  /*          List<opportunity> oppList = [select Id,NAme,AccountId,stageName from Opportunity 
                                         where AccountId!=null And stageName='closed won'];
            Map<Id,List<opportunity>> AccVsOpp = new Map<Id,List<Opportunity>>();
            
            for(opportunity opp:oppList){
                if(!AccVsOpp.containskey(opp.AccountId)){
                    AccVsOpp.put(opp.AccountId,new List<opportunity>{opp});
                }
                else{
                    AccVsOpp.get(opp.AccountId).add(opp);
                }
            }
            for(Id keyID:AccVsOpp.keyset()){
               
                system.debug('OpportunityId--->'+AccVsOpp.get(keyId).size());
            for(Opportunity o:AccVsOpp.get(keyID)){
                
                system.debug('OpportunityName-->'+o.Name);
            }
            }                */
//-----------------------------------------------------
// Account Related lineItem more than 2 then create contact.

            Map<Id,List<opportunityLineItem>> accMap = new Map<Id,List<opportunityLineItem>>();
            set<Id> sid = new Set<Id>();
            
    List<opportunityLineItem> opli = [select Id,Opportunity.AccountId from opportunityLineItem
                                       where Opportunity.AccountId!=null];
            for(opportunityLineItem opp:opli){
               if(!accMap.containskey(opp.Opportunity.AccountId)){
                   accMap.put(opp.Opportunity.AccountId,new List<opportunityLineItem>{opp});
                }
                else{
                
                    accMap.get(opp.Opportunity.AccountId).add(opp);
                }
            }
             for(Id keyID:accMap.keyset()){
               
                 if(accMap.get(keyId).size()>=2){
                     sid.add(keyId);
                 }
             }
            List<contact> conList = new List<Contact>();
           list<Account> accList = [select Id,Name from Account where Id In:sid];
            for(Account acc:accList){
                 contact con = new contact();
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                conList.add(con);
            }
            insert conList;
        }
    }