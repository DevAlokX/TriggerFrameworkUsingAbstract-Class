public abstract class TriggerFrameworkAbstract {
    abstract void beforeInsert(List<SObject> newList);
    abstract void afterInsert(List<SObject> newList);
    abstract void beforeUpdate(List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap);
    abstract void afterUpdate(List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap);
    abstract void beforeDelete(List<SObject> oldList);
    abstract void afterDelete(List<SObject> oldList);
    abstract void afterUndelete(List<SObject> newList);

    public static void execute() {
        String ObjectName = Trigger.old != null ? String.valueOf(Trigger.old.getSObjectType()) : String.valueOf(Trigger.new.getSObjectType());
        List<Trigger_Framework_mdt> triggerFrameworkMDT = [SELECT Id, Handler_Class__c FROM Trigger_Framework_mdt 
                                                            WHERE IsActive__c = true AND Object__c = :ObjectName];

        System.TriggerOperation trigOp = Trigger.operationType;
        for (Trigger_Framework_mdt tf : triggerFrameworkMDT) {
            TriggerFrameworkAbstract tfa = (TriggerFrameworkAbstract) Type.forName(tf.Handler_Class__c).newInstance();

            switch on trigOp {
                when BEFORE_INSERT {
                    tfa.beforeInsert(Trigger.new);
                }
                when AFTER_INSERT {
                    tfa.afterInsert(Trigger.new);
                }
                when BEFORE_UPDATE {
                    tfa.beforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
                }
                when AFTER_UPDATE {
                    tfa.afterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
                }
                when BEFORE_DELETE {
                    tfa.beforeDelete(Trigger.old);
                }
                when AFTER_DELETE {
                    tfa.afterDelete(Trigger.old);
                }
                when AFTER_UNDELETE {
                    tfa.afterUndelete(Trigger.new);
                }
            }
        }
    }
}
