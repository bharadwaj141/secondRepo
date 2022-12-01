//Schedule the above class to run 4 times every day at after every 6 hours. 

public class BatchSheet5 implements Schedulable {
    public void execute(SchedulableContext bc){
        BatchSheet4 b = new BatchSheet4();
        database.executeBatch(b);
        
    }
}