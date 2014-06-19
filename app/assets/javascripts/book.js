$(document).ready(function(){
  $('#show-form').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();
    $('.book-form').toggle();
  });

});