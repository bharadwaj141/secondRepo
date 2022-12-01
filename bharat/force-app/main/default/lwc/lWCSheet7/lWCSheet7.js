import { LightningElement,track } from 'lwc';
import getContact from '@salesforce/apex/lWCSheet7.getContact';
export default class LWCSheet7 extends LightningElement {

    @track Username;
    @track Password;
    @track num;

    handleuserchange(event){
      this.Username = event.target.value;
      console.log('this.Username')
    }
    handlepasschange(event){
        this.Password = event.target.value;
    }
    

    enter(){
        getContact({Username:this.Username , Password:this.Password})
        .then((contacts) =>{
             this.num=contacts;
            
        })
    }
    
      
        handleclick(){
           this.enter();
           if(this.num===1){
            window.alert('Succesfully')
           }
           else if(this.num===0){
            window.alert('not')
           }
        }
     

    

}