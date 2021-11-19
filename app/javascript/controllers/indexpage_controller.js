import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["mapContainer"];

  connect(){

  }

  toggle_map_display() {
    this.mapContainerTarget.classList.toggle('reduce')
  }
}
