({
	handleClick : function(component, event, helper) {
		var uname = component.get("v.uname");
        var upass = component.get("v.password");
        var action = component.get('c.getContact');
        
        action.setParams({
            username:uname,
            password:upass
        }),
         action.setCallback(this, function(a){
            alert(a.getReturnValue());
         });
           $A.enqueueAction(action);
       
	}
})