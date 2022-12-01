import { LightningElement,track,wire } from 'lwc';
import fetchOpportunity from '@salesforce/apex/ramSirTask.fetchOpportunity';
import Stage from '@salesforce/apex/ramSirTask.Stage';
import StageList from '@salesforce/apex/ramSirTask.StageList';
import deleteOpp from '@salesforce/apex/ramSirTask.deleteOpp';

export default class SecondTaskByRamSir extends LightningElement {

    @track alldata = [];
    @track options = [];
    @track selectedValue = [];
    @track dropclick = false;
    @track allselect=false;
@track editrow=false;
@track recordId;
@track placevalue;
@track viewdetails=false;

// Get all data from org
@wire(fetchOpportunity)
showAll({ data, error }) {
    if (data) {
        this.alldata = data;
    }
    else if (error) {
        window.alert("ERROR");
    }
}

//Click on drop down icon
    dropClick() {
        this.allselect=false;
        this.dropclick = true;
        this.selectedValue = [];
    }

//Getting selected stage record
    @wire(StageList)
    stage({ data, error }) {
        if (data) {
            this.options = data;
        }
        else if (error) {
            window.alert("No data in StageName");
        }
    }

// On submit button
    Submit() {
        this.dropclick = false;

        if(this.selectedValue.length==0){
            oppList().then((res) => {
                this.alldata = res;
            });
        }
        else{
            Stage({ stage: this.selectedValue })
                .then((result) => {
                this.alldata = result;
            });
        }
    }

// On cancel button
    Cancel() {
        this.dropclick = false;
    }

// Changing checkboxes
    checkboxchange(event) {
        let nam = event.target.name;
        console.log("name" + nam)
        if (nam == "All stages") {
            if(event.target.checked){
                this.selectedValue=[];
                this.allselect=true;
                this.options.forEach(stage =>{
                    this.selectedValue.push(stage); 
                });
            }
            else{
                this.allselect=false;
                this.options.forEach(stage =>{
                    this.selectedValue = this.selectedValue.filter(item => item != stage);
                });
            }
            console.log(' Inside in checked all : > '+this.selectedValue);
        }

        if(nam !='All stages'){
            if (event.target.checked) {
                this.selectedValue.push(nam);
                console.log("all selected items   : " + this.selectedValue);
            }
            else {
                this.selectedValue = this.selectedValue.filter(item => item!= nam);
                console.log("all selected items   : " + this.selectedValue);
            }
        }
    }

    @track combooptions = [
		{
			label: "Edit",
			value: "Edit",
		},
		{
			label: "Delete",
			value: "Delete",
		},
		{
			label: "View",
			value: "View",
		},
	];

    handleTypeChange(event){
        try{
            
        let combo=event.target.value;
        this.recordId=event.target.name;
        this.placevalue='';
        console.log('record id'+this.recordId);
       
        if(combo=='Edit'){
        this.editrow=true;
       
        }
        if(combo=='Delete'){
            this.placevalue='';
            let opid=event.target.name;
            console.log("delete id >"+opid);
            deleteOpp({oppid:opid}).then(()=>{
                
                    const event = new ShowToastEvent({
                        title: 'Opportunity deleted',
                        message: 'Opportunity deleted',
                        variant: 'success',
                    });
                    this.dispatchEvent(event);
            });
            setTimeout(() => {
                window.location.reload();
            }, 500);
            }

            if(combo=='View'){
                this.placevalue='';
            this.recordId=event.target.name;
          this.viewdetails=true;

            }
        }catch(error){
            console.log(' error --> '+error);
        }
    }


    onsave(){
        setTimeout(() => {
            window.location.reload();
        }, 500);
    }

     oncancel(){
        setTimeout(() => {
            eval("$A.get('e.force:refreshView').fire()");
        }, 100);
     }
     backfromView(){
        setTimeout(() => {
            eval("$A.get('e.force:refreshView').fire()");
        }, 100);
     }
}