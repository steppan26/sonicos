import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output", "wrapper", "section" ]

  connect() {
  console.log('Hello, Stimulus!')
  }

  toggle(event) {
    const pageName = event.currentTarget.dataset.pageName;
    this.sectionTargets.forEach(section => {
      if (section.id === pageName){
        section.classList.remove('hidden');
      } else {
        section.classList.add(  'hidden');
      }
    })
  }
}
