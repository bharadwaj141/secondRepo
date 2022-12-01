({
	AddClick : function(component, event, helper) {
        var number1 = component.get('v.input1');
		var number2 = component.get('v.input2');
        component.set('v.Result',parseInt(number1)+parseInt(number2))
	},
    SubClick : function(component, event, helper) {
		var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
          component.set('v.Result',parseInt(number1)-parseInt(number2))
	},
    MultiClick : function(component, event, helper) {
		var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
          component.set('v.Result',parseInt(number1)*parseInt(number2))
	},
    DivClick : function(component, event, helper) {
		var number1 = component.get('v.input1');
        var number2 = component.get('v.input2');
          component.set('v.Result',parseInt(number1)/parseInt(number2))
	}
})