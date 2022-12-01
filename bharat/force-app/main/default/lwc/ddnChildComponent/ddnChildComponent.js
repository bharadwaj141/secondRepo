import { api, LightningElement } from 'lwc';

export default class DdnChildComponent extends LightningElement {

     items='Welcome to salesforce';

    @api handleChangeValue(){
        this.items = 'Again Welcome';
    }
}