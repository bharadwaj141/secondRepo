public class BatchSheet2 implements Schedulable {

    public void execute(SchedulableContext sc){
        BatchSheet1 bc = new BatchSheet1();
        database.executeBatch(bc);
    }
}