$(function(){
  
  let reloadComments = function() {
    let last_comment_id = $('.comment-box:last').data("comment-id") || 0;
    var path = location.pathname
    $.ajax({
      url: path + '/api/comments',
      type: 'get',
      dataType: 'json',
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      if (comments.length !==0){
        let insertHTML = '';
        $.each(comments, function(i, comment) {
          insertHTML += buildHTML(comment)
        });
        $('.item__comments--list').append(insertHTML);
      }
    })
    .fail(function() {
    });
  };


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
  setInterval(reloadComments, 7000);
});