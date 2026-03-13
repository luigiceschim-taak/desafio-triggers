public with sharing class PricebookSelector extends fflib_SObjectSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schama.SObjectField>{Pricebook.Id, Pricebook2.IsStarndard};
    
    }
    public Schema.SObjectType getSObjectType(){
        return Pricebook2.sObjectType;
    }

    public Pricebook2 selectStandardPricebook(){
        return [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
    }

}