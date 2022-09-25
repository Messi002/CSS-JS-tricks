let slides = document.querySelectorAll('.myslides');
let pbtn = document.querySelector('#prev');
let nbtn = document.querySelector('#next');
let dots = document.querySelectorAll('body > main > section > div.dot > span.dot__element');
let current = 0;


//clear all images
const reset = () => {
    for (let i = 0; i < slides.length; i++) {
            slides[i].style.display ='none';        
    }
}

//initial slide
const startSlide = () =>  {
    reset()
    slides[0].style.display = 'block';
    dots[0].className += ' active';

}
//previous slide
const slideLeft = () =>  {
    reset()
    slides[current-=1].style.display = 'block';
    dots[current-=1].className += ' active';


}


//left arrow click
pbtn.addEventListener('click', () =>{
    if (current === 0) {
        current = slides.length;
    }

    slideLeft();
})


//next slide
const slideRight = () =>  {
    reset()
    slides[current+=1].style.display = 'block';

}


//right arrow click
nbtn.addEventListener('click', () =>{
    if (current === slides.length -1) {
        current = -1;
    }
    console.log(`value before ${current}`);
    slideRight();
    console.log(`value after ${current}`);

})
startSlide()

// export { flowers };