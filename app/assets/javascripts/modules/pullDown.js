$(function(){

  function buildForm(categories){
    let options='';
    categories.forEach(function (category) { 
      options += ` <option value="${category.id}">${category.name}</option> `;
    });

    const html=`
      <select class="form-pull-down select-category"  name="item[category_id]">
        <option value="">---</option>
        ${options}
      </select>
    `
    return html
  }
  $('.Categories').on('change','.form-pull-down',function(){
    $(this).nextAll().remove()  
    const category_id=$(this).val() 
    $.ajax({
      type: "GET",
      url: "/api/items/category",
      data: {category_id: category_id },
      dataType: 'json'
    })
    .done(function(categories) {
      if(categories.length==0){ 
        return false
      }
      const select_form=buildForm(categories) 
      const target=$('.Categories') 
      target.append(select_form)
    })
    .fail(function() {
      if(category_id != "") {
        alert('失敗')
      }
    });
  })
});