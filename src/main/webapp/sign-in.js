const container = document.getElementById('container');
const recLogin = document.getElementById('rec-login');
const appLogin = document.getElementById('app-login');

recLogin.addEventListener('click', () => {
    container.classList.add("active");
});

appLogin.addEventListener('click', () => {
    container.classList.remove("active");
});