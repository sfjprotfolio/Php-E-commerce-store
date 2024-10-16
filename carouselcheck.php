<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="css/carouselstyle.css">
    <title>Document</title>
    <link rel="icon" href="images/Logo.png" type="image/icon type">
</head>
<body>
<div class="container">
   <div class="slide active">
      <img src="images/jewella.png" alt="">
   </div>
   <div class="slide next">
      <img src="images/pendant-2.png" alt="">
   </div>
   <div class="slide ">
      <img src="images/Ellipse.png" alt="">
   </div>
   <div class="slide">
      <img src="images/Powder puff-3.png" alt="">
   </div>
   <div class="slide prev">
      <img src="images/Foundation.png" alt="">
   </div>
   <div class="button-container">
      <div class="button" id="left"><i class="fas fa-angle-left"></i></div>
      <div class="button" id="right"><i class="fas fa-angle-right"></i></div>
   </div>
</div>

<style>
   body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #32312B;
        }
        
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            user-select: none;
        }
        
        .container .slide {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 250px;
            height: 250px;
            border-radius: 50%;
            overflow: hidden;
            transition: all 300ms ease-in-out;
            z-index: -1;
            opacity: 0;
            background-color: #201F15;
        }
        
        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .slide.active {
            opacity: 1;
            z-index: 99;
            box-shadow: 0px 0px 105px -35px rgba(0, 0, 0, 0.75);
        }
        
        .slide.prev {
            z-index: 2;
            opacity: 0.25;
            transform: translate(-125%, -50%);
        }
        
        .slide.next {
            z-index: 2;
            opacity: 0.25;
            transform: translate(25%, -50%);
        }
        
        .container .button-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 275px;
            z-index: 100;
        }
        
        .button-container .button {
            color: #fff;
            font-size: 32px;
            cursor: pointer;
            position: relative;
            opacity: 0.75;
            transition: all 300ms ease-in-out;
        }
        
        .button-container .button:hover {
            opacity: 1;
        }
        
        .button-container .button:before {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 50px;
            height: 50px;
            background-color: rgba(0, 0, 0, 1);
            border-radius: 50%;
            z-index: -99;
        }
        
        .button-container .button:nth-child(1) {
            float: left;
        }
        
        .button-container .button:nth-child(2) {
            float: right;
        }
</style>
<script>
    const slider = document.querySelector(".container");
        const container = document.querySelectorAll(".slide");

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
</script>

</body>
</html>