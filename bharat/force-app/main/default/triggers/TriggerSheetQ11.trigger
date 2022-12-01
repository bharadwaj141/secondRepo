//Write a Trigger to create a default Contact, Case, Opporunity and Contact Role. 
//whenever an Account is created with Number of Employees > 100.
//Make sure the Contact is in contact field of Case as well as related to Opporutnity inn Contact Role.

trigger TriggerSheetQ11 on Account (after insert) {
for(Account ac:trigger.new){
        if(ac.NumberOfEmployees>100){
            
        Contact con= new Contact();          
          con.lastname='Trigger11';
          con.accountid=ac.id;
             insert con;

        Opportunity opp= new Opportunity();
           opp.name='Trigger11';
           opp.accountid=ac.id;
           opp.stagename='Closed won';
           opp.closedate=system.today();
              insert opp;
            
           OpportunityContactRole ocr= new OpportunityContactRole();
             ocr.contactid=con.id;
             ocr.opportunityid=opp.id;
              insert ocr;

          case cs= new case();
            cs.contactid=con.id;
            cs.Accountid=ac.id;
            cs.Origin='Email';
              insert cs;
        }
        
    }

}