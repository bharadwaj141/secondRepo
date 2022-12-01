public class Question_9 {
    public static void main(){
        Account acc = new Account();
        acc.Name = 'Ravi';
        acc.Phone='368557474';
        acc.AnnualRevenue=30000;
        insert acc;
        List<Contact>conList=new List<Contact>();
        for(integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.FirstName='Raja';
            con.LastName='Kumar'+i;
            con.Department='computer Science';
             conList.add(con);
        }
        insert conList;
        
    }
}