trigger TaskTrigger on Task (before insert) {

    Set<Id> caseIds = new Set<Id>();
    
    
    for(Task t : Trigger.new){
        if(t.WhatId != null && String.valueOf(t.WhatId).startsWith('500')){
            System.debug(t.WhatId);
            caseIds.add(t.WhatId);
        }
    }

    

    if(!caseIds.isEmpty()){
        List<String> openCases = new List<String>{'Not Started', 'In Progress', 'Waiting on someone else'};
        Set<Id> casosComTarefasAbertas = new Set<Id>();
        
        for(Task taskComCasosAbertos : [SELECT WhatId FROM Task WHERE WhatId IN :caseIds AND Status IN :openCases]){
            casosComTarefasAbertas.add(taskComCasosAbertos.WhatId);
        }
        
        System.debug(casosComTarefasAbertas);
         
        for(Task t : Trigger.new){
            if(casosComTarefasAbertas.contains(t.WhatId)){
                t.addError('Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.');
            }
        }

        
    }
}