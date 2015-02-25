
var correct_value = Math.floor(Math.random() * 100) + 1;

$("#awesome").on("submit", function(event) {
  var input = $("#url").val();
  event.preventDefault();
  guessValue(input);
});

function guessValue(input) {
comparison = parseInt(input);

if (isNaN(comparison)) {
  $("#display-data").append("<p class='guess'> Not a number, dude! </p>");

else if (comparison === correct_value) {
    $("#display-data").append("<p class='guess'> Good work! </p>");
    $("#refresh").show();
  }
else if (comparison > correct_value) {
  $("#display-data").append("<p class='guess'> Guess lower! </p>");
  }
else {
  $("#display-data").append("<p class='guess'> Guessid hgher! </p>");
  }
}

$('#refresh').click(function() {
    location.reload();
});
