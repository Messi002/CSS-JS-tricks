let modal = document.querySelector('#myModal');
let myImg = document.querySelector('#myImg')
let img01 = document.querySelector('#img01')
let clos = document.querySelector('.modal__close')
let caption = document.querySelector('#modal__caption')

//CLICKING ON IMAGE
myImg.addEventListener('click', (e)=>{
   e.stopPropagation(),
    modal.style.display = 'block'
    console.log(caption);
    img01.src = myImg.src;
    caption.innerText = `${myImg.alt}`
   
})

//CLOSE BY CLICKING ON BLACK AREA
modal.addEventListener('click', (e)=>{
    e.stopPropagation(),
    modal.style.display = 'none';
})

//CLOSING THE MODAL
clos.addEventListener('click', ()=>{
    modal.style.display = 'none';
})