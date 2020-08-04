$(document).ready(function () {
    var addBtn = $("#addExercise"),
        removeBtns = $(".removeItem");

    var options = {
        valueNames: [
            {data: ['id']},
            'itemId',
            {attr: 'value', name: 'question'},
            {attr: 'value', name: 'select1'},

            {attr: 'value', name: 'select2'},
            {attr: 'value', name: 'select3'},
            {attr: 'value', name: 'select4'},
        ],
        item: `<tr class="id" data-id="">
      <td><span class="itemId"></span></td>
      <td><input class="question form-control" value=""></td>
      <td><input class="select1 form-control" value=""></td>
      <td><input class="select2 form-control" value=""></td>
      <td><input class="select3 form-control" value=""></td>
      <td><input class="select4 form-control" value=""></td>
      <td class="remove">
        <button class="removeItem btn btn-xs btn-danger"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
</svg></button>
      </td>
    </tr>`
    };


// Create user list
    var exerciseList = new List('exercises', options);


// Get size of list (except headers)
    var size = exerciseList.size();

// Sets callbacks to the buttons and other elements in the list
    refreshCallbacks();

    function refreshCallbacks() {
        // Trigger event for new generated row/object
        removeBtns = $(removeBtns.selector);
        removeBtns.click(function () {
            var itemId = $(this).closest('tr').data('id');
            exerciseList.remove('id', itemId);
        });
    }

// Add new blank row into tables if click button Add
    $(addBtn).click( function () {
        exerciseList.add({
            id: ++size,
            itemId: `#${size}`,
            question: "",
            select1: "",
            select2: "",
            select3: "",
            select4: "",
        });
        refreshCallbacks();
    });
});
