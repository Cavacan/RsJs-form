document.addEventListener("DOMContentLoaded", function() {
  var button = document.getElementById('btn');
  var formPlace = document.getElementById('form_place');

  button.addEventListener('click', function() {
    formPlace.innerHTML = `
      <form action="/users" method="post">
        <div>
          <label for="name">Name</label>
          <input type="text" name="user[name]" id="name">
        </div>
        <div>
          <label for="age">Age</label>
          <input type="number" name="user[age]" id="age">
        </div>
        <div>
          <input type="submit" value="Create User">
        </div>
      </form>
    `;
  });
});
