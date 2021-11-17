import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dashboard-wrapper", "section", "tab" ];

  connect() {
  }

  toggle_page(event) {
    const pageName = event.currentTarget.dataset.pageName;
    this._show_page(pageName);
    this._activate_tab(event.currentTarget);
  }

  show_page(event) {
    const pageName = event.currentTarget.dataset.pageTo || 'homepage';
    this._show_page(pageName);
    let tab_target;
    this.tabTargets.forEach(tab => {
      if (tab.dataset.pageName === pageName) {
        tab_target = tab;
      }
    })
    this._activate_tab(tab_target);
  }

  _activate_tab(target) {
    this.tabTargets.forEach(tab => {
      if (tab === target) {
        tab.classList.add('active');
      } else {
        tab.classList.remove('active');
      }
    })
  }

  _show_page(pageName) {
    this.sectionTargets.forEach(section => {
      if (section.id === pageName) {
        section.classList.remove('hidden');
      } else {
        section.classList.add('hidden');
      }
    })
  }
}
