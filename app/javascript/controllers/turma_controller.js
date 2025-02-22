import { Controller } from "@hotwired/stimulus"

// Exporta a classe do controller
export default class extends Controller {
  static targets = ["disciplina", "professor"]

  connect() {
    console.log("=== Turma Controller Debug ===")
    console.log("Turma controller conectado")
    console.log("Elemento com controller:", this.element)
    console.log("Disciplina target presente:", this.hasDisciplinaTarget, 
                this.disciplinaTarget ? this.disciplinaTarget : "não encontrado")
    console.log("Professor target presente:", this.hasProfessorTarget,
                this.professorTarget ? this.professorTarget : "não encontrado")
    console.log("========================")
  }

  async updateProfessores() {
    console.log("=== Update Professores Debug ===")
    console.log("Método chamado")
    
    const disciplinaId = this.disciplinaTarget.value
    console.log("Disciplina ID:", disciplinaId)
    const professorSelect = this.professorTarget

    if (!this.hasDisisciplinaTarget) {
        console.error("Target disciplina não encontrado")
      return
    }

    if (!this.hasProfessorTarget) {
        console.error("Target professor não encontrado")
        return
      }

    if (!disciplinaId) {
      professorSelect.disabled = true
      professorSelect.innerHTML = '<option value="">Primeiro selecione uma disciplina</option>'
      return
    }

    if (disciplinaId) {
        professorSelect.disabled = true
        professorSelect.innerHTML = '<option value="">Carregando...</option>'
  
        fetch(`/disciplinas/${disciplinaId}/professores`, {
          headers: {
            'Accept': 'application/json'
          }
        })
        .then(response => response.json())
        .then(data => {
          professorSelect.innerHTML = '<option value="">Selecione um professor</option>'
          data.forEach(professor => {
            const option = document.createElement('option')
            option.value = professor.id
            option.textContent = professor.nome
            professorSelect.appendChild(option)
          })
          professorSelect.disabled = false
        })
        .catch(() => {
          professorSelect.innerHTML = '<option value="">Erro ao carregar</option>'
          professorSelect.disabled = true
        })
      } else {
        professorSelect.disabled = true
        professorSelect.innerHTML = '<option value="">Selecione uma disciplina</option>'
      }
  }
}