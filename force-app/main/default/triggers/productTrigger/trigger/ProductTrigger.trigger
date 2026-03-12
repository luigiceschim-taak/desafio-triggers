trigger ProductTrigger on Product2 (after insert) {
 
    ProductTriggerHandler.createPricebookEntriesForStandard(trigger.new);
}
