public with sharing class TasksSelector extends fflib_SObjectSelector  {

    public TasksSelector(){
        
    }

     public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> { Task.Id, Task.WhatId, Task.Status };
    }
    public Schema.SObjectType getSObjectType() { return Task.sObjectType; }

    public List<Task> selectOpenTasksByCasesIds(Set<Id> caseIds) {
        // Define os status "Abertos" aqui dentro do método
        List<String> openStatuses = new List<String>{'Not Started', 'In Progress', 'Waiting on someone else'};
        
        return (List<Task>) Database.query(
            newQueryFactory()
            .setCondition('WhatId IN :caseIds AND Status IN :openStatuses')
            .toSOQL()
        );
    }
}