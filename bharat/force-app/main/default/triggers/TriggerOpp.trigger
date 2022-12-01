trigger TriggerOpp on Opportunity (After insert,After update) {
List<Task> tsList = new List<Task>();
    for(Opportunity o:trigger.new){
        if(o.StageName=='Closed Won'){
            Task t= new Task();
            t.Subject='Email';
            t.WhatId=o.id;
            tsList.add(t);
        }
    }   
    insert tsList;
}