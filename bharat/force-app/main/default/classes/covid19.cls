public class covid19 {
     public Integer City=0;
    public static Integer Country=0;
    
    public covid19(Integer NumberOfCity){
        this.City=NumberOfCity;
        Country +=City;
    }
    public void covid(){
        Country++;
        City++;
        
    }
     public Integer display(){
            return City;
            
        }
    public static Integer add(){
        return Country;
    }
    
}