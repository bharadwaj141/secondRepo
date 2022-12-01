public class Question_8 {
    public static void main(){
        List<contact> conList = [select id,name,Account.name from contact where Account.name like '%B%' limit 2];
        
            delete conList;
    }
}