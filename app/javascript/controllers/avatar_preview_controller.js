import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="avatar-preview"
export default class extends Controller {
  static targets = ["preview"];

  onChange(e) {
    const [file] = Array.from(e.currentTarget.files);

    if (!file) return;

    this.previewTarget.src = URL.createObjectURL(file);
  }
}
