/* "Script - 
Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field). 
Another Junction Object ""Event Participant"" with 3 fields
1. lookup Contact
2. lookup Event
3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer.
Trigger - 
Write a trigger to stop creating ""Event Participant"" if a Contact is registering for 2 Events happening in Same day ie. 
Event Date is same."   */

trigger TriggerSheetQ15 on Event_Participant__c (before insert) {
      set<id> con= new Set<id>();
        set<id> tim= new Set<id>();

    for(Event_Participant__c newEvp:trigger.new){
        con.add(newEvp.Contact__c);
 tim.add(newEvp.Event__c);
    }  
        List<Event__c> etime=[select Event_date_time__c from Event__c where id in:tim];
        List<Event_Participant__c> eptp=[select event__r.Event_date_time__c from Event_Participant__c where contact__c in:con];

    for(Event__c evt:etime){
    
    for(Event_Participant__c e:eptp){
  
      for(Event_Participant__c newEvp2:trigger.new){
       if(evt.Event_date_time__c.format('dd:MM:yyyy')==e.event__r.Event_date_time__c.format('dd:MM:yyyy'))
       {      
           newEvp2.adderror('Already scheduled for another event on that day');
       }
      }}}
}