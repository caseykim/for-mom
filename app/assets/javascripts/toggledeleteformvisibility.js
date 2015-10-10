$(function(){
  $(".button-delete-form").on("click", function(){
    var $fieldset = $(this).closest(".content");
    var $form = $fieldset.find(".deleteform");
    $form.slideToggle("slow");
  });
});

$(function(){
  $(".button-edit-form").on("click", function(){
    var $fieldset = $(this).closest(".content");
    var $form = $fieldset.find(".editform");
    $form.slideToggle("slow");
  });
});
