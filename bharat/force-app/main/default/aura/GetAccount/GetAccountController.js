({
    doInit : function(component, event, helper) {
        var action = component.get('c.getAccounts');
        action.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                var accountObject = response.getReturnValue();
                component.set('v.allAccount', accountObject);
                console.log('Account List :: '+accountObject);
            }
            else{
                console.log('Get a error there...');
            }
        });
        $A.enqueueAction(action);
    }
})