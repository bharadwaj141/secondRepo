({
	 handleChange: function (component, event) {
		 var selectedOptionValue = event.getParam("value");
        component.set("v.type", selectedOptionValue);
    },
    
      save : function (component, event, helper){
	 var name = component.get("v.name");
        var type = component.get("v.type");
        var annualRevenue = component.get("v.annualRevenue");
          if(name == undefined || type == undefined || annualRevenue == undefined)
        {
         helper.showToast('Ooops !', 'Please fill up all the information', 'error');
        }
        else
        {
             var action = component.get("c.saveAccount"); 
         action.setParams({
           name : name, 
           accountType : type,
           revenue : annualRevenue
            }); 
     action.setCallback(this,function(response){
     var state = response.getState();
         if(state === "SUCCESS")
         {
              helper.showToast('Success !', 'Record Inserted Successfully', 'success');
           $A.get("e.force:closeQuickAction").fire();
         }
       });
          $A.enqueueAction(action);
      }  
    },
    
    cancel : function(component, helper, event)
    {
         $A.get("e.force:closeQuickAction").fire();   
    }

})