/*"Script -
Create a look up[Lead] on product so that Products come over in related list of a Lead.
Write script to create 3 Leads and 5 Products with Lead lookup field.
Trigger -
Write a Trigger to stop creating or updating Opportunities with Account having 
""Working in = ASIA"" and Already 2 Closed Won Opportunity under same Account."   */

trigger TriggerSheetQ18 on Opportunity (before insert,before update) {
   Set<id> acid=new set<id>();
        for(Opportunity opp:trigger.new){
           acid.add(opp.Accountid);
            }
            
    List<Account> accList= [select name,(Select id from Opportunities 
                               where stagename='Closed won') from account where id in: acid and working_In__c='ASIA'];
    
    for(account acc:accList){   
    for(Opportunity opp1:trigger.new){
      if(acc.Opportunities.size()>=2){           
            opp1.adderror('Can not create or update opp bcz parent acc have 2 or more closed won opp and acc woring in ASIA');  
          }
      }           
    }}