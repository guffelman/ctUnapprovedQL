public class UnApprovedQuoteLineController {


    @AuraEnabled(cacheable=true)
    public static List<SBQQ__QuoteLine__c> getUnapprovedQuoteLines(String quoteId) {
        
        List<SBQQ__QuoteLine__c> unapprovedQuoteLines = new List<SBQQ__QuoteLine__c>();
        for (SBQQ__QuoteLine__c quoteLine : [SELECT Id, Name, Line_Description__c FROM SBQQ__QuoteLine__c WHERE pending__c = true AND SBQQ__Quote__c = :quoteId]) {
            System.debug( 'quoteLine found: ' + quoteLine);
            unapprovedQuoteLines.add(quoteLine);
        }
        return unapprovedQuoteLines;
    }

}