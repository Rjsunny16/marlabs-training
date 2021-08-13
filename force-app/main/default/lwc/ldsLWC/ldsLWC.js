import { LightningElement, api } from 'lwc';

export default class LdsLWC extends LightningElement {
    @api recordId
    objectApiName = 'Opportunity'
    fields = ['Name', 'CloseDate', 'Amount']
}