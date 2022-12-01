({
	doInit : function(component, event, helper) {
		var action=component.get('c.getOpportunity');
	
        action.setParams({
            oppId: component.get('v.recordId'),
            close: component.get('v.Updatedate')
        });
        action.setCallback(this,function(response){
            $A.get('e.force:refreshView').fire();
        });
        
        $A.enqueueAction(action);
    }
    
})