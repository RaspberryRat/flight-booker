import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "passengerForm", "passengerList" ]

  connect() {
    //add number of passengers based on params
  }

  addPassenger() {
    const clone = this.passengerListTarget.content.cloneNode(true);

    let inputs = clone.querySelectorAll('input')
    let labels = clone.querySelectorAll('label')

    labels[0].textContent = "Passenger Name:"
    labels[0].setAttribute('for', "booking_passengers_attributes_0_name")
    inputs[0].setAttribute('id', 'booking[passengers_attributes][0][name]')
    inputs[0].setAttribute('name', 'booking_passengers_attributes_0_name')
    labels[1].textContent = "Passenger Email:"
    labels[1].setAttribute('for', "booking_passengers_attributes_0_email")
    inputs[1].setAttribute('id', 'booking[passengers_attributes][0][email]')
    inputs[1].setAttribute('name', 'booking_passengers_attributes_0_email')

    this.passengerFormTarget.append(clone)
  }

}


