(function ($) {
  "use strict";

  // SCROLL ANIMATIONS
  function onScrollAnimations() {
    $('.main-banner__title').waypoint(function() {
      $('.main-banner__title').addClass('animated fadeIn');
    }, {
      offset: '75%'
    });
    $('.main-banner__subtitle').waypoint(function() {
      $('.main-banner__subtitle').addClass('animated fadeInUp');
    }, {
      offset: '75%'
    });
    $('.section-offer__heading').waypoint(function() {
      $('.section-offer__heading').addClass('animated fadeIn');
    }, {
      offset: '75%'
    });
    $('.section-offer__box').waypoint(function() {
      $('.section-offer__box').addClass('animated fadeInUp');
    }, {
      offset: '75%'
    });
  }

  // SCROLL TO TOP
  function scrollToTop() {
    $('.scroll-top').on( 'click', function(){
      $('html, body').animate({
        scrollTop: 0
      }, 1000);
      return false;
    });
  }

  // TYPYING ANIMATION
  function typed(){
    $("#typed").typed({
        stringsElement: $('#typed-strings'),
        typeSpeed: 100,
        backDelay: 500,
        loop: true,
        contentType: 'html', // or text
        loopCount: false,
        callback: function(){ foo(); },
        resetCallback: function() { newTyped(); }
    });

    $(".reset").click(function(){
        $("#typed").typed('reset');
    });

    function newTyped(){ /* A new typed object */ }
    function foo(){ console.log("Callback"); }
  }


  function init() {
    onScrollAnimations();
    //scrollToTop();
    typed();
  }

  init();

  $('.bxblog, .bxtwitter').bxSlider({
    mode: 'fade'
  });

})(jQuery);

