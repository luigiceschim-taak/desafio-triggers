public class Application {
    // 1. UNIT OF WORK: Adicione o Task.SObjectType aqui
    public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
        new fflib_Application.UnitOfWorkFactory(
            new List<SObjectType> { 
                Product2.SObjectType, 
                PricebookEntry.SObjectType,
                Task.SObjectType 
            }
        );

    // 2. SELECTOR: Mapeie o objeto para a sua classe Selector
    public static final fflib_Application.SelectorFactory Selector = 
        new fflib_Application.SelectorFactory(
            new Map<SObjectType, Type> {
                Pricebook2.SObjectType => PricebookSelector.class,
                Task.SObjectType => TasksSelector.class
            }
        );

    // 3. DOMAIN: Mapeie o objeto para a sua classe de Domínio (Trigger)
    public static final fflib_Application.DomainFactory Domain = 
        new fflib_Application.DomainFactory(
            Application.Selector,
            new Map<SObjectType, Type> {
                Product2.SObjectType => Products.Constructor.class,
                Task.SObjectType => Tasks.Constructor.class
            }
        );
}
