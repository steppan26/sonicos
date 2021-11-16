import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dashboard-wrapper", "section" ]

  connect() {
  console.log('Hello, Stimulus!')
  }

  toggle(event) {
    const pageName = event.currentTarget.dataset.pageName;
    const tabs = document.querySelectorAll('.tab')
    this.sectionTargets.forEach(section => {
      if (section.id === pageName){
        section.classList.remove('hidden');
      } else {
        section.classList.add('hidden');
      }
    })
    tabs.forEach(tab => {
      if (tab === event.currentTarget) {
        tab.classList.add('active')
      } else {
        tab.classList.remove('active')
      }
    })
  }
}
