({
	doInit : function(component, event, helper) {
		var action= component.get("c.retrieveAccount");
        action.setCallback(this,function(response){
            component.set("v.accList",response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    onClick: function(component, event, helper) {
		var action1= component.get("c.createContact");
        action1.setParams({
            con:component.get("v.conList")
           
        });
        action1.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                alert("contact created");
            }
            else if(state==="ERROR"){
                alert("error");
            }
        });
        $A.enqueueAction(action1);
    }
})