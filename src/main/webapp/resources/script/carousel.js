window.addEventListener("load", function () {
    var carousel = document.getElementsByClassName("carousel");

    for (var i = 0; i < carousel.length; i++) {
        addEventToCarousel(carousel[i]);
    }
});
window.addEventListener('load', function() {
    var carousels = document.getElementsByClassName('carousel');

    for (var i = 0; i < carousels.length; i++) {
        addEventToCarousel(carousels[i]);
    }
});

function scrollDiv(carouselElem, index) {
    var ulElem = carouselElem.querySelector("ul");
    var liWidth = ulElem.querySelectorAll("li")[0].clientWidth;
    ulElem.style.transform = "translateX(-" + liWidth * index + "px)";
}

function createListenerSlide(carouselElem) {
    return function (e) {
        var liElems = carouselElem.querySelectorAll("li");
        var liCount = liElems.length;
        var currentIndex = parseInt(carouselElem.getAttribute("data"));

        if (e.target.closest(".slide-left")) {
            currentIndex--;
            if (currentIndex < 0) currentIndex = liCount - 1;
        } else {
            currentIndex++;
            if (currentIndex >= liCount) currentIndex = 0;
        }

        scrollDiv(carouselElem, currentIndex);
        carouselElem.setAttribute("data", currentIndex);
    };
}

function addEventToCarousel(carouselElem) {
    var ulElem = carouselElem.querySelector("ul");
    var liElems = ulElem.querySelectorAll("li");
    var liWidth = liElems[0].clientWidth;
    var adjustedWidth = liElems.length * liWidth;
    ulElem.style.width = adjustedWidth + "px";

    var slideButtons = carouselElem.querySelectorAll(".slide button");
    for (var i = 0; i < slideButtons.length; i++) {
        slideButtons[i].addEventListener("click", createListenerSlide(carouselElem));
    }

    setInterval(() => {
        const liElems = carouselElem.querySelectorAll("li");
        const liCount = liElems.length;
        var currentIndex = parseInt(carouselElem.getAttribute("data"));
        currentIndex++;

        if (currentIndex >= liCount) {
            currentIndex = 0;
        }

        scrollDiv(carouselElem, currentIndex);
        carouselElem.setAttribute("data", currentIndex);
    }, 4000);

    scrollDiv(carouselElem, 0);
}


function createListenerSlide(carouselElem) {
    return function(event) {
        var clickedButton = event.currentTarget;
        var liElems = carouselElem.querySelectorAll('li');
        var liCount = liElems.length;
        var currentIndex = parseInt(carouselElem.getAttribute('data'));

        if (clickedButton.classList.contains('right') && currentIndex < (liCount - 1)) {
            currentIndex++;
        } else if (clickedButton.classList.contains('left') && currentIndex > 0) {
            currentIndex--;
        }

        scrollDiv(carouselElem, currentIndex);
        carouselElem.setAttribute('data', currentIndex);
      
    }
}



function scrollDiv(carouselElem, currentIndex) {
    const ulElem = carouselElem.querySelector('.carousel-images');
    const newLeft = currentIndex * 750; // 이미지 폭을 맞춰서 변경해야 합니다.

    ulElem.style.transform = 'translateX(-' + newLeft + 'px)';
    ulElem.style.transition = 'transform 0.5s ease';
}

document.querySelectorAll('.transparent-button').forEach(button => {
    button.addEventListener('click', function (e) {
        const clickedButton = e.currentTarget;
        const carouselElem = clickedButton.closest('.carousel');
        const liCount = carouselElem.querySelectorAll('li').length;
        let currentIndex = parseInt(carouselElem.getAttribute('data'));

        if (clickedButton.parentElement.classList.contains('slide-right') && currentIndex < (liCount - 1)) {
            currentIndex++;
        } else if (clickedButton.parentElement.classList.contains('slide-left') && currentIndex > 0) {
            currentIndex--;
        }

        scrollDiv(carouselElem, currentIndex);
        carouselElem.setAttribute('data', currentIndex);
    });
});