trigger TimeTrigger on Time__c (After Insert,After Update) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            TimeObject.main(Trigger.new);
        }
    }
      
}