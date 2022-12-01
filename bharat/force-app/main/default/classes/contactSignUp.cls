//"Create an aura component that will sign in using ID and password in contacts object(create Username and password field).
//and if the user successfully login then displays a message that you are successfully logged In."

public class contactSignUp {
   @AuraEnabled
    public static String getContact(String username, String password){
        
          List<Contact> con_List=[Select Id,Username__c,Password__c from Contact where Username__c =: username Limit 1];
        if(con_List.size() == 0)
        {
           return 'User does not exist'; 
        }
        else
        {
            if(con_List[0].Password__c==password)
            {
                return 'Login successfull!!!!';
            }
            else
            {
                return 'Invalid password please try again!!!!';
            }
        }
        
    }
}