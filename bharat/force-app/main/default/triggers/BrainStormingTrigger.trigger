trigger BrainStormingTrigger on Contact (Before insert) {
    if(trigger.isBefore && trigger.isInsert){
        BrainStorming.main(trigger.new );
    }
}