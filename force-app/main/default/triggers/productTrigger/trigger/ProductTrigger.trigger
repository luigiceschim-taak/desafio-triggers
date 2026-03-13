trigger ProductTrigger on Product2 (after insert, before insert, after update, before update) {

    fflib_SObjectDomain.triggerHandler(Products.class);
}
