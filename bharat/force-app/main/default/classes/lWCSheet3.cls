public  class lWCSheet3 {
    @AuraEnabled
    public static void getOpportunity(string oppId,date closeDateOpp) {
         opportunity opp =  [SELECT Id , CloseDate FROM Opportunity WHERE Id = :oppId];
         opp.Id = oppId;
         opp.CloseDate = closeDateOpp;
         update opp;
         
    }
}