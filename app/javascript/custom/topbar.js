// app/javascript/custom/topbar.js
export function initializeTopbar() {
  const userMenuToggle = document.getElementById('user-menu-toggle');
  const userDropdown = document.getElementById('user-dropdown');
  const menuToggle = document.getElementById('menu-toggle');
  const menuContainer = document.getElementById('menu-container');

  if (userMenuToggle && userDropdown) {
    userMenuToggle.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      userDropdown.classList.toggle('active');
      console.log('User menu clicked');
    });

    document.addEventListener('click', function(e) {
      if (!userMenuToggle.contains(e.target)) {
        userDropdown.classList.remove('active');
      }
    });
  }

  if (menuToggle&& menuContainer) {
    menuToggle.addEventListener('click', function(e) {
      e.preventDefault();
      menuContainer.classList.toggle('active');
      console.log('Menu clicked');
    });
  }
}