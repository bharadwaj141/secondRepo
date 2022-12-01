/*Q.2"Create Objects and fields as:
1. Flight
- Flight Number (Auto Number)(Pattern - FLI-{0000})
- capacity (Number)
2. Flight passenger
- Flight (Lookup)
- Passenger (Lookup)
- date of departure (Date)
- Section / picklist(first class, business class, economy class)
3. Passenger
- Name
- D.O.B. (Date)
- Age Group /Picklist- [Adult, Child, Infants]

Q2.1. Write a script to create 9 passengers with 3 different sections in 3 flights.
Q-2.2 Make Sure a passenger cannot board the same flight with multiple sections."
                                                                                            */

public class FlightPassenger {
    public static void main(){
        List<Passenger__c> pList = new List<Passenger__c>();
        for(integer i=0;i<9;i++){
            Passenger__c pass = new Passenger__c();
            pass.Name =  'Arjun'+i;
            pass.D_O_B__c= date.today();
            pass.Age_Group__c = 'Adult';
            pList.add(pass);
        }
        insert pList;
//-----------------------------------------------       
        List<id> lid = new List<id>();
          List<Passenger__c> pger = [select id,Name from Passenger__c];
        for(Passenger__c p:pger){
            lid.add(p.id);
        }
//------------------------------------------------        
        List<Flight__c> fList = new List<Flight__c>();
        for(integer j=0;j<3;j++){
            Flight__c fli = new Flight__c();
            fli.name = 'Indigo'+j;
            fli.capacity__c=100;
            fList.add(fli);
        }
        insert fList;
//--------------------------------------------------        
        List<id> sid = new List<id>();
        List<Flight__c> fgt =[select id from Flight__c];
        for(Flight__c f:fgt){
            sid.add(f.id);
        }
//------------------------------------------------------        
      
        List<Flight_Passenger__c> fpList = new List<Flight_Passenger__c>();
        
              Flight_Passenger__c fp = new Flight_Passenger__c();
               
                
                
                
            
        }
    }