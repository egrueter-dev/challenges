$('#new-fortune').on('click', function () {
    $.get("/new-fortune.json", function(fortune) {
        alert(fortune["fortune"]);
  });
});
