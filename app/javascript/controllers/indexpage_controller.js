import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["mapContainer"];

  connect(){
    console.log('hello from the indexpage controller')
  }

  toggle_map_display() {
    this.mapContainerTarget.classList.toggle('reduce')
  }
}
