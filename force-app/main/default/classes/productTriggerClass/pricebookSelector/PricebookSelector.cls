public with sharing class PricebookSelector extends fflib_SObjectSelector {

    public PricebookSelector(){
        
    }
    
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{Pricebook2.Id, Pricebook2.isStandard};
    
    }
    public Schema.SObjectType getSObjectType(){
        return Pricebook2.sObjectType;
    }

    public Pricebook2 selectStandardPricebook(){
        return [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
    }

}