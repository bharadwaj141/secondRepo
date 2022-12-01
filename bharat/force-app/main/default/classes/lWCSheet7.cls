public class lWCSheet7 {
    @AuraEnabled
    public static Integer getContact(String Username,String Password) {
        integer count=0;
    List<contact> conList= [select Id,Username__c,Password__c from Contact where Username__c=:Username And Password__c =: Password ];
    for(contact con:conList){
        if(conList.size()>0)
        count++;
    }
      return count;    
}
}