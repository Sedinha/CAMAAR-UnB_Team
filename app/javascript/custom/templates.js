export function initializeQuestionForm() {
  const addQuestionButton = document.getElementById("add-question");
  const questionsContainer = document.getElementById("questions");
  const questionTemplate = document.getElementById("question-template");

  let questionIndex = document.querySelectorAll(".question-fields").length;

  if (addQuestionButton && questionsContainer && questionTemplate) {
      addQuestionButton.addEventListener("click", () => {
          const newQuestion = questionTemplate.content.cloneNode(true);
          let html = newQuestion.firstElementChild.innerHTML;

          html = html.replace(/INDEX/g, questionIndex);

          const div = document.createElement("div");

          div.classList.add("question-fields");

          div.innerHTML = html;

          questionsContainer.appendChild(div);

          questionIndex++;
      });

      questionsContainer.addEventListener("click", (event) => {
          if (event.target.classList.contains("remove-question")) {
              event.target.closest(".question-fields").remove();
          }
      });
  }
}
