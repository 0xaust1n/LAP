@isTest
private class AccountEmailUpdateTest {
  @isTest
  static void AccountEmailUpdateTest() {
    List<Account> accountTest = new List<Account>();
    for (Integer i = 0; i < 200; i++) {
      Account item = new Account();
      item.Name = 'User' + i;
      item.Billing_Account_ID__c = 'u' + i;
      accountTest.add(item);
    }

    List<LAP_Email__c> lapTest = new List<LAP_Email__c>();
    for (Integer i = 0; i < 200; i++) {
      LAP_Email__c item = new LAP_Email__c();
      item.Name = 'User' + i;
      item.Billing_Account_ID__c = 'u' + i;
      item.Email__c = 'User' + i + '@gmail.com';
      lapTest.add(item);
    }
    insert accountTest;
    Test.startTest();
    insert lapTest;
    Test.stopTest();
    List<Account> verify = [SELECT Id FROM Account WHERE Email__c != NULL];
    System.debug(verify);
    System.debug(verify.size());
    System.assertEquals(200, verify.size());
  }
}
