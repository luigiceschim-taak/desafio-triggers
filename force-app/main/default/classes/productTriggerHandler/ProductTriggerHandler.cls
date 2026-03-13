public with sharing class ProductTriggerHandler {
    
   
    public static void createPricebookEntriesForStandard(List<Product2> newProducts){

        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance(
            new List<SObjectType>{PricebookEntry.SObjectType}
        );

        List<PricebookEntry> pbeList = new List<PricebookEntry>();
       
        Id standardPricebookId = new PricebookSelector.selectStandardPricebook();
        List<CurrencyType> activeCurrencies = [SELECT IsoCode FROM CurrencyType WHERE IsActive = true];

        for(Product2 p : newProducts) {
            for(CurrencyType c : activeCurrencies){
                pbeList.add(
                    new PricebookEntry(
                        Pricebook2Id = standardPricebookId,
                        Product2Id = p.Id,
                        UnitPrice = 0,
                        CurrencyIsoCode = c.IsoCode,
                        IsActive = true
                    ));
            }
        }   

        uow.commitWork();
    }
}