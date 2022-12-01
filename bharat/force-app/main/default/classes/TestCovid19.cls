@isTest
public class TestCovid19 {
         @isTest
    public static void test(){
        covid19 c = new covid19(6);
          c.covid();
        system.debug(c);
         Integer num=c.display();
       
        system.assertEquals(7, num,'Not');
        system.assertEquals(7, covid19.add(),'Not');
    }
}