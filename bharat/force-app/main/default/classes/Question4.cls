public class Question4 {
    public static void main(){
        Account acc=new Account();
        acc.name = 'demo 6';
        acc.BillingCity='moscow';
        //insert acc;
        List<Contact> conList = new List<Contact>();
        for(Integer i=1;i<6;i++){
            Contact con = new Contact();
            con.LastName = 'demo'+i;
            //con.AccountId=acc.Id;
           
                conList.add(con);
        } 
        //insert conList;
        
        String userName = [Select Id,Name From User Where Id =: UserInfo.getUserId()].Name;
        System.debug('userName ' + userName);
    }
}