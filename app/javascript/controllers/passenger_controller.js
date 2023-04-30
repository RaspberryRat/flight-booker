import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "passengerForm", "passengerList" ]
  static values = { index: { type: Number, default: 0 } }

  addPassenger() {
    const clone = this.passengerListTarget.content.cloneNode(true);

    let inputs = clone.querySelectorAll('input')
    let labels = clone.querySelectorAll('label')

    labels[0].textContent = "Passenger Name:"
    labels[0].setAttribute('for', `booking_passengers_attributes_${this.indexValue}_name`)
    inputs[0].setAttribute('name', `booking[passengers_attributes][${this.indexValue}][name]`)
    inputs[0].setAttribute('id', `booking_passengers_attributes_${this.indexValue}_name`)
    labels[1].textContent = "Passenger Email:"
    labels[1].setAttribute('for', `booking_passengers_attributes_${this.indexValue}_email`)
    inputs[1].setAttribute('name', `booking[passengers_attributes][${this.indexValue}][email]`)
    inputs[1].setAttribute('id', `booking_passengers_attributes_${this.indexValue}_email`)

    this.indexValue++

    this.passengerFormTarget.append(clone)
  }

}


