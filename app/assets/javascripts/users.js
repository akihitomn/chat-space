$(function() {
  var search_list = $("#user-search-result");
  function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.name }</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    search_list.append(html);
  }

  function appendNothing(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user }</p>
                </div>`
    search_list.append(html);
  }

  function appendMember(user, user_id){
    var user_id = user.attr('data-user-id');
    var user_name = user.attr('data-user-name');
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user_name}</p>
                  <a class="user-search-delete chat-group-user__btn chat-group-user__btn--remove" data-user-id="${user_id}" data-user-name="${user_name}">削除</a>
                </div>`
    $("#chat-group-users").append(html);
  }

  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users){
      $("#user-search-result").empty();
      if (users.length !== 0 ){
        users.forEach(function(user){
        appendUser(user);
        });
      }
      else {
        appendNouser("該当するユーザーがいません。");
      }
    })
    .fail(function(){
      alert('ユーザー情報の取得に失敗しました。');
    })
  });

  $("#user-search-result").on('click', ".chat-group-user__btn", function(){
    $(this).parent().remove();
    appendMember($(this));
  })

  $('#chat-group-users').on('click', ".chat-group-user__btn", function(){
    $(this).parent().remove();
  })
});
