import { LightningElement, wire } from 'lwc';
import getContactsApex from '@salesforce/apex/ContactsController.getContacts'

export default class ContactsLWC extends LightningElement {
    @wire(getContactsApex) wiredContacts; //These will be automatically available if successful
    getContactsFromSalesforce() {
        getContactsApex()
        .then(contacts => {
            //console.log(JSON.stringify(contacts))
            console.log('Got Contacts: ' + contacts.length);
        })
        .catch(error => {
            console.log(error)
        });
    }
}