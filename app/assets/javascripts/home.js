$(document).ready(function(){
	document.getElementById('masonry-container').onclick = function(event) {
    event = event || window.event;
    var target = event.target || event.srcElement,
        link = target.src ? target.parentNode : target,
        options = {index: link, event: event},
        links = this.getElementsByTagName('a');
    blueimp.Gallery(links, options);
	};
});

$("select").imagepicker();

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


