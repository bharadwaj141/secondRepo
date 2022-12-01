import { LightningElement } from 'lwc';

export default class FirstLWC extends LightningElement {

    myname ="hello Friends.";

    connectedCallback(){
        var act="hello India";
        window.alert("Action Name :" +act);

        handleClick()
            window.alert("Hello Cloud Analogy");
        
}
    }