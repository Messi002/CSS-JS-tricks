let slides = document.querySelectorAll('.myslides');
let pbtn = document.querySelector('#prev');
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

}
//previous slide
const slideLeft = () =>  {
    reset()
    slides[current - 1].style.display = 'block';

}


//left arrow click
pbtn.addEventListener('click', () =>{
    console.log(current);
    if (current === 0) {
        current = slides.length;
    }
    console.log(current);

    slideLeft();

})

startSlide()

// export { flowers };