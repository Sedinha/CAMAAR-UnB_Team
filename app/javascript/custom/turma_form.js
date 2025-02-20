export function initializeTurmaForm() {
  document.addEventListener('DOMContentLoaded', () => {
    const disciplinaSelect = document.getElementById('disciplina-select');
    const professorSelect = document.getElementById('professor-select');

    if (disciplinaSelect && professorSelect) {
      disciplinaSelect.addEventListener('change', function() {
        const disciplinaId = this.value;

        if (disciplinaId) {
          fetch(`/disciplinas/${disciplinaId}/professores`, {
            headers: {
              'Accept': 'application/json'
            }
          })
          .then(response => response.json())
          .then(data => {
            professorSelect.disabled = false;
            professorSelect.innerHTML = '<option value="">Selecione um professor</option>';
            
            data.forEach(professor => {
              const option = new Option(professor.nome, professor.id);
              professorSelect.add(option);
            });
          })
          .catch(error => {
            console.error('Erro ao carregar professores:', error);
            professorSelect.disabled = true;
            professorSelect.innerHTML = '<option value="">Erro ao carregar professores</option>';
          });
        } else {
          professorSelect.disabled = true;
          professorSelect.innerHTML = '<option value="">Primeiro selecione uma disciplina</option>';
        }
      });
    }
  });
}