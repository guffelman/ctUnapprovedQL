@isTest
private class UnApprovedQuoteLineControllerTest {
    @isTest
    static void testGetUnapprovedQuoteLinesNoUnapprovedQuoteLines() {
        // test account data
        Account testAccount = new Account( 
            Name = 'TEST ACCOUNT',
            AccountNumber = '123',
            Type = 'Prospect',
            AnnualRevenue = 0,
            BillingCity = 'Justin',
            BillingCountry = 'United States',
            BillingCountryCode = 'US',
            BillingLatitude = 33.1013,
            BillingLongitude = -97.3864,
            BillingPostalCode = '76247',
            BillingState = 'Texas',
            BillingStateCode = 'TX',
            BillingStreet = '916 Timber Ridge Drive',
            Description = '',
            AccountSource = 'Customer Call/Visit'
            );
        insert testAccount;

        // test contact data
        Contact testContact = new Contact(LastName = 'Test Contact', AccountId = testAccount.Id);
        insert testContact;

        // Create test data
        SBQQ__Quote__c testQuote = new SBQQ__Quote__c(SBQQ__Account__c = testAccount.Id, SBQQ__PrimaryContact__c = testContact.Id, SBQQ__SalesRep__c = '0051R00000H4tgJQAR', Type__c = 'New Business');
        insert testQuote;
        // SBQQ__QuoteLine__c testQuoteLine = new SBQQ__QuoteLine__c(SBQQ__Quote__c = testQuote.Id, pending__c = false, Line_Description__c = 'Approved Quote Line');
        // insert testQuoteLine;
        
        // Call the method being tested
        List<SBQQ__QuoteLine__c> result = UnApprovedQuoteLineController.getUnapprovedQuoteLines(testQuote.Id);
        
        // if the method returns a record with the same Id as the test record, the test passes
        System.assertEquals(0, result.size(), 'The method should return no unapproved quote lines');

    }

}