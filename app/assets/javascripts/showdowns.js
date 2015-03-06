
$(document).ready(function() { 
  $("tr[data-link]").on('click', function(event) {
    window.location = this.dataset.link
  });
});
