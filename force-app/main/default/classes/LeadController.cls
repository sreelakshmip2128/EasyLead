public with sharing class LeadController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Integer> getLeadCounts() {
        Map<String, Integer> counts = new Map<String, Integer>();
        for (AggregateResult ar : [
            SELECT Lead_Category__c, COUNT(Id) total 
            FROM Lead 
            GROUP BY Lead_Category__c
        ]) {
            counts.put((String)ar.get('Lead_Category__c'), (Integer)ar.get('total'));
        }
        return counts;
    }
}
