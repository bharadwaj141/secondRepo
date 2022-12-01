public class accountCreate {
    @Auraenabled
        public static List<Account> getAccount(){

  //  public static List<Account> getAccount(Account acc){
    //    insert acc;
        return [select id,name,phone from Account limit 5];
    }
}