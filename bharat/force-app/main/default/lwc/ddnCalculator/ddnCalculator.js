import { LightningElement } from 'lwc';

export default class DdnCalculator extends LightningElement {
   result=0;
   n1;
   n2;

    handleclick1(event){
     this.n1=event.target.value;
    }
   
    handleclick2(event){
        this.n2=event.target.value;
    }

    handleAdd(){
        this.result=parseInt(this.n1)+parseInt(this.n2);
    } 
    handleSub(){
        this.result=parseInt(this.n1)-parseInt(this.n2);
    }
    handleMul(){
        this.result=parseInt(this.n1)*parseInt(this.n2);  
      }
    handleDiv(){
        this.result=parseInt(this.n1)/parseInt(this.n2);
    }
}