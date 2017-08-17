$(document).ready(function () {
    $('#myModal').on('show.bs.modal', function (event) {
        console.log($(event.relatedTarget).attr('track_id'));
    });
});

$(document).on "click", ".openModal"
$(".modal-body").load($(this).data('href'))