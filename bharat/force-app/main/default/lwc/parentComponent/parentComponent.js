import { LightningElement } from 'lwc';


export default class ParentComponent extends LightningElement {
 
    num=0;
    increment()
    {
        this.num++;
    }
    decrement(){
        this.num--;
    }
}