public class ExceptionHandling {
    public static void check(){
        try{
            Account acc = new Account();
            insert acc;
        }catch(DmlException e){
            system.debug('exception error:---' +e.getMessage());
            system.debug('exception error:---' +e.getCause());
            system.debug('exception error:---' +e.getLineNumber());
            system.debug('exception error:---' +e.getStackTraceString());
        }finally{
            system.debug('exception error:---BhRAT' );
        }
    }
}