// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import { initializeTopbar } from "./custom/topbar"
import { initializeQuestionForm } from "./custom/templates";

// Initialize topbar when the document loads and after Turbo navigation
document.addEventListener("turbo:load", () => {
  initializeTopbar();
  initializeQuestionForm();
  initializeTurmaForm();
});
