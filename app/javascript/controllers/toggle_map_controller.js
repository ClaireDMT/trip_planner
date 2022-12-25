import { Controller } from "@hotwired/stimulus";

export default class extends Controller{
  static targets = ['map', 'details']
  // static classes = ['active']

  initialize(){
    this.handleClick = this.handleClick.bind(this)
  }

  connect(){

    this.element.addEventListener('turbo:click', this.handleClick)
  }

  handleClick(event) {
    this.detailsTarget.classList.toggle("d-none");
    this.mapTarget.classList.toggle("d-none")

  }
}
