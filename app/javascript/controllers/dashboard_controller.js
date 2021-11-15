import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output", "wrapper", "section" ]

  connect() {
  console.log('Hello, Stimulus!')
  }

  toggle(event) {
    const pageName = event.currentTarget.dataset.pageName;
    const sections = document.querySelectorAll('.section')
    sections.forEach(section => {
      console.log(section.id, pageName)
      if (section.id === pageName){
        section.classList.remove('hidden');
      } else {
        section.classList.add('hidden');
      }
    })
  }
}
