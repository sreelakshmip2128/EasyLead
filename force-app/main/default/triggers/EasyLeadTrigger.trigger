trigger EasyLeadTrigger on Lead (before insert) {
    for (Lead l : Trigger.new) {
        if (l.Region__c == 'North') {
            l.OwnerId = '005gK000003gwHBQAY'; // Change to actual User Id
        }
    }
}
