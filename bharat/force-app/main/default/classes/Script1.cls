//Create 10 Contacts with diferent Account(LookUp) values(Relationship with no same 2 accounts) in them.
//Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.

public class Script1 {
    public static void main(){
      /*  List<Account> accList = [select id,name from Account limit 10];
       List<Contact> conList = new List<Contact>();
        for(Account acc:accList){
            Contact con = new Contact();
            con.firstName='Anjali';
            con.LastName='kumar';
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
        system.debug('Contact:---'+conList);  */
        
       List<Opportunity> oppList = new List<Opportunity>();
        for(integer i=0;i<10;i++){
            Opportunity opp = new Opportunity();
            opp.Name='IAS';
            opp.Amount= 30000;
            opp.StageName='Closed Won';
            opp.CloseDate=system.today()+12;
            opp.Description='IAS is very higher Position';
            oppList.add(opp);
        }
        insert oppList;
        system.debug('Opportunity record-----'+oppList); 
 //------------------------------------------------------------------------------------      
//Create 5 Products with different Product Names, Discrption & Family.

  /*List<product2> proList =new List<product2>();
        for(integer i=0;i<5;i++){
            Product2 pro = new Product2();
           pro.Name='Realme 3s'+i;
            pro.Description='It is very good Mobile';
            pro.Family='none';
            proList.add(pro);           
        }
        insert proList;
        system.debug('Product-----'+proList);  */
 //-----------------------------------------------------------------------------------------------------------------------       
// Display the current salesforce user details 'Name', 'Number' & 'EmailId' and Current Company information.

 /*      system.debug(userinfo.getUserName());
       system.debug(userinfo.getProfileId());
       system.debug(userinfo.getUserEmail());
       system.debug(userinfo.getOrganizationName()); */
//-----------------------------------------------------------------------------------
//Delete all contacts belonging to Accounts Name FIELD having 'A' in them.   

  /*      List<Contact> conList = [select id,name,Account.name from Contact where Account.Name Like 'A%' ];
        delete conList; */
//------------------------------------------------------------------------------------------------------------------      
//Update all Opportunity with future Closed Date by Opportunity Name=Opportunity Name + ' Updated'
        
   /* List<Opportunity> oppList =[Select id ,name,closedate from Opportunity];
        for(opportunity opp:OppList){
            opp.Name=opp.Name + 'Updated';
            opp.CloseDate=opp.CloseDate+12;
        }
        update oppList;  */
// "Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'".

    /*    List<Account> accList = [Select Name from Account];
        for(Account acc:accList){
            system.debug('Reverse:---'+acc.Name.reverse());
        }   */
//-------------------------------------------------------------------------------------------------------------
//Write a script to get all the Account having more than 10 opportunities whose status is closed won 
//and the close date is between one month..   

    /*    List<Account> accList = [select name,(select name,stageName,closedate 
                                            from Opportunities where stageName='Closed Won' 
                                             And closedate>2022-07-01 And closedate<2022-07-30)  from Account];
        for(Account acc:accList){
            for(Opportunity opp:acc.Opportunities)
            {
                system.debug(opp);
            }
            system.debug(acc.Name);
        }    */
        
//Write a script to get all the opportunity name if opportunity' account name is same as the ContactRole Account name 
 //   and Opportunity is Closed won or closed lost.  

    /*    List<opportunity> oppList = [Select name,Account.Name,(select id,contact.Account.name from OpportunityContactRoles) 
                                     From Opportunity where stageName='Closed Won' or stageName='Closed lost'];
        for(Opportunity opp:oppList){
            for(OpportunityContactRole opcr:opp.OpportunityContactRoles){
                if(opp.Account.Name==opcr.contact.Account.Name){
                    system.debug(opp.Name);
                }
            }
        }   */
        
    }
}