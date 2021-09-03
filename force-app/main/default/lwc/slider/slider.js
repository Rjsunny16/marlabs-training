import { LightningElement, api,wire,track } from 'lwc';
import getProductList from '@salesforce/apex/ProductSliderController.getProductList';
export default class Slider extends LightningElement {
    @track val=1;
    @track products;
    handleChange(event) {
        this.val = event.target.value;
    }
    @wire(getProductList,{
        limitVal: '$val'
    })
    products;
}