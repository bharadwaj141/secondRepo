({
	onClick : function(component, event, helper) {
		var map=[];
        for(var i=0;i<10;i++){
              map.push({ 
            key:i,
            value: "aman" +i
        });
        }
      
        component.set('v.map',map);
	}
})