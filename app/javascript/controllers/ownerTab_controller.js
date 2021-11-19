import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["tab", "tabPage"];
  static values = { tab: String }

  connect() {
  }

  changeTab(event) {
    this.tabPageTargets.forEach(tabPage => {
      if (event.currentTarget.dataset.tabPage === tabPage.id) {
        tabPage.classList.add('hidden');
      } else {
        tabPage.classList.remove('hidden');
      }
    });
  }
}
