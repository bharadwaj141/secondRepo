public class BrainS7class {
    public static void main2(List<Agreement__c> agreeUpdate){
           List<Payment1__c> pay= new List<Payment1__c>();

        List<id> pid;
        set<Id> agrid= new set<id>();
 for(Agreement__c agree1:agreeUpdate){                 
     agrid.add(agree1.id);                 
        }
            
       List<Payment1__c> paylist=[select id from Payment1__c where Agreement__c in:agrid];
        delete paylist;
        
        
         for(Agreement__c agree2:agreeUpdate){

            for(integer i=0;i<integer.valueOf(agree2.Duration__c);i++){
            Payment1__c p= new Payment1__c();
            p.Agreement__c=agree2.id;
            p.Name=agree2.Name+' payment'+(i+1);
            p.Start_date__c=date.newInstance(agree2.CreatedDate.year(), agree2.CreatedDate.month(), agree2.CreatedDate.day()).addmonths(i);
         
            p.End_date__c=date.newInstance(agree2.CreatedDate.year(), agree2.CreatedDate.month(), agree2.CreatedDate.day()).addmonths(i+1);
            pay.add(p);
            }}
        
         
 insert pay;    
        
    }
    }