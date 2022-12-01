//Update all Opportunity with future CloseDate by Opportunity Name=Opportunity Name + 'F'

public class Question_6 {
    public static void main(){
        list<opportunity>updatedList=new list<Opportunity>();
         List<Opportunity> oppList = [select id,name from Opportunity where closedate>:date.today()];
        for(Opportunity opp:oppList){
            opp.Name = opp.Name +'F';
         //   opp.closeDate = Date.today()+12;
            updatedList.add(opp);
        }
        update updatedList;
        System.debug(updatedList);
    }
}