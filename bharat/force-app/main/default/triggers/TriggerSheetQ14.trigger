//"Please solve the script question first.
//Script - 
//Create an Object ""Event"" (Name Default field and ""Event Date"" Date time field). Another Junction Object ""Event Participant"" with 3 fields
//1. lookup Contact
//2. lookup Event
//3. multipicklist (""Attendee Contact"", ""Presenter Contact"",""Organizer Contact"")
//Write a script to create 10 ""Event Participant"" with Attendee picklist, 4 with Presenter, 2 with organizer.
//Write a trigger to make sure No Event is having the same Contact registered as Attendee twice
//Explanation : A user is not allowed to create Two Event participant with same contact Lookup value under same Event ."

trigger TriggerSheetQ14 on Event_Participant__c (before insert) {
    Set<Id> eid=new set<id>();  
    set<Id> conid=new set<id>();

    for(Event_Participant__c ep:trigger.new){
        
        eid.add(ep.event__c);
        
    }
        List<Event_Participant__c> eplist=[select contact__c from Event_Participant__c where Event__c in:eid];
    for(Event_Participant__c e:eplist){
        conid.add(e.contact__C);
    }
         for(Event_Participant__c ep1:trigger.new){
        
             if(conid.contains(ep1.contact__c)){
                 ep1.adderror('Participant already registered');
       }        
   }        
}