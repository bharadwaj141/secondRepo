@RestResource(urlMapping='/stripe/*')
global  class webhookConnection {
    @HttpPost
    global static string createAcc(){
        try{
              RestRequest req = RestContext.request;	
              req.addHeader('Content-Type','application/json');

              string allresp=req.requestBody.tostring();
              string stringobj=allresp.replace('object', 'objectobj');

            WrapperData WrapperDataclass=(WrapperData)JSON.deserialize(stringobj, WrapperData.class); 

            Account ac= new Account();
             ac.name= WrapperDataclass.data.objectobj.name; 
             ac.stripeCustomerId__c=WrapperDataclass.data.objectobj.id;
            insert ac;

             return WrapperDataclass.data.objectobj.name; 
        }catch(Exception ex){
            System.debug('Error --> '+ex.getMessage()+' line --> '+ex.getLineNumber());
            return null;
        }
    }
    public class WrapperData{
        public recorddata data{get;set;}
    }   
    
   public class recorddata {
		public objectdata objectobj {get;set;}
	}
   
    public class objectdata{
        public string id{get;set;}
        public string name{get;set;}
    }
              
}