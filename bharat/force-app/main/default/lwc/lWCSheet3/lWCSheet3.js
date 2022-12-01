import { LightningElement, api } from 'lwc';
import getOpportunity from '@salesforce/apex/lWCSheet3.getOpportunity'


export default class LWCSheet3 extends LightningElement {

    @api recordId
    closeDate

    // handleclick(event){
    //     this.closeDate = event.target.value
    //  //   console.log(this.closeDate)

    //     getOpportunity({oppId: this.recordId, closeDateOpp:this.closeDate}).then(result=>{


    //        } )
    //        .catch(error => {
    //            console.log("Error is here" + JSON.stringify(error))
    //        })



    // }

    handler(event) {
        this.closeDate = event.target.value
    }
    handleclick() {
        
        getOpportunity({ oppId: this.recordId, closeDateOpp: this.closeDate })
        .then(result => {
            console.log('success')

        })
            .catch(error => {
                console.log("Error is here" + JSON.stringify(error))
            })

        setTimeout(() => {
           // alert('error');
            eval("$A.get('e.force:refreshView').fire()");
        }, 1000);

    }


}