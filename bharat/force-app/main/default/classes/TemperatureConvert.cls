@isTest
public class TemperatureConvert {
@isTest
    public static void add(){
        Convert c = new Convert();
        decimal s=c.main(50.00);
        system.assertEquals(9.9, s,'false');

    }
}