//Create custom object Name as 'Time'.Create Two Fields Start_date and End_Date datatype as date 
//Create a Relation between Contact(Parent) and Time(Child) Object. Write a Trigger whenever a Time record will be inserted or 
//updated which name Starts with "A" and End Date exist in last month then It will create or 
//update. contact record last name with same name as time record. 


public class TimeObject {
    public static void main(List<Time__c> tList){
        List<Contact> conList = new List<Contact>();
        for(Time__c timeObj : tList){
            Integer previousMonth = timeObj.End_Date__c.month();
            if((timeObj.Name.startsWith('A') || timeObj.Name.startsWith('a')) && previousMonth == date.today().month() - 1 && timeObj.Contact__c != null){
                Contact con = new Contact();
                con.Id = timeObj.Contact__c;
                con.LastName = timeObj.Name + ' Time';
                conList.add(con);
            }
        }
        update ConList;        
    }

    
    
}