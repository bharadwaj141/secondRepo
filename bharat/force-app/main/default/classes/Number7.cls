//Write a program that reads a set of integers, and then prints the sum of the even and odd integers.

public class Number7 {
    public static void main(){
        integer[] arr = new integer[]{10,20,45,65,30};
            integer even=0;
        integer odd=0;
        for(integer i=0;i<5;i++){
            if(math.mod(arr[i], 10)==0){
                even= even+arr[i];             
            }
            else{
                odd= odd+arr[i];
            }
        }
          system.debug('Even no----'+even);
          system.debug('odd no----'+odd);
    }
}