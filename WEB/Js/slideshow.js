let slides = document.querySelectorAll('.myslides');
let pbtn = document.querySelector('#prev');
let nbtn = document.querySelector('#next');
let dots = document.querySelectorAll('body > main > section > div.dot > span.dot__element');
let current = 0;
let dot=0;


//clear all images
const reset = () => {
    for (let i = 0; i < slides.length; i++) {
            slides[i].style.display ='none';
            dots[i].className = dots[i].className.replace(" active", "");   
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
    if (current === 0) {
        current = slides.length;
        dot = dots.length;
    }
    slides[current-=1].style.display = 'block';
    dots[dot -=1].className += " active";

}


//left arrow click
pbtn.addEventListener('click', () =>{
  

    slideLeft();
})


//next slide
const slideRight = () =>  {
    reset()
    if (current === slides.length -1) {
        current = -1;
        dot= -1;
    }
    dots[dot +=1].className += " active";
    slides[current +=1].style.display = 'block';

}


//right arrow click
nbtn.addEventListener('click', () =>{

    slideRight();

})
startSlide()

//Automatic SlideShow
// id1 = setInterval(slideRight,2000)


// export { flowers };