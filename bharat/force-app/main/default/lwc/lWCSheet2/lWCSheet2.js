import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/lWCSheet1.getAccount';
import getContact from '@salesforce/apex/lWCSheet1.getContact';
import getOpportunity from '@salesforce/apex/lWCSheet1.getOpportunity';


export default class LWCSheet2 extends LightningElement {

    @track acc;
    @track con;
    @track currentAccountId ;
    @track opp;

    connectedCallback(){
        getAccount()
        .then(result => {
            if(result){
        this.acc = result;
        console.log('Account List-->'+this.acc);
            }
        }
        )
    }
    
    onAcNameClickHandler(event){
        console.log(event.target.value)
        this.currentAccountId = event.detail.value;
        this.getContactList()
        this.getOpportunityList()

    }

    
    getContactList(){

        getContact({accId: this.currentAccountId})
        .then(result => {
            if(result){
        this.con = result;
        console.log('con List-->'+this.con);
            }
        }
        )
    }
   
    getOpportunityList(){

        getOpportunity({accId: this.currentAccountId})
        .then(result => {
            if(result){
        this.opp = result;
        console.log('opp List-->'+this.opp);
            }
        }
        )
    }

    

      
}