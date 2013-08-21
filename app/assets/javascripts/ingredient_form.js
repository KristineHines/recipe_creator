$(document).ready(function() {
  addIngredientField();

});


var addIngredientField = function() {
  $("a#add_ingredient").click(function(e){
    e.preventDefault;
  $("#add_ingredient_field").clone().appendTo("#ingredient_list");
  });
};
