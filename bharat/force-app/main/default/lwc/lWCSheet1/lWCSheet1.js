import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';


export default class LWCSheet1 extends LightningElement {

    accountObject = ACCOUNT_OBJECT;
    myFields = [NAME_FIELD, WEBSITE_FIELD];
    
    handleAccountCreated(){
        // Run code when account is created.
        window.alert('Account Created');
        setTimeout(()=> {
            eval("$A.get('e.force:refreshView').fire()");
        },2000);
    }
}