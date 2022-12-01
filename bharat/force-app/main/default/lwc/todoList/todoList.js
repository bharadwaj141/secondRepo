import { LightningElement,track } from 'lwc';

export default class TodoList extends LightningElement {
   newName='' ;
   @track todoTask =[];

    ChangeValue(event){
       this.newName = event.target.value;
    }

    handleClick(event){
        this.todoTask.push({
            id : this.todoTask.length + 1,
            name : this.newName
        });
    }

    deleteTask(event){
       let deleteTask = event.target.value;
       let todoTask = this.todoTask;
       let todoTaskIndex;
          
       for(let i=0;i<todoTask.length;i++){
        if(deleteTask===todoTask[i].id){
            todoTaskIndex = i;
        }
       }

       this.todoTask.splice(todoTaskIndex,1);
    }

}