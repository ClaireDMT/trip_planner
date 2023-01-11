import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-packed"
export default class extends Controller {
  static values = { item: Number }

  connect() {
  }

  toggle() {
    fetch(`/items/${this.itemValue}/toggle_packed`, {
      headers: { "Accept": "text/plain" },
    })
      .then(response => response.text())
      .then((data) => {
        this.element.innerHTML = data
      })
  }
}
