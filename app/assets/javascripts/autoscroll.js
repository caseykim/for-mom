$(function() {
  var lastUrl = window.location.href.lastIndexOf('/');
  var location = window.location.href.substr(lastUrl);
  if (location == '/') {
    var div = $('.autoscroll');
    $('.autoscroll').bind('scroll mousedown wheel DOMMouseScroll mousewheel keyup', function(evt) {
        if (evt.type === 'DOMMouseScroll' || evt.type === 'keyup' || evt.type === 'mousewheel') {

        }
        if (evt.originalEvent.detail < 0 || (evt.originalEvent.wheelDelta && evt.originalEvent.wheelDelta > 0)) {
            clearInterval(autoscroll);
        }
        if (evt.originalEvent.detail > 0 || (evt.originalEvent.wheelDelta && evt.originalEvent.wheelDelta < 0)) {
            clearInterval(autoscroll);
        }
    });
    var autoscroll = setInterval(function(){
        var pos = div.scrollTop();
        if ((div.scrollTop() + div.innerHeight()) >= div[0].scrollHeight) {
            clearInterval(autoscroll);
        }
        div.scrollTop(pos + 1);
    }, 30);
  };
});
