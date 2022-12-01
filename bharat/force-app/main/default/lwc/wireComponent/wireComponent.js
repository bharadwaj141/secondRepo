import { LightningElement,wire,track } from 'lwc';
import getAccount from '@salesforce/apex/ddnWireClass.getAccount'

const columns=[
    {label:'Account Ka Name',fieldName:'Name'},
    {label:'Account Id',fieldName:'Id'}
];
export default class WireComponent extends LightningElement {
 @track columns=columns;
 @track data=[];

 @wire(getAccount)
 ddnAccount({data,error}){
    if(data){
        this.data=data;
    }
    else if(error){
        console.log('eror occured while retriving data');
    }
 }
}