public with sharing class ramSirTask {
    @AuraEnabled(cacheable=true) 
    public static List<Opportunity>  fetchOpportunity(){
        List<Opportunity> oplist=[select id,name,closedate,amount,account.name,stagename from Opportunity where accountid!=null order by name limit 10];
      return oplist;
    }

    @auraEnabled
    public static List<Opportunity> Stage(List<string> stage)
    {
 
       List<Opportunity> opplist=[select id,name,closedate,amount,account.name,stagename from Opportunity where stagename in:stage and accountid!=null order by name limit 10];
       return opplist;
    }

    @auraEnabled
    public static void deleteOpp(id oppid)
    {
       List<Opportunity> oppdel=[select id from Opportunity where id =:oppid];
       delete oppdel;
    }

    @auraEnabled(cacheable=true)
    public static List<string> StageList()
    {
       List<string> stageList= new List<String>();
       String objectName = 'Opportunity';
       String fieldName ='StageName';
       Schema.SObjectType s = Schema.getGlobalDescribe().get(objectName) ;
       Schema.DescribeSObjectResult r = s.getDescribe() ;
       Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
       Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
       List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
       for( Schema.PicklistEntry pickListVal : ple)
       {
          stageList.add(pickListVal.getValue());
       }  
    return stageList;
    }
}