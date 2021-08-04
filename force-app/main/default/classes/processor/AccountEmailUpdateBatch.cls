public without sharing class AccountEmailUpdateBatch implements Database.Batchable<sObject> {
  public Map<String, String> idEmailMap;

  public AccountEmailUpdateBatch(List<LAP_Email__c> emailList) {
    Map<String, String> idEmailMap = new Map<String, String>();
    for (LAP_Email__c item : emailList) {
      //check email is not empty null
      if (!String.isEmpty(item.Email__c)) {
        //check map contains key or not
        if (!idEmailMap.containsKey(item.Billing_Account_ID__c)) {
          idEmailMap.put(item.Billing_Account_ID__c, item.Email__c);
        }
      }
    }
    this.idEmailMap = idEmailMap;
  }

  public Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator(
      'SELECT Id, Email__c, Billing_Account_ID__c FROM Account'
    );
  }

  public void execute(Database.BatchableContext bc, List<Account> Accounts) {
    List<Account> updateList = new List<Account>();
    for (Account item : Accounts) {
      if (idEmailMap.containsKey(item.Billing_Account_ID__c)) {
        item.Email__c = idEmailMap.get(item.Billing_Account_ID__c);
        updateList.add(item);
      }
    }
    update updateList;
  }

  public void finish(Database.BatchableContext bc) {
  }
}
