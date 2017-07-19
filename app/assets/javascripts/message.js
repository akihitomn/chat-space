$(function() {
  function buildHTML(message){
    var addImage = (message.image != null)? `<img src="${message.image}">`:``
    var html = `<div class="chat_box__middle_message">
      <h1>${message.name}</h1>
      <a>${message.created_at}</a>
      <h2>${message.message}<h2>
       ${ addImage }
      </div>`;
    return html;
  }
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var url = $(this).attr('action');
    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat_box__middle').append(html);
      $('#message_message').val('');
      $('.chat_box__bottom_text_image_hidden').val('');
      $('.chat_box__middle').animate({scrollTop: $('.chat_box__middle')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('error');
    })
    return false
  })
});

