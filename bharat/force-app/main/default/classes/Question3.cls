public class Question3 {
    public static void main(){
        List<Opportunity> oppList = new List<Opportunity>();
            for(Integer counter=1;counter<6;counter++)
            {
                Opportunity opp = new Opportunity();
                opp.Name = 'demo'+counter;
                opp.StageName = 'closedwon';
                opp.CloseDate = date.today();
                oppList.add(opp);
            }
        insert oppList;
    }
}