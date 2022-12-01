({
	doInit : function(component, event, helper) {
		var action = component.get('c.fetchObj');
        action.setCallback(this,function(response){
            //console.log('names'+response.getReturnValue());
            component.set('v.objName',response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    getDetails:function(component, event, helper) {
		var action1= component.get('c.getAllfields');
        action1.setParams({
            objectName:component.find('objId').get('v.value')
        });
        action1.setCallback(this,function(response){
            component.set('v.fieldName',response.getReturnValue());
        });
        $A.enqueueAction(action1);
    }
})