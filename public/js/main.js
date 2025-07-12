$(function () {

    $('.jump_time').change(function () {
        var jump = $(this).val();
        $.ajax({
            url: loadListTimes,
            type: 'POST',
            dataType: 'json',
            async: true,
            data: {
                jump: jump
            }
        }).done(function (result) {
            if (result.status_code == 200) {
                $('.schedule_time').html(result.html);
            }
        }).fail(function (XMLHttpRequest, textStatus, thrownError) {
            console.log(thrownError)
        });
    })
})