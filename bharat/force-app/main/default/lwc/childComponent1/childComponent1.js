import { LightningElement } from 'lwc';

export default class ChildComponent1 extends LightningElement {

    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'));
    }
    handleSub(){
        this.dispatchEvent(new CustomEvent('sub'));
    }
}