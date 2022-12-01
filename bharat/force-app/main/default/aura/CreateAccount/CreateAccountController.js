({
    /*	onClick : function(component, event, helper) {
		var action= component.get('c.getAccount');
        action.setParams({
            acc:component.get('v.accList')
        });
        alert("inserted");
        $A.enqueueAction(action);
	}   */
    
    /*    onClick : function(component, event, helper) {
      var action = component.get('c.getAccount');
        action.setCallback(this,function(response){
            component.set("v.accList",response.getReturnValue())
            
        });
        $A.enqueueAction(action);
    }        
    */
    
    onClick:function(component, event, helper) {
        component.set("v.name1",component.get('v.name'));
        component.set("v.phone1",component.get('v.phone'));
    }
})