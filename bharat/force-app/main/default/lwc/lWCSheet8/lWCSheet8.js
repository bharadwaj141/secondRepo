import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import contactFirstName from '@salesforce/schema/Contact.FirstName';
import contactLastName from '@salesforce/schema/Contact.LastName';
import contactPhone from '@salesforce/schema/Contact.Phone';
import contactEmail from '@salesforce/schema/Contact.Email';
import accountFieldId from '@salesforce/schema/Contact.AccountId';

export default class LWCSheet8 extends LightningElement {

    objectApiName = CONTACT_OBJECT;
    fields = [contactFirstName,contactLastName,accountFieldId,contactPhone,contactEmail];

    handleClick(){
        window.alert('Created Successfully');
    }

}