document.addEventListener("DOMContentLoaded", function() {
  var button = document.getElementById('btn');
  var formPlace = document.getElementById('form_place');

  button.addEventListener('click', function() {
    fetch('/js_home/get_form', {
      method: "GET",
      headers: {
        'Content-Type': 'text/html'
      }
    })
    .then(response => response.text())
    .then(html => {
      formPlace.innerHTML = html;
    })
    .catch(error => console.log('Error:', error));
  });
});
