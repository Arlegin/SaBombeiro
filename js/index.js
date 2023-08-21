function menu() {
    let menu = document.getElementById('menuContainer');
    let icon = document.getElementById('menuCloseIcon')

    if (menu.style.display === 'none') {
        setTimeout(() => {
            icon.style.display = 'block'
        }, 150);
        menu.style.display = 'block';
        menu.classList.remove('closeMenu');
        menu.classList.add('openMenu');
    } else {
        setTimeout(() => {
            icon.style.display = 'none'
        }, 250);
        menu.classList.remove('openMenu');
        menu.classList.add('closeMenu');
        setTimeout(() => {
            menu.style.display = 'none';
        }, 600);
    }
}