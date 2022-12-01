//Write a trigger on Opportunity to create a new Case with all case fields 
//should have default values whenever an Opporutnity is getting closed lost.

trigger TriggerSheetQ12 on Opportunity (after insert) {
       for(Opportunity opp1:trigger.new){       
        if(opp1.Stagename=='Closed lost'){
            Contact con= new Contact();
            con.LastName='Trigger';
            con.AccountId=opp1.AccountId;
            insert con;
            
            case ca= new case();
              ca.AccountId=opp1.AccountId;
              ca.ContactId=con.id;
              ca.Origin='Email';
    
            Insert ca;
        } 
            
        }    
}