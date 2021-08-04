public class AccountEmailUpdateWithLapTriggerHandler extends TriggerHandler {
  public AccountEmailUpdateWithLapTriggerHandler() {
  }

  public override void afterInsert() {
    List<LAP_Email__c> lapList = (List<LAP_Email__c>) Trigger.new;
    Database.executeBatch(new AccountEmailUpdateBatch(lapList));
  }
}
