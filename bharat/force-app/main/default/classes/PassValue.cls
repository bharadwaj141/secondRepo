public class PassValue {
    /*public void mainValueMethod(){
        String websiteUrl='www.salesforce.com';
        system.debug('before call-'+websiteUrl);
        passByValueCall(websiteUrl);
          system.debug('After call-'+websiteUrl);
        
    }
    private void passByValueCall(String webSiteUrlValue){
        websiteUrlValue='www.utube.com';
    }*/
    public void mainValue(){
      Account a=new Account();
        a.Name='bharat';
        a.Website='www.salesforce.com';
        system.debug('before call-'+a);
        passByReferenceCall(a);
          system.debug('After call-'+a);
        
    }
    private void passByReferenceCall(Account a){
        a.Website='www.utube.com';
    }
}