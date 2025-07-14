import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["image", "indicator"];
  static values = {
    currentIndex: {
      type: Number,
      default: 0,
    },
  };

  connect() {
    this.updateUI();
  }

  previous() {
    let newIndex = this.currentIndexValue - 1;

    if (newIndex < 0) {
      newIndex = this.imageTargets.length - 1;
    }

    this.currentIndexValue = newIndex;
    this.updateUI();
  }

  next() {
    let newIndex = this.currentIndexValue + 1;

    if (newIndex > this.imageTargets.length - 1) {
      newIndex = 0;
    }

    this.currentIndexValue = newIndex;
    this.updateUI();
  }

  jumpTo(e) {
    const index = +e.currentTarget.dataset.index;
    this.currentIndexValue = index;
    this.updateUI();
  }

  updateUI() {
    this.imageTargets.forEach((item) => {
      const index = +item.dataset.index;
      if (this.currentIndexValue === index) {
        item.classList.remove("opacity-0");
      } else {
        item.classList.add("opacity-0");
      }
    });

    this.indicatorTargets.forEach((item) => {
      const index = +item.dataset.index;
      if (this.currentIndexValue === index) {
        item.classList.remove("opacity-50");
      } else {
        item.classList.add("opacity-50");
      }
    });
  }
}
