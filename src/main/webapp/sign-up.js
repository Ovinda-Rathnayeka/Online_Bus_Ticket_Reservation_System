const container = document.getElementById('container');
const recReg = document.getElementById('rec-signup');
const appReg = document.getElementById('app-signup');

recReg.addEventListener('click', () => {
    container.classList.add("active");
});

appReg.addEventListener('click', () => {
    container.classList.remove("active");
});