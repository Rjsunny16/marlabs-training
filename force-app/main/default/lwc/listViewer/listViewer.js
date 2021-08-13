import { LightningElement } from 'lwc';

export default class ListViewer extends LightningElement {
    companyNames = ['HFS', 'Marlabs', 'Venerate']
    companyIndex = 0
    message = ''

    selectedCompany = this.companyNames[this.companyIndex]

    previousEventHandler(event) {
        console.log(event.detail);
        if (this.companyIndex > 0) {
            this.companyIndex--;
            this.message = ''
        } else {
            this.message = 'Already on first element'
        }
        this.selectedCompany = this.companyNames[this.companyIndex]
    }
    nextEventHandler(event) {
        console.log(event.detail);
        if (this.companyIndex < (this.companyNames.length - 1)) {
            this.companyIndex++;
            this.message = ''
        } else {
            this.message = 'Already on last element'
        }
        this.selectedCompany = this.companyNames[this.companyIndex]
    }
}