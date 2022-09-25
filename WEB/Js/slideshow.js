let mySlides = document.querySelector('.myslides');
let slideIndex = 1;
showSlides(slideIndex);

//next and previous button
const plusSlides = (n) => {
    showSlides(slideIndex += n);
};

const showSlides = () => {};



// export { flowers };