//Write a program to calculate HCF of Two given number.

public class Number9 {
    public static void main(){
         integer dividend=25;
        integer divisor=4;
        integer r;
        integer hcf=0;
        while(divisor>0){
            hcf=divisor;
            r=math.mod(dividend, divisor);
            dividend=divisor;
            divisor=r;           
        }
        if(r==0){
            system.debug('hcf----'+divisor);
        }
        
    }
}