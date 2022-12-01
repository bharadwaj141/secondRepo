//Create an aura component that will display a table of Account details with a sorting option with JS and Apex.

public class AuraSheet7 {
@Auraenabled
    public static List<Account> getAccount(){
        List<Account> acclist = [select Name,AccountSource,AnnualRevenue,Industry FROM Account where Industry!=null  LIMIT 50 ];
        return accList;
    }
    
}