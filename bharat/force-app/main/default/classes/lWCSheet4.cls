public with sharing class lWCSheet4 {
    public static List<String> getObject() {
        List<string> names = new List<string>();
        List<schema.sObjectType> objName = schema.getGlobalDescribe().values();
        
        for(sObjectType s:objName){
            names.add(s.getDescribe().getName());
        }
        names.sort();
       //system.debug(names);
        return names;
    }
}