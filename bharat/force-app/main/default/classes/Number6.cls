public class Number6 {
    public static void main(){
        integer n=123456;
        integer remainder;
        integer temp=0;
        while(n>0){
            remainder = math.mod(n, 10);
            n=n/10;
            temp= (temp*10)+remainder;
         
        }
      System.debug(temp);     
    }
}