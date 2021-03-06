import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dashboard-wrapper", "section", "tab", "parent", "newTab", "newCostumeIcon" ];

  connect() {
    const pageName = this.parentTarget.dataset.pageToLoad
    this._show_page(pageName);
    let tab_target;
    this.tabTargets.forEach(tab => {
      if (tab.dataset.pageName === pageName) {
        tab_target = tab;
      }
    })
    this._activate_tab(tab_target);
    if (this.newTabTarget.classList.contains("active")) {
      this.newTabTarget.children.new.classList.remove('hidden');
      this.newTabTarget.classList.remove("active");
      this.newCostumeIconTarget.classList = "fas fa-minus me-1";
    }
  }

  toggle_page(event) {
    const pageName = event.currentTarget.dataset.pageName;
    this._show_page(pageName);
    this._activate_tab(event.currentTarget);
  }

  new_costume_handler() {
    this.newTabTarget.children.new.classList.toggle('hidden');
    this.newTabTarget.classList.toggle("active");
    if (this.newTabTarget.classList.contains('active')) {
      this.newCostumeIconTarget.classList = "fas fa-minus me-1";
    } else {
      this.newCostumeIconTarget.classList = "fas fa-plus me-1";
    }
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
