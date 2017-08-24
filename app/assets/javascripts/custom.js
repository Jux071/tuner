$('body').on('shown.bs.modal', '#myModal', function (e) {
  var track_id = $(e.relatedTarget).data('track_id');
  $(".modal-body #track_Id").val(track_id);
 });

/*$('body').on('shown.bs.modal', '#myModal', function (e) {
  var track_id = $(e.relatedTarget).data('track-id');
  $('.modal-body #track_id').val(track_id);
 });


$("#target-modal").html("<%= j render(partial: 'suggestions/new_suggestion') %>");
$('#newSuggestionModal').modal();*/