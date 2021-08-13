import { LightningElement } from 'lwc';

export default class Paginator extends LightningElement {
    previousClickHandler() {
        this.dispatchEvent(new CustomEvent('previous', {'detail': 'Some information on previous event'}))
    }
    nextClickHandler() {
        this.dispatchEvent(new CustomEvent('next', {'detail': 'Some information on next event'}))
    }
}