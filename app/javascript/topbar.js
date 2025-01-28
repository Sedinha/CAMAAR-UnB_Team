document.addEventListener('turbo:load', function() {
    console.log("Topbar JS loaded"); // Para debug
    // Toggle do menu de usuário
    const userMenuToggle = document.getElementById('user-menu-toggle');
    const userDropdown = document.getElementById('user-dropdown');
    
    if (userMenuToggle && userDropdown) {
        console.log("User menu elements found"); // Para debug
        userMenuToggle.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            userDropdown.classList.toggle('active');
            console.log("User menu clicked"); // Para debug
      });
  
      // Fechar dropdown ao clicar fora
      document.addEventListener('click', function(e) {
        if (!userMenuToggle.contains(e.target)) {
          userDropdown.classList.remove('active');
        }
      });
    }
  
    // Toggle do menu lateral (sidebar)
    const menuToggle = document.getElementById('menu-toggle');
    if (menuToggle) {
        console.log("Menu toggle found"); // Para debug

        menuToggle.addEventListener('click', function() {
            document.body.classList.toggle('sidebar-open');
      });
    }
  });