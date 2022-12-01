//On Opportunity do not let the user insert Opportunities with past closed Date with following Message
// "Please enter a future Closed Date"

trigger TriggerSheetQ2 on Opportunity (before insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        for(Opportunity opp:Trigger.new){
            if(opp.closedate<=system.today()){
                opp.addError('Please Enter a future date');
            }
        }
    }
}