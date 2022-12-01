trigger OpportunityLineItemTrigger on OpportunityLineItem (before Update) {

    if(trigger.isBefore && trigger.isUpdate){
        OpportunityCheck.main(trigger.new);
    }

}