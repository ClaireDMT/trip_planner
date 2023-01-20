import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-all"
import Reveal from 'stimulus-reveal-controller'

export default class extends Reveal {
  toggle() {
    super.toggle()
    console.log(this.itemTargets)
  }
}
