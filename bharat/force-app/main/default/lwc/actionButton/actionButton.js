import { LightningElement,api,track,wire} from 'lwc'; 
import getCustomer from '@salesforce/apex/createStripeCustomer.getCustomer';



export default class ActionButton extends LightningElement {
  @api recordId;
  @track customerId;
  @track  customerName;

  @wire(getCustomer,{recordId:'$recordId'})
  getStripeData({data,error}){
  if(data){
   
    this.customerId=data[0];
    this.customerName=data[1];
  }
  else {
      console.log('Error');
  }
  }

  connectedCallback(){
      console.log(this.recordId);
  }

}