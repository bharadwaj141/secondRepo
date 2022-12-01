trigger stopOpli on OpportunityLineItem (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        stopInsertingContact.main(trigger.new);
    }
}