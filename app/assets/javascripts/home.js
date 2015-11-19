
var windowReady;

windowReady = function () {
    $("#selectImage").imagepicker({
        hide_select: true
    });

    var $container = $('.image_picker_selector');
    // initialize
    $container.imagesLoaded(function () {
        $container.masonry({
            //columnWidth: 30;
            itemSelector: '.thumbnail'
        });
    });


    document.getElementById('open-gallery').onclick = function(event) {
        event = event || window.event;
        var gal = document.getElementById('the-gal');
        var target = event.target || event.srcElement,
            link = target.src ? target.parentNode : target,
            options = {index: link, event: event},
            links = gal.getElementsByClassName('show-link');
            blueimp.Gallery(links, options);
    };

    $('#selectImage').change(function() {
    if ($('#selectImage :selected').size() === 0) {
        $('#sel-footer').fadeOut();
        $('#sel-footer').addClass('navbar-hide');
        $('#download-button').css('bottom','10px');
        $('#sel-del-button').css('bottom','50px');
    } 
    else {
        $('#sel-footer').fadeIn();
        $('#sel-footer').removeClass('navbar-hide');
        $('#download-button').css('bottom','50px');
        $('#sel-del-button').css('bottom','90px');
    }
    });

    $('#album-title').popover({
        trigger: 'hover'
    });

    $('#browse-button').click(function() {
        $('#file-upload').click();
    });

};

$(document).ready(windowReady);
$(document).on('page:load', windowReady);









