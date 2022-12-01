import { LightningElement,track , wire } from 'lwc';
import getAccount from '@salesforce/apex/lWCSheet6.getAccount';


export default class CheckBoxAccount extends LightningElement {

@track accList;
@track showAccount=false;

@wire(getAccount)
getAccountList({data,error}){
    if(data){
        this.accList=data;
    }
    else if(error){
        console.log('error')
    }
}

handleclick(event){
    this.showAccount=event.target.checked
}

}