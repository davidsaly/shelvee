
$(document).ready(function () {
    $("#selectImage").imagepicker({
        hide_select: true
    });

    var $container = $('.image_picker_selector');
    // initialize
    $container.imagesLoaded(function () {
        $container.masonry({
            columnWidth: 30,
            itemSelector: '.thumbnail'
        });
    });


    document.getElementById('open-gallery').onclick = function(event) {
    //document.getElementsByClassName('show-link').onclick = function(event) {
    event = event || window.event;
    var gal = document.getElementById('the-gal');
    var target = event.target || event.srcElement,
        link = target.src ? target.parentNode : target,
        options = {index: link, event: event},
        links = gal.getElementsByClassName('show-link');
        blueimp.Gallery(links, options);
    };

});


