trigger contactRoleTrigger on OpportunityContactRole (After insert) {
    if(trigger.isInsert && trigger.isAfter){
        
        CaseCreate.main(trigger.new);
        System.debug('in trigger ');
        
    }
}