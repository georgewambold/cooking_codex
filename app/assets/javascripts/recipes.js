$(document).on('ready page:load turbolinks:load', function() {
  addDirectionInput();
  addIngredientInput();

  $('.js-search-category, .js-search-category2').select2();

  $(".js-search-ingredients").select2({
    maximumSelectionLength: 4
  });

  $(".ingredient-button").click(function() {
    event.preventDefault();
    addIngredientInput();
  });

  $("#ingredient-sortable").on("click", ".minusbtn", function() {
    $(this).parent().parent().parent().remove();
  });

  $("#directions-sortable").sortable({
    update: function() {
      $(".direction-counter").each(function (i) {
        $(this).text("step " + (i + 1))
      })
      $(".direction-counter-input").each(function (i) {
        $(this).val(i + 1)
      })
    }
  });

  $("#directions-sortable").disableSelection();

  $(".directions-button").click(function() {
    event.preventDefault();
    addDirectionInput();

    $(".direction-counter").each(function (i) {
      $(this).text("Step " + (i + 1))
    })

    $(".direction-counter-input").each(function (i) {
      $(this).val(i + 1)
    })
  });

  $("#directions-sortable").on("click", ".minusbtn", function() {
    $(this).parent().parent().parent().remove();
  });
});

addIngredientInput = function() {
  $("#ingredient-sortable").append(
    '<div class="box ui-sortable-handle">' +
      '<div class="row">' +
        '<div class="col-lg-5 col-sm-5">' +
          '<input type="text" class="form-control" name="recipe[recipe_ingredients_attributes][][ingredient_attributes[name]]" placeholder="Name of ingredient">' +
        '</div>' +
        '<div class="col-lg-5 col-sm-5">' +
          '<input type="text" class="form-control" name="recipe[recipe_ingredients_attributes][][amount]" placeholder="Notes (quantity or additional info)">' +
        '</div>' +
        '<div class="col-lg-1 col-sm-1">' +
        '<i class="fa fa-times-circle-o minusbtn" aria-hidden="true"> </i>' +
        '</div>' +
      '</div>' +
    '</div>'
  );
}

addDirectionInput = function() {
  $("#directions-sortable").append(
    '<div class="box ui-sortable-handle"> ' +
      '<div class="row"> ' +
        '<div class="col-lg-1 col-sm-1"> ' +
          '<i class="fa fa-arrows" aria-hidden="true"></i> ' +
        '</div> ' +
        '<div class="col-lg-2 col-sm-2"> ' +
          '<p class="direction-counter" style="margin-top:11px;">Step 1</p> ' +
          '<input class="direction-counter-input" type="hidden" name=recipe[directions_attributes][][step_number]> ' +
        '</div> ' +
        '<div class="col-lg-8 col-sm-8"> ' +
          '<textarea class="form-control" rows="5" name="recipe[directions_attributes][][description]" placeholder="Step details"></textarea> ' +
        '</div> ' +
        '<div class="col-lg-1 col-sm-1"> ' +
          '<i class="fa fa-times-circle-o minusbtn" aria-hidden="true"> </i> ' +
        '</div> ' +
      '</div> ' +
    '</div> '
  );
}
