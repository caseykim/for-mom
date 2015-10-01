jQuery(window).load(function () {
    var element = jQuery('.autoscrolling');
    var childElement = element.children();
    var scrollAmount = childElement.height();
    var speedDown = scrollAmount * 45;
    var speedUp = 0;

    scrollDown(element, scrollAmount, speedUp, speedDown);

    function scrollDown(element, scrollAmount, speedUp, speedDown) {

        element.animate({ scrollTop: scrollAmount }, speedDown, function () {
            element.animate({ scrollTop: scrollAmount * -1 }, speedUp);
            scrollDown(element, scrollAmount, speedUp, speedDown);
        });
    }
})
