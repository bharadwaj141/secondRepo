//On Contact to update the Account Name field with contact Last Name, concatenated in the end. 
//Example: If you Create A Contact whose FirstName='Sarthak' and LastName='Saxena' and the Accountname ='Tata',
//Then Account name must become 'TataSaxena'.
//-------------------------------------------
//Update the above trigger to delete the Last Name from the Account field 
//when a Contact is deleted without deleteing the other Last name.

trigger TriggerSheetQ4 on Contact (after insert,before delete) {
    if(Trigger.isAfter && Trigger.isInsert){
        string a;
        Set<id> sid = new Set<id>();
        for(Contact con:Trigger.new){
            a=con.LastName;
            sid.add(con.AccountId);
        }
        List<Account> acc = [select id,name from Account where id IN:sid];
        for(Account ac:acc){
            for(Contact con:Trigger.new){
                if(con.AccountId==ac.id){
                 ac.name= ac.name +''+ a;
            }          
          }            
        }
        update acc;
    }
 //-----------------------------------   
     if( trigger.isBefore && trigger.isDelete){
      
             Set<id> cid= new set<id>();
         
         for(Contact c:trigger.old){
             
             cid.add(c.accountid);
         }
         List<Account> accList=[select name from account where id in:cid];
         for(account a:accList)
         {
             for(Contact c:trigger.old){
             String[] nam=a.name.split(c.LastName);                
             a.name=nam[0];            
            }         
         }
         update accList;
     }
    
}