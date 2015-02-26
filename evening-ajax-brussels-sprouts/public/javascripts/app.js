$("#get-dish").on("click", function(event) {
  $.get("dishes.json", function(dishes) {
      alert(dishes["dishes"])
  });
});
