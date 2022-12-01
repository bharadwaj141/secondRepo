Public class APIQuestion {
    public static void getAccount(){
        
        HttpRequest req=new HttpRequest();
         req.setMethod('POST');
         String CLIENT_ID = '3MVG9wt4IL4O5wvLBvfn7.3.71eR.ywTIqiV7glHe7iZruIjMsaPtmC2hrZLVDXrdE5E3H84BdWmzDXAPVpk5';
         String CLIENT_Secret = '09EEA170AEE6013A612A569E06963AA88367E3F696F997E956269CCD8672D8C1';
         String USERNAME = 'bharat.bhusan121@cloudanalogy.com';
         String PASSWORD = 'm6b2b2s7hwXVEeH2XUojTOlsZrLONNRv';
         req.setEndpoint('https://cloudanalogy335-dev-ed.my.salesforce.com/services/oauth2/token?client_id='+CLIENT_ID+'&client_secret='+CLIENT_Secret+'&username='+USERNAME+'&password='+PASSWORD+'&grant_type=password');


        
        Http http=new Http();
        HttpResponse res= http.send(req);       
        System.debug('response-->: '+res.getBody());
        
         Oauth objAuthInfo=(Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        
        if(objAuthInfo.access_token!=null)
        {
          HttpRequest req1=new HttpRequest();
            req1.setMethod('POST');
            req1.setEndpoint('https://cloudanalogy335-dev-ed.my.salesforce.com/services/data/v49.0/sobjects/account');
            req1.setHeader('Authorization','Bearer '+objAuthInfo.access_token);
            req1.setHeader('Content-Type','application/json');
            req1.setBody('{"Name":"Practice"}');

            
           Http http1=new Http();
            HttpResponse res1= http1.send(req1);
            System.debug('Status -->: '+res1.getStatusCode());
            System.debug('Account Info-->: '+res1.getBody());
            
        
        }
    }
     public class Oauth{
        public String access_token{get;set;}
    
    }
}