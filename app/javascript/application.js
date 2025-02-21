// app/javascript/application.js
import "@hotwired/turbo-rails"
import "./controllers"
import { initializeTopbar } from "./custom/topbar"
import { initializeQuestionForm } from "./custom/templates"

console.log("=== Application.js loaded ===")
// Initialize all functions
document.addEventListener("turbo:load", () => {
  initializeTopbar();
  initializeQuestionForm();

});
import "controllers"
