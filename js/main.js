function headerMenu() {
    let headerMenu = document.getElementById('headerMenuContainer');
    let icon = document.getElementById('headerMenuCloseIcon')

    if (headerMenu.style.display === 'none') {
        setTimeout(() => {
            icon.style.display = 'block'
        }, 150);
        headerMenu.style.display = 'block';
        headerMenu.classList.remove('closeheaderMenu');
        headerMenu.classList.add('openheaderMenu');
    } else {
        setTimeout(() => {
            icon.style.display = 'none'
        }, 250);
        headerMenu.classList.remove('openheaderMenu');
        headerMenu.classList.add('closeheaderMenu');
        setTimeout(() => {
            headerMenu.style.display = 'none';
        }, 600);
    }
}