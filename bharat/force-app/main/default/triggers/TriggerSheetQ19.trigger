/*"Script - 
Create a Script to find out all the users in the systems who are having more than 20 Leads allocated[Owner]
to them in month of Dec 2017
Trigger - 
Write a Trigger on lead to show error message when a lead is getting allocated[Owner] 
to a user when the Owner User has reached the limit of 30 Lead owner in a particular month."   */

trigger TriggerSheetQ19 on Lead (before insert) {
Integer count=0;
    List<Lead> l= [select id,owner.Name from lead where CreatedDate=THIS_MONTH];
    For(lead ld:l){
        if(ld.owner.name==userinfo.getName()){
        count++;
        } }
    for(Lead l1:trigger.new){
        If(count>30){
            l1.adderror('Limit exceeded');
        }
    }  
}