public with sharing class createStripeCustomer {
  @AuraEnabled(cacheable=true)
  public static List<String> getCustomer(string recordId){

    try{
       
      List<string> str= new List<string>();
    Account acc1 = [Select name, id, STRIPECUSTOMERID__C, website from Account where id = : recordId];
   
   
    if(acc1.STRIPECUSTOMERID__C==null ){
        Http http=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.stripe.com/v1/customers');
        request.setMethod('POST');
        request.setHeader('Authorization','Bearer sk_test_51M51H9SAesYQPsHabuO195dAR1PkaI3JVYwYxbUdmVLsfay9ePVcnLpTAefKpf27sv0KZBhQhi0xxIg09xLqLRJ500VYyYayGB        ');
        request.setBody('name='+acc1.name );//no set body for get 
        httpResponse response= http.send(request);
        getValue data = (getValue)JSON.deserialize(response.getBody(),getValue.class);
            
        system.debug(data);

        Account acc = new Account();
        acc.Id = recordId;
        acc.StripeCustomerId__c = data.Id;
           update acc;
           system.debug('after update--->'+acc);
 } 
    else{
    Http http=new Http();
    HttpRequest request =new HttpRequest();
    request.setEndpoint('https://api.stripe.com/v1/customers/'+acc1.STRIPECUSTOMERID__C);
        request.setMethod('GET');
        //request.getHeader('Content-type', );
        request.setHeader('Authorization','Bearer sk_test_51M51H9SAesYQPsHabuO195dAR1PkaI3JVYwYxbUdmVLsfay9ePVcnLpTAefKpf27sv0KZBhQhi0xxIg09xLqLRJ500VYyYayGB');
        

    httpResponse response= http.send(request);
    getValue gvalue = (getValue)JSON.deserialize(response.getBody(),getValue.class);
    
    system.debug(gvalue);
    
    str.add(gvalue.id);
    str.add(gvalue.name);
    }
    return str;
    }
    catch(Exception ex){
      system.System.debug('error-->'+ex.getMessage());
      return null;
    }

}

public class getValue{
    public string id{get;set;}
    public string name{get;set;}
    public string email{get;set;}
}
}