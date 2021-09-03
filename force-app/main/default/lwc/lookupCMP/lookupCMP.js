import { LightningElement, api } from 'lwc';
import getAccounts from '@salesforce/apex/LookupController.fetchAccounts';

export default class LookupCMP extends LightningElement {
    nameVar = '';
    accounts = [];
    isAccountFound = false;
    accountName = '';
    accountId = '';
    isAccountSelected = false;

    //Onchange handler when Account name is entered by a user
    handleAccNameChange(event) {
        this.isAccountSelected = false;
        this.nameVar = event.target.value;
        this.getAccountsWithName();
    }
    
    //Imperatiev Apex method call for displaying the list of Account with the value entered
    getAccountsWithName() {
        getAccounts( { searchString : this.nameVar } )
        .then(result => {
            this.accounts = [];
            if(result.length > 0) {
                result.forEach(elem => {
                    let accVar = {
                        label : elem.Name,
                        value : elem.Id
                    };
                    this.accounts.push(accVar);
                });
            }
            this.isAccountFound = true;
        })
        .catch(error => {
            this.isAccountFound = false;
        });
    }

    //Handler method when an Account is selected
    handleAccountSelection(event) {
        let accountId = event.target.title;
        this.accounts.forEach(elem => {
            if(elem.value == accountId) {
                this.nameVar = elem.label;
            }
        });
        this.isAccountFound = false;
        this.accountName = this.nameVar;
        this.accountId = accountId;
        this.isAccountSelected = true;
        //Fire a custom event to send the data to a parent component
    }
}