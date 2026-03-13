public class Products extends fflib_SObjectDomain {
    public Products(List<Product2> sObjectList) { super(sObjectList); }
   
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) { return new Products(sObjectList); }
    }

    public override void onAfterInsert() {
        // O Domínio delega a tarefa complexa para o Service
        ProductTriggerHandler.createPricebookEntriesForStandard((List<Product2>) Records);
    }
}
