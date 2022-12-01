public class Question1 {
    public static void main(){
        List<Account> accList = new List<Account>();
        for(Integer counter=1;counter<=5;counter++)
        {
            Account acc = new Account();
            acc.Name = 'Bharat'+counter;
            acc.Phone = '9204186288';
            acc.Rating ='hot';
            accList.add(acc);
        }
            insert accList;
        
    }
}