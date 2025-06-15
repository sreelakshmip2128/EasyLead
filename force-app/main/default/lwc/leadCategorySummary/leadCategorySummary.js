import { LightningElement, wire } from 'lwc';
import getLeadCounts from '@salesforce/apex/LeadController.getLeadCounts';

export default class LeadCategorySummary extends LightningElement {
    hot = 0;
    warm = 0;
    cold = 0;

    @wire(getLeadCounts)
    wiredCounts({ error, data }) {
        if (data) {
            this.hot = data.Hot || 0;
            this.warm = data.Warm || 0;
            this.cold = data.Cold || 0;
        } else if (error) {
            console.error('Error fetching lead counts', error);
        }
    }
}
