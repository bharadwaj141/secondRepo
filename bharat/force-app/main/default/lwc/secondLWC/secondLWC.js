import { LightningElement } from 'lwc';
import UserPreferencesShowStateToGuestUsers from '@salesforce/schema/User.UserPreferencesShowStateToGuestUsers';
import { showToastEvent } from 'lightning/platformShowToastEvent';

export default class SecondLWC extends LightningElement {
    mytitle='hello cloud';
    handleClick(){
      
      this.ShowToast(this.mytitle);
    }

    ShowToast(myArgument){
        const event= new this.ShowToastEvent({title:myArgument,message:'i am dehradun',variant:'Success' });
        this.dispatchEvent(event);
    }
}