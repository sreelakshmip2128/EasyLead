trigger EasyLeadTrigger on Lead (before insert) {
    for (Lead l : Trigger.new) {
        if (l.Region__c == 'North') {
            l.OwnerId = '005XXXXXXX1'; // Change to actual User Id
        }
    }
}
