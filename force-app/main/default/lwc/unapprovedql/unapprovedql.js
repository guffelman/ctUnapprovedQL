import { LightningElement, wire, api} from 'lwc';
import getUnApprovedQuoteLine from '@salesforce/apex/UnApprovedQuoteLineController.getUnapprovedQuoteLines';
import { NavigationMixin } from 'lightning/navigation';

export default class Unapprovedql extends LightningElement {
    @api recordId;  
    // run the query and return the data
    @wire (getUnApprovedQuoteLine, { quoteId: '$recordId' })
    unapprovedQuoteLines;

    // get the data from the query
    get unapprovedQuoteLinesData() {
        if (this.unapprovedQuoteLines.data) {
            console.log('Hello, everyone. I have data! ' + JSON.stringify(this.unapprovedQuoteLines.data))
            return this.unapprovedQuoteLines.data;
        } else{
        console.log("I don't have data yet. :(")
        return null;
    }
    
    }

    navigateToRecord(event) {
        // using wire service to get the record id
        const recordId = event.target.dataset.recordid;
        console.log('recordId: ' + recordId);
        
    }

}