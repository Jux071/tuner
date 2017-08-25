$(document).on("click", ".open-AddTrack", function () {
     var myTrackId = $(this).data('id');
     $(".modal-body #trackId").val( myTrackId );
});