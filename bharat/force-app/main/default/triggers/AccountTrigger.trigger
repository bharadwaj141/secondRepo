trigger AccountTrigger on Account (After update) {

//---------------------------------------------------------------    
//trigger AccountTrigger on Account (Before update,before Insert)
/* for(Account acc : Trigger.new){

  acc.ShippingState = acc.BillingState;
  acc.ShippingStreet = acc.BillingStreet;
  acc.ShippingCountry = acc.BillingCountry;
  acc.ShippingCity = acc.BillingCity;
}   */
//----------------------------------------------------------------
// Write a trigger on the Account when the Account is updated check all opportunities related to the account.
//  Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days
//   from today and stage not equal to close won.

/*  trigger AccountTrigger on Account (After update)
   set<Id> sid = new Set<Id>();
    for(Account acc:Trigger.new){
        sid.add(acc.Id);
    }
    
    List<opportunity> oppList = [select Id,stageName,AccountId from Opportunity where AccountId In:sid and CreatedDate<LAST_N_DAYS:30 and StageName!='Closed Won'];
    for(opportunity opp:oppList){
        opp.stageName='close Lost';
    }
    update opplist;     */
//---------------------------------------------------------------
//
    
}