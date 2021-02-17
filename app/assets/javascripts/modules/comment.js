$(function(){

  function buildHTML(comment){
    let seller_tag = comment.seller_id == comment.user_id ? `<div class="comment-box__name-box--seller">出品者</div>` : '' ;
    let html = `<div class="comment-box" data-comment-id=${comment.id}>
                  <div class="comment-box__title">
                    <div class="comment-box__created_at">
                      ${comment.created_at}
                    </div>
                    <div class="comment-box__name-box">
                        ${seller_tag}
                      <div class="comment-box__name-box--nickname">
                        ${comment.user_name}
                      </div>
                    </div>
                  </div>
                  <div class="comment-box__text">
                    ${comment.text}
                  </div>
                </div>`
    return html;
  };

  $('#comment_new').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.item__comments--list').append(html);
      $('.item__comments--list').animate({ scrollTop: $('.item__comments--list')[0].scrollHeight});
      $('#comment_new')[0].reset();
      $('.comment__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    });
  });
});