let navbar = document.querySelector('.header .flex .navbar');
let profile = document.querySelector('.header .flex .profile');

document.querySelector('#menu-btn').onclick = () =>{
   navbar.classList.toggle('active');
   profile.classList.remove('active');
}

document.querySelector('#user-btn').onclick = () =>{
   profile.classList.toggle('active');
   navbar.classList.remove('active');
}

window.onscroll = () =>{
   navbar.classList.remove('active');
   profile.classList.remove('active');
}

let mainImage = document.querySelector('.quick-view .box .row .image-container .main-image img');
let subImages = document.querySelectorAll('.quick-view .box .row .image-container .sub-image img');

subImages.forEach(images =>{
   images.onclick = () =>{
      src = images.getAttribute('src');
      mainImage.src = src;
   }
});
////
const slider = document.querySelector(".containertj");
        const container = document.querySelectorAll(".slidetj");

        document.getElementById("left").addEventListener("click", function() {
            toPrevious()
        })

        document.getElementById("right").addEventListener("click", function() {
            toNext()
        })

        let current = 0;
        let prev = 4;
        let next = 1;

        const toPrevious = () => {
            console.log('prev')
            if (current > 0) {
                toSlide(current - 1)
            } else {
                toSlide(container.length - 1)
            }
        }

        const toNext = () => {

            if (current < 4) {
                toSlide(current + 1)
            } else {
                toSlide(0)
            }
        }

        const toSlide = number => {
            current = number;
            prev = current - 1;
            next = current + 1;

            for (let i = 0; i < container.length; i++) {
                container[i].classList.remove("active");
                container[i].classList.remove("prev");
                container[i].classList.remove("next");
            }

            if (next == 5) {
                next = 0;
            }

            if (prev == -1) {
                prev = 4;
            }

            container[current].classList.add("active");
            container[prev].classList.add("prev");
            container[next].classList.add("next");
        }