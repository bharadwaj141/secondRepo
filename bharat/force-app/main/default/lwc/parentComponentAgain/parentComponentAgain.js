import { LightningElement } from 'lwc';

export default class ParentComponentAgain extends LightningElement {
    handleClick(){
        this.template.querySelector('c-child-component-again').handleValueChange();
    }
}