/*Create a CheckBox with 'Allow Multiple' on Account Object when this CheckBox is Checked user can create Multiple Contacts
 *  within its Account associated and when it is UnChecked user cannot able to create Multiple Contacts.  */
        
    trigger TriggerSheetQ21 on Contact (before insert) {
    integer count=0;

    set<id> sid= new Set<id>();
    for(Contact c:trigger.new){
      sid.add(c.accountid);
        }               
    List<Account> accList=[select id,Allow_multiple__c,(select id from contacts) from account where id in:sid];
    for(Account a:accList){
        for(Contact cont:a.contacts){
            if(a.Allow_multiple__c==false){
                count++;
            }
        }}
    for(Contact c1:trigger.new){
              if(count!=0 ){
            c1.adderror('Check "Allow Multiple" User can create multiple');       
             }
    }
}