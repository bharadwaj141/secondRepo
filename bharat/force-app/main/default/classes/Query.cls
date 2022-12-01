//Find id and name of all contact whose contact name has letter 'A' in it
//Find id and name of all contact whose contact name starts with 'A'.
//Find All contact whose birthday is today.
//Find all opportunities and sum and average of amount whose Stage is closed won
//Find all opportunities whose Stage is closed won and amount is greater than $20,000.
//Find name of all contacts in ascending order whose phone number is not mentioned.
//Find not more than five records from contact whose birthday is today, gender is Male and email is not mentioned.
//Find Name of all contacts along with Account Name and website.
// Find Name for all accounts whose industry is media, and for each account returned, returns the last name of every contact whose created-by alias is 'x.'
public class Query {
     /*public static void main(){
        List<Contact> conList = [Select id,Name,Birthdate from Contact where Birthdate=today];
        for(Contact con:conList){
           system.debug('Contact detail:--'+con);  
        }*/
    
      /*  public static void main1(){
            List<AggregateResult> agg = [Select Name,sum(Amount)a,Avg(Amount)b from Opportunity Where StageName='Closed Won' group by name];
            for(AggregateResult aggre:agg){
                system.debug('sum:----'+aggre);
            }
        }*/
  /*  public static void main3(){
        List<Opportunity> oppList = [Select id,name,amount from Opportunity where stageName='Closed Won' And Amount>20000];
        for(Opportunity opp:oppList){
            system.debug('Amount:-----'+opp);
        }       
    }*/
  /*  public static void main4(){
        List<Contact> conList = [Select id,name,phone from Contact where phone=null order by name ];
         for(Contact con:conList){
            system.debug('Phone:-----'+con);
        }       
    }*/
   /* public static void main5(){
        List<Contact> conList = [Select id,name,birthdate from Contact where Birthdate=today And Salutation='mr.' And email=null];
         for(Contact con:conList){
            system.debug('Phone:-----'+con);
        }       
    }*/
    public static void main6(){
        List<Account> accList = [Select name,(Select lastName from contacts where Createdby.Alias='Bharat') from Account where Industry='Media'];
         for(Account acc:accList){
            system.debug('Phone:-----'+acc.contacts);
        }       
    }
   }