$(function() {
  $('#card_form').on('submit', function(e) {
    e.preventDefault()

    Payjp.setPublicKey("pk_test_0653e560244cd04acd14b3ef");
    var card = {
      number: document.getElementById("card_number").value,
      exp_month: document.getElementById("card_exp_month").value,
      exp_year: document.getElementById("card_exp_year").value,
      cvc: document.getElementById("card_security").value
    };

    if (card.number == "" || card.cvc == "") {
      alert("入力もれがあります");
    } 
    
    else {
      Payjp.createToken(card, function(status, response) {
        if (status === 200 ) {
          $("#card_number").removeAttr("name");
          $("#card_security").removeAttr("name");
          $("#card_exp_month").removeAttr("name");
          $("#card_exp_year").removeAttr("name");
          var token = response.id;
          $("#card_form").append(
            $('<input type="hidden" name="payjp-token">').val(token)
          );
          $('#card_form').get(0).submit();
          alert("登録に成功しました");
        } else {
          alert("カード情報が正しくありません");
        }
      });
    }
  });
});