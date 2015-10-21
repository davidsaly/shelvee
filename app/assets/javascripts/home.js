/* $(document).ready(function(){
	document.getElementById('masonry-container').onclick = function(event) {
    event = event || window.event;
    var target = event.target || event.srcElement,
        link = target.src ? target.parentNode : target,
        options = {index: link, event: event},
        links = this.getElementsByClassName('show-link');
    blueimp.Gallery(links, options);
	};
});
*/

$(document).ready(function () {

    var $container = $('.image_picker_selector');
    // initialize
    $container.imagesLoaded(function () {
        $container.masonry({
            columnWidth: 25,
            itemSelector: '.thumbnail'
        });
    });

    $("#selectImage").imagepicker({
        hide_select: true
    });
});