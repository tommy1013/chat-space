$(function(){
  function buildHTML(message){
    var html = `<div class＝"main_center__box1">
    <p>
                  <span class="user_name">
                      ${message.user_name}
                  </span>
                    <span class="time">
                      ${message.created_at}
                    </span>
                    <div class="reply">
                      ${message.body}
                    </div>
                    <div class="image">
                      <img src="${message.image.url}">
                    </div>
                  </p>
                  </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main_center').append(html);
      $('#message_body').val('');
      $('#message_image').val('');
      $('.main_center').animate({scrollTop: $('.main_center')[0].scrollHeight}, 'fast');
    })
     .fail(function(){
      alert('error');
    });
     return false;
  })
});
