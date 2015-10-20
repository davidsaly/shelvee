$(document).ready(function(){
	document.getElementById('masonry-container').onclick = function(event) {
    event = event || window.event;
    var target = event.target || event.srcElement,
        link = target.src ? target.parentNode : target,
        options = {index: link, event: event},
        links = this.getElementsByClassName('show-link');
    blueimp.Gallery(links, options);
	};
});

$("select").imagepicker();
$("#to-be-appended").imagepicker();


$(document).ready( function(isLoaded) {

   $('.grid').masonry({
     itemSelector: '.grid-item',
     isAnimated: true,
     isFitWidth: true
    });

  $('.grid').imagesLoaded( function(){
    $('.grid').masonry({
     itemSelector: '.grid-item',
     isAnimated: true,
     isFitWidth: true
    });
  });
  
});


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
});