public class AccountTriggerHandler extends TriggerFrameworkAbstract {
    
    public void beforeInsert(List<SObject> newList) {
        System.debug('Inside Before Insert');
    }

    public void afterInsert(List<SObject> newList) {
        System.debug('Inside After Insert');
    }

    public void beforeUpdate(List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {
        System.debug('Inside Before Update');
    }

    public void afterUpdate(List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {
        System.debug('Inside After Update');
    }

    public void beforeDelete(List<SObject> oldList) {
        System.debug('Inside Before Delete');
    }

    public void afterDelete(List<SObject> oldList) {
        System.debug('Inside After Delete');
    }

    public void afterUndelete(List<SObject> newList) {
        System.debug('Inside After Undelete');
    }
}
