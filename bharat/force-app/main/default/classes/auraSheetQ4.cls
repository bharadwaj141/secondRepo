public class auraSheetQ4 {
    @Auraenabled
    public static List<string> fetchObj(){
        List<string> names = new List<string>();
        List<schema.sObjectType> objName = schema.getGlobalDescribe().values();
        
        for(sObjectType s:objName){
            names.add(s.getDescribe().getName());
        }
        names.sort();
       //system.debug(names);
        return names;
        
    }
    @Auraenabled
    public static List<String> getAllfields(String objectName){
        List<string> allFields = new List<string>();
        
        Map<string,schema.SObjectType> objectMap = schema.getGlobalDescribe();
        SObjectType objType= objectMap.get(objectName);
        
        Map<String,Schema.SObjectField> objTypeFields = objType.getDescribe().fields.getMap();
        if(!objTypeFields.isEmpty()){
            for(String fieldName:objTypeFields.keySet()){
                String fieldLabel = objTypeFields.get(fieldName).getDescribe().getLabel();
                allFields.add(fieldLabel);
            }
        }
        system.debug('fields : '+allFields);
        return allFields;
    }
}