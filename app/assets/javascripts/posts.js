/*
|--------------------------------------------------------------------------
|   Load Preview Of Image
|--------------------------------------------------------------------------
*/
var loadFile = function(event) {
  var type = event.target.files[0].type;
  if(type == 'image/jpeg' || type =='image/gif' || type == 'image/png'){
    var output = document.getElementById('image-preview');
    output.src = URL.createObjectURL(event.target.files[0]);
  }
};
/*
|--------------------------------------------------------------------------
|   In Comment Section
|--------------------------------------------------------------------------
*/
$(function(){
  $('div.view_post_bottom>span.comment_counter').click(function(){
    $(this).parent('div.view_post_bottom').siblings('div.post-bottom').slideToggle();
  });
  $('.new_comment').submit(function(){
    $(this).closest('div.comment-like-form').siblings('div.post-bottom').slideDown();
  });
});