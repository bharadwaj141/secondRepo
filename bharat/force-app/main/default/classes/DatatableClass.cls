public with sharing class DatatableClass {
    @AuraEnabled(cacheable=true)
    public static List<opportunity> getOpportunity() {
        System.debug(' inside in class method ');
       List<opportunity> oppList = [select Id,Name,Closedate,StageName from opportunity Limit 50];
       System.debug(' data --> '+oppList.size());
       return oppList; 
    }
}