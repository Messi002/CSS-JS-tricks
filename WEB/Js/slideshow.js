let slides = document.querySelectorAll('.myslides');
let pbtn = document.querySelector('.prev');
let slideIndex = 1;


//next and previous button
// const plusSlides = (n) => {
//     showSlides(slideIndex += n);
// };
pbtn.addEventListener('click', (e)=>{
    stop.
console.log('fired');
});

// Thumbnail image controls
const currentSlide = (n) => {
    showSlides(slideIndex = n);
  };

  
const showSlides = (n) => {
if (n > slides.length) {
    slideIndex = 1;
}

for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
}
slides[n].style.display = 'block';
};

showSlides(slideIndex);


// export { flowers };