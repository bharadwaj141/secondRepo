import { LightningElement,track,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/DatatableClass.getOpportunity';

const columns = [
    { label: 'ID', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'Text' },
    { label: 'StageName', fieldName: 'StageName', type: 'PickList' },
    { label: 'CloseDate', fieldName: 'CloseDate', type: 'Date' },
];
export default class DataTable extends LightningElement {

    @track data = [];
    @track columns = columns;

    @wire(getOpportunity)
     Opportunity({data,error}){
        if(data){
            this.data = data;
        }
        else if(error){
            console.log('error');
        }
     }

}