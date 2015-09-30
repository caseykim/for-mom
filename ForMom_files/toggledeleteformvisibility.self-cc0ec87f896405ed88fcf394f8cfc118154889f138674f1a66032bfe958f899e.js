$(function(){
  $(".button-delete-form").on("click", function(){
    var $fieldset = $(this).closest(".content");
    var $form = $fieldset.find(".deleteform");
    $form.toggleClass("hide");
  });
});

$(function(){
  $(".button-edit-form").on("click", function(){
    var $fieldset = $(this).closest(".content");
    var $form = $fieldset.find(".editform");
    $form.toggleClass("hide");
  });
});
