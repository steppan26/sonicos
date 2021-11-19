import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "modal"];

  connect() {

  }

  openModal(event){
    event.currentTarget.children[2].style.visibility = "visible"
    event.currentTarget.children[2].children[0].classList.add('open')
  }

  closeModal(event){
    this.containerTarget.style.visibility = "hidden"
    event.currentTarget.children[2].children[0].classList.remove('open')
  }
}
