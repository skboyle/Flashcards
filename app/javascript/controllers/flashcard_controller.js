import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashcard"
export default class extends Controller {
  static targets = ["back", "revealBtn", "answerButtons"]

  connect() {
    console.log("Flashcard controller connected")
  }

  reveal() {
    this.backTarget.classList.remove("hidden")
    this.revealBtnTarget.classList.add("hidden")
    this.answerButtonsTarget.classList.remove("hidden")
  }
}
