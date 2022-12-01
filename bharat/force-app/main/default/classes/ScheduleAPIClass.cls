global class ScheduleAPIClass implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {

    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id, name, StripeCustomerId__c from Account where StripeCustomerId__c=null limit 10';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Account> accList){
        try{
            List<Account> accList1=new List<Account>();
      for(Account acc:accList){
            
            Http h = new Http();
            HttpRequest req = new HttpRequest();
              req.setEndpoint('https://api.stripe.com/v1/customers');
              req.setMethod('POST');
              req.setHeader('Authorization','Bearer sk_test_51M51H9SAesYQPsHabuO195dAR1PkaI3JVYwYxbUdmVLsfay9ePVcnLpTAefKpf27sv0KZBhQhi0xxIg09xLqLRJ500VYyYayGB');
              req.setBody('name='+acc.Name);

              HttpResponse res = h.send(req);
     
              getAllData data1 = (getAllData)JSON.deserialize(res.getbody(),getAllData.class); 
              
          
             acc.StripeCustomerId__c = data1.id;
             accList1.add(acc);
            }
           
        
        update accList1;
      //  system.debug('data--->'+accList1);
        }catch(Exception ex){
            system.debug('data--->'+ex.getMessage());
        }      

    }

    global  class getAllData{
        public string id{get;set;}
    }   

    global void finish(Database.BatchableContext bc){
        system.debug('All Done');
    }
   
}