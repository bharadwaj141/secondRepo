import { LightningElement,track } from 'lwc';

export default class TrackComponent extends LightningElement {

@track fullName={firstname:"",lastname:""}

handleclick(event){
    const field = event.target.name;
    if(field==='firstname'){
        this.fullName.firstname = event.target.value;
    }
    else if(field==='lastname'){
        this.fullName.lastname = event.target.value;
    }
}
}