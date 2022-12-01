public class StripeCallout {
    
 //   public static void createCustomer(String name, String Email){
        
    public static void createCustomer(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.stripe.com/v1/customers');
     //   req.setMethod('POST');
        req.setMethod('GET');
        req.setHeader('Authorization','Bearer sk_test_51M51H9SAesYQPsHabuO195dAR1PkaI3JVYwYxbUdmVLsfay9ePVcnLpTAefKpf27sv0KZBhQhi0xxIg09xLqLRJ500VYyYayGB');
     //   req.setBody('name='+name +'&email='+email);
        
        HttpResponse res = h.send(req);
     
        getAllData data1 = (getAllData)json.deserialize(res.getbody(),getAllData.class);
        
        system.debug('data-->'+res.getBody());
        system.debug('data-->'+res.getstatuscode());
        system.debug('data-->'+res.getStatus());
        
  /*      Account acc = new Account();
        acc.Name = data.name;
        acc.StripeCustomerId__c = data.Id;
           insert acc;   */
        for(Dataclass d:data1.data){
        system.debug(d.id);
    }
        
    }
    
 /*   public  class getAllData{
        public string id{get;set;}
          public string name{get;set;}
            public string email{get;set;}
    }           */
    
    
    
 public class getAllData{
        public List<Dataclass> data{get;set;}
 }
     public class Dataclass{
            public string id{get;set;}
        }
    
}