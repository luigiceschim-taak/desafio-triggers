trigger ProductTrigger on Product2 (after insert) {
    List<PricebookEntry> pbeList = new List<PricebookEntry>();

    List<Pricebook2> standardPricebookId = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
    List<CurrencyType> activeCurrencies = [SELECT IsoCode FROM CurrencyType WHERE IsActive = true];

    for(Product2 p : Trigger.new) {
        for(CurrencyType c : activeCurrencies){
            pbeList.add(
                new PricebookEntry(
                    Pricebook2Id = standardPricebookId[0].Id,
                    Product2Id = p.Id,
                    UnitPrice = 0,
                    CurrencyIsoCode = c.IsoCode,
                    IsActive = true
                ));
        }
       
    
    }   

    if(!pbeList.isEmpty()) {
        insert pbeList;
        System.debug('PricebookEntry created successfully' + pbeList);
    }
}
