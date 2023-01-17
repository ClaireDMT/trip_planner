import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]
  static values = {
    time: Boolean
  }

  connect() {
    if (this.hasEndTimeTarget) {
      flatpickr(this.startTimeTarget, {
        enableTime: this.timeValue,
        // dateFormat: "d-m-Y H:i",
        mode: 'range',
        "plugins": [new rangePlugin({
          input: this.endTimeTarget
        })]
      });
    } else {
      flatpickr(this.startTimeTarget, {
        // dateFormat: "d-m-Y"
      });
    }
  }
}
