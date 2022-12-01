import { LightningElement } from 'lwc';

export default class DdnParentComponent extends LightningElement {

    handleclick(){

       this.template.querySelector('c-ddn-child-component').handleChangeValue();

    }

}