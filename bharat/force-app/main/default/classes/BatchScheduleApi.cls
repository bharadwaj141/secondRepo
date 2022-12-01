public with sharing class BatchScheduleApi implements Schedulable{
    public void execute(SchedulableContext bc){
        ScheduleAPIClass b = new ScheduleAPIClass();
        database.executeBatch(b);
        
    }
}