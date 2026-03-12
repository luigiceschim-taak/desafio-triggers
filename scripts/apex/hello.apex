// 1. Criar um novo produto (Isso vai disparar a sua Trigger)
Product2 p = new Product2(Name = 'Produto Teste Trigger', IsActive = true);
insert p;

// 2. Buscar os registros de preço criados pela Trigger para esse produto
List<PricebookEntry> pbes = [SELECT Id, UnitPrice, CurrencyIsoCode, PriceBook2Id, Product2Id
                             FROM PricebookEntry 
                             WHERE Product2Id = :p.Id];

// 3. Exibir os resultados no Log
System.debug('Total de entradas de preço criadas: ' + pbes.size());

for(PricebookEntry pbe : pbes) {
    System.debug('Moeda: ' + pbe.CurrencyIsoCode + '  Valor: ' + pbe.UnitPrice + '  Id do Pricebook: ' + pbe.PriceBook2Id + '  Id do Produto: ' + pbe.Product2Id);
}
