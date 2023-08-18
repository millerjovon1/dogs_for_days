import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="paw-size"
export default class extends Controller {
  static targets= ['checkbox']
  select() {
    this.checkboxTarget.checked = !this.checkboxTarget.checked
  }
}
