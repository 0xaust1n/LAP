trigger AccountEmailUpdateWithLap on LAP_Email__c(after insert) {
  new AccountEmailUpdateWithLapTriggerHandler().run();
}
