public with sharing class Tasks extends fflib_SObjectDomain {
    public Tasks(List<Task> sObjectList) { super(sObjectList); }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) { return new Tasks(sObjectList); }
    }
    

    public override void onBeforeInsert(){
        validarTarefaEmAberto();
    }

    private void validarTarefaEmAberto(){
         Set<Id> caseIds = new Set<Id>();
    
    
        for(Task t : (List<Task>)Records){
            if(t.WhatId != null && t.WhatId.getSObjectType() == Case.getSObjectType()){
                System.debug(t.WhatId);
                caseIds.add(t.WhatId);
            }
        }

        

        if(!caseIds.isEmpty()){
            List<String> openCases = new List<String>{'Not Started', 'In Progress', 'Waiting on someone else'};
            Set<Id> casosComTarefasAbertas = new Set<Id>();
            TasksSelector tasksSelector = new TasksSelector();
            
            for(Task taskComCasosAbertos : tasksSelector.selectOpenTasksByCasesIds(caseIds)){
                casosComTarefasAbertas.add(taskComCasosAbertos.WhatId);
            }
            
            System.debug(casosComTarefasAbertas);
            
            for(Task t : (List<Task>)Records){
                if(casosComTarefasAbertas.contains(t.WhatId)){
                    t.addError('Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.');
                }
            }    
        }  
    }
}