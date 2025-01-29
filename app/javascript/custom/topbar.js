// app/javascript/custom/topbar.js
export function initializeTopbar() {
  const userMenuToggle = document.getElementById('user-menu-toggle');
  const userDropdown = document.getElementById('user-dropdown');
  const menuToggle = document.getElementById('menu-toggle');

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

  if (menuToggle) {
    menuToggle.addEventListener('click', function(e) {
      e.preventDefault();
      document.body.classList.toggle('sidebar-open');
      console.log('Menu clicked');
    });
  }
}