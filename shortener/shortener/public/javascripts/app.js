//what is the purpose of the open function?

$(function() {

  $("#input_form").on('submit', function(event){
    var input = $('#text_field').val();
    console.log(input);
    
  });
});
