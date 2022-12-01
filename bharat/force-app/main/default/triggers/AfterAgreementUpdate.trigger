trigger AfterAgreementUpdate on Agreement__c (After Update) {
      if(trigger.isUpdate){
    BrainS7class.main2(trigger.new);
    }
    
    
    }