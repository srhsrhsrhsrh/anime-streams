
$(document.getElementById("addGenreSubmit")).on('click', function() {
    let newGenre = document.getElementById("new_genre").value
    const payload = {"genre": newGenre}
    $.ajax({
        type: "PUT",
        url: "/admin/genre",
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function(){
            $("#genre_update_success_placeholder").html('<div class="alert alert-success alert-dismissible fade show mt-4" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>\n' +
                '</button>'+
                "genre added!" +
                '</div>')
            document.getElementById("new_genre").value = ""
        },
    });
    return false;
})

$(document.getElementById("deleteVideoSubmit")).on('click', function() {
    let deleteVideo = document.getElementById("delete_video_name").value
    const payload = {"anime_name": deleteVideo}
    $.ajax({
        type: "DELETE",
        url: "/delete",
        data: payload,
        success: function () {
            $("#delete_video_success_placeholder").html(
                '<div class="alert alert-success alert-dismissible fade show text-center mt-4" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>\n' +
                '</button>' +
                "video deleted!" + '</div>')
            document.getElementById("delete_video_name").value = ""
        },
    });
    return false;
})

$(document.getElementById("superUserSubmit")).on('click', function() {
    const genreToQuery = document.getElementById('genre_name').value
    $.ajax({
        type: "GET",
        url: `/watchedAll/${genreToQuery}`,
        success: function (result) {
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
        },
    });
    return false;
})

$(document.getElementById("numVideosSubmit")).on('click', function() {
    const numVideos = document.getElementById('num_videos').value
    $.ajax({
        type: "GET",
        url: `/servers/hosting/${numVideos}`,
        success: function (result) {
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
        },
    });
    return false;
})

$(document.getElementById("userActivitySubmit")).on('click', function() {
    $.ajax({
        type: "GET",
        url: "/user_activity",
        success: function (result) {
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
        },
    });
    return false;
})