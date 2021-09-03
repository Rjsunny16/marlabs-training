import { LightningElement, api } from "lwc";

export default class ChildRating extends LightningElement {
   bikerating;
  rating(event) {
    if (event.target.name === "Bike") {
      this.bikerating = event.target.value;
    }
  }

  getvalues() {
    alert(
      "BikeRating:" +
        this.bikerating 
    );
  }

}