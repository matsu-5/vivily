// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require cocoon
//= require_tree .

$(document).on("turbolinks:load", function(){
    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        return false;
    });
});

$(function(){
  function animation(){
    $('.fadeInUp').each(function(){
      //ターゲットの位置を取得
      var target = $(this).offset().top;
      //スクロール量を取得
      var scroll = $(window).scrollTop();
      //ウィンドウの高さを取得
      var windowHeight = $(window).height();
      //ターゲットまでスクロールするとフェードインする
      if (scroll > target - windowHeight){
        $(this).css('opacity','1');
        $(this).css('transform','translateY(0)');
      }
    });
  }
  animation();
  $(window).scroll(function (){
    animation();
  });
});

//画像スライド
$(function() {
    $('.a').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 3000,
        dots: true, //ドットのナビゲーションを表示
        infinite: true, //スライドのループ有効化
        fade: true, //フェードの有効化
    });
});


/* Demo purposes only */
  $(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );
