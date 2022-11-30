({
    doInit : function(component, event, helper) {
        var action= component.get("c.getAccount");
        action.setCallback(this,function(response){
            component.set('v.accList',response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    AccountChange :function(component, event, helper) {
        var action1= component.get("c.getContact");
        var action2= component.get("c.getOpportunity");
        action1.setParams({
            accId:component.get('v.AccountId')
        });
        action2.setParams({
            accId:component.get('v.AccountId')
        });
        action1.setCallback(this,function(response){
            component.set('v.conList',response.getReturnValue());
        });
        action2.setCallback(this,function(response){
            component.set('v.oppList',response.getReturnValue());
        });
        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
    }  
})