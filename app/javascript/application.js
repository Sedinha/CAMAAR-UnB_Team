// app/javascript/application.js

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./topbar"

// Adicionar o código de inicialização da topbar
document.addEventListener('turbo:load', function() {
    const userMenuToggle = document.getElementById('user-menu-toggle');
    const userDropdown = document.getElementById('user-dropdown');
    const menuToggle = document.getElementById('menu-toggle');
  
    if (userMenuToggle && userDropdown) {
      userMenuToggle.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        userDropdown.classList.toggle('active');
        console.log('Toggle dropdown'); // Para debug
      });
  
      document.addEventListener('click', function(e) {
        if (!userMenuToggle.contains(e.target)) {
          userDropdown.classList.remove('active');
        }
      });
    }
  
    if (menuToggle) {
      menuToggle.addEventListener('click', function(e) {
        e.preventDefault();
        document.body.classList.toggle('sidebar-open');
        console.log('Toggle menu'); // Para debug
      });
    }
  });