import { LightningElement,api } from 'lwc';

export default class ChildComponentAgain extends LightningElement {

    Name = 'Welcome To Cloud Analogy';
    @api handleValueChange(){
        this.Name = 'Dehradun Branch';
    }
}