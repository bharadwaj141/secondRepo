public class Question2 {
    public static void main(){
        List<Contact> conList = new List<Contact>();
        for(Integer counter=1;counter<=5;counter++)
        {
            Contact con = new Contact();
            con.lastName = 'demo'+counter;
            con.Email = 'demo@gmail.com';
            conList.add(con);
        }
        insert conList;
    }
}