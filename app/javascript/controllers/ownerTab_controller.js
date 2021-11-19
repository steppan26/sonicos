import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["tab", "tabPage"];
  static values = { tab: String }

  connect() {
  }

  changeTab(event) {
    this.tabPageTargets.forEach(tabPage => {
      if (event.currentTarget.dataset.tabPage === tabPage.id) {
        tabPage.classList.remove('hidden');
      } else {
        tabPage.classList.add('hidden');
      }
    });
    this.tabTargets.forEach(tab => {
      if (tab === event.currentTarget) {
        tab.classList.add('active');
      } else {
        tab.classList.remove('active');
      }
    })
  }
}
