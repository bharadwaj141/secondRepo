import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/lWCSheet6.getAccount';


const columns=[
    {label:'AccountName',fieldName:'Name'},
    {label:'ID' ,fieldName:'Id'}
];

export default class LWCSheet6 extends LightningElement {

    @track columns=columns;
    @track data=[];

    @wire(getAccount)
    Account({data,error})
    {
        if(data){
            this.data=data;
        }
        else if(error){
            console.log('error');
        }
    }
  
}