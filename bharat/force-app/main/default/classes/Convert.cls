public class Convert {
    public  Decimal main(Decimal f){
        
        Decimal c;
        c= (f-32)*0.55;
        return c.setScale(2);       
    }
}