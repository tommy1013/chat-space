$(function() {

  var user_list = $("#user-search-result");

  function search_list(user) {

       var html = `<div class="chat-group-user clearfix">
                   <p class="chat-group-user__name">${user.name}</p>
                   <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= ${user.id} data-user-name= ${user.name}>追加</a>
                   </div>`
        user_list.append(html);
      }

  function noUser(user) {
      var html = `<div class="chat-group-user clearfix">
                    <p class="chat-group-user__name">${user}</p>
                  </div>`;
      user_list.append(html);
    }

  $(".chat-group-form__input").on("keyup", function() {
    var input = $(this).val();

    $.ajax({
          type: 'GET',
          url: '/users',
          data: { keyword: input },
          dataType: 'json'
    })

  .done(function(users) {
    $("#user-search-result").empty();
     if (users.length !== 0) {
       users.forEach(function(user){
         search_list(user);
       });
       // console.log("sss");
     }
     else {
      // console.log("no");
         noUser("一致する名前はありません");
     }
   })
  .fail(function() {
    alert('映画検索に失敗しました');
    })
  });
});


