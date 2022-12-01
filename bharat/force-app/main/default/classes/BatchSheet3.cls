public class BatchSheet3 {
    public static void main(){
        
         List<CronTrigger> JOBIDLIST = [select id from CronTrigger where CronJobDetail.name='Asynch 5'];
             
               for(CronTrigger job:JOBIDLIST )
                  {
                       System.abortJob(job.id);
                  }
    }
}