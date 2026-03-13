public class Application {
    // 1. Configura a Fábrica de Unit of Work (Gerenciador de DML)
    // Coloque aqui todos os objetos que sua lógica vai tocar (Insert/Update/Delete)
    public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
        new fflib_Application.UnitOfWorkFactory(
            new List<SObjectType> { 
                Product2.SObjectType, 
                PricebookEntry.SObjectType 
            }
        );

    public static final fflib_Application.SelectorFactory Selector = 
    new fflib_Application.SelectorFactory(
        new Map<SObjectType, Type> {
            // Se você não tem o ProductsSelector ainda, pode comentar a linha dele
            // Product2.SObjectType => ProductsSelector.class, 
            Pricebook2.SObjectType => PricebookSelector.class
        }
    );
    // 3. Configura a Fábrica de Domains (Lógica da Trigger)
    public static final fflib_Application.DomainFactory Domain = 
        new fflib_Application.DomainFactory(
            Application.Selector,
            new Map<SObjectType, Type> {
                Product2.SObjectType => Products.Constructor.class
            }
        );
}
