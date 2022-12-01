// Question 2 :"Create a custom object ""Actors"" having lookup with Account name
  //and having a field rating[number] on it. Create a custom field on Account ""Total Rating"" .
 // write a script find all ""Actors"" who have rating more or equal than 10,Add all the ratings 
 //and update in Total Rating filed on Account which is related the the Actors name Starts with 'A' or 'D'."

public class FindActors {
    public static void main(){
        
        List<Account> accList =[Select id,Total_Rating__c,(select id,Rating__c from Actors__r where Name Like 'A%') from Account];
        List<Account> accl =  new List<Account>();
 
        for(Account acc:accList){
                    Integer actorRating = 0;
            for(Actors__c act:acc.Actors__r){
                if(act.Rating__c>=10){
                     actorRating =   actorRating + integer.valueOf(act.Rating__c);
                }                
            }
            acc.Total_Rating__c=actorRating;
            accl.add(acc);
            
        }
        update accl;
        
    }
    
}