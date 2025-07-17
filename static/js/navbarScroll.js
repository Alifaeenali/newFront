// JavaScript for any interactive functionality
document.addEventListener('DOMContentLoaded', function() {
    // Hide/show navbar on scroll
    let lastScroll = 0;
    const navbar = document.querySelector('.navbar');
    
    window.addEventListener('scroll', function() {
        const currentScroll = window.pageYOffset;
        
        if (currentScroll <= 0) {
            navbar.classList.remove('hidden');
            return;
        }
        
        if (currentScroll > lastScroll && !navbar.classList.contains('hidden')) {
            // Scroll down
            navbar.classList.add('hidden');
        } else if (currentScroll < lastScroll && navbar.classList.contains('hidden')) {
            // Scroll up
            navbar.classList.remove('hidden');
        }
        
        lastScroll = currentScroll;
    });

});


// for drop down
let dpBtn = document.querySelector('#dropBtn');
let contentBox = document.querySelector('.dropdown-content');


dpBtn.addEventListener('click', function(){
    console.log('clicked');

    if(contentBox.style.display === 'flex' || contentBox.style.display === 'block') {
        contentBox.style.display = 'none';
    } else {
        contentBox.style.display = 'flex';
    }
});

// contact event listner

let contactBtn = document.querySelector('#Contact');
let contactBtnClose = document.querySelector(".closeBtn")
let contactSection = document.querySelector('.Contact')

contactBtn.addEventListener('click', function(){
    console.log("clicked");
    contactSection.style.display = 'flex';
})
contactBtnClose.addEventListener('click', function(){
    console.log('clicked close');
    contactSection.style.display = 'none';
})