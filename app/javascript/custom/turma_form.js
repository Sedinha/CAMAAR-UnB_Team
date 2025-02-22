export function initializeTurmaForm() {
  // Função para atualizar os professores
  function updateProfessores(disciplinaId) {
    const professorSelect = document.getElementById('professor-select');

    // Verifica se o elemento existe antes de tentar modificá-lo
    if (!professorSelect) {
      console.error('Elemento professor-select não encontrado');
      return;
    }

    if (disciplinaId) {
      console.log('Atualizando professores para disciplina:', disciplinaId);
      // Habilita o select e mostra mensagem de carregamento
      professorSelect.disabled = true;
      professorSelect.innerHTML = '<option value="">Carregando professores...</option>';
      
      // Faz a requisição para buscar os professores
      fetch(`/disciplinas/${disciplinaId}/professores`, {
        headers: {
          'Accept': 'application/json',
          'X-Requested-With': 'XMLHttpRequest'
        },
        credentials: 'same-origin' // Importante para CSRF protection
      })
      .then(response => {
        if (!response.ok ) {
          throw new Error('Erro na resposta de rede');
        }
        return response.json();
        })
      .then(data => {
        console.log('Professores recebidos: ', data);
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
  }

   // Função para configurar os event listeners
   function setupEventListeners() {
    const disciplinaSelect = document.getElementById('disciplina-select');
    const professorSelect = document.getElementById('professor-select');

    if (!disciplinaSelect || !professorSelect) {
      console.error('Elementos necessários não encontrados:', {
        disciplinaSelect: !!disciplinaSelect,
        professorSelect: !!professorSelect
      });
      return;
    }

    console.log('Configurando event listeners');

    // Remove listeners anteriores para evitar duplicação
    disciplinaSelect.removeEventListener('change', handleDisciplinaChange);
    
    // Adiciona o novo listener
    disciplinaSelect.addEventListener('change', handleDisciplinaChange);
  }

  // Handler para mudança de disciplina
  function handleDisciplinaChange(event) {
    console.log('Disciplina changed:', event.target.value);
    updateProfessores(event.target.value);
  }

  // Inicializa quando o DOM estiver pronto
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupEventListeners);
  } else {
    setupEventListeners();
  }

  // Inicializa após navegação Turbo
  document.addEventListener('turbo:load', setupEventListeners);
  document.addEventListener('turbo:render', setupEventListeners);
}

// Inicializa imediatamente
initializeTurmaForm();