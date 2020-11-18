
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

//TODO: Modify to reflect admin panel functionality

// $(document.getElementById("view_recents_submit")).on('click', function() {
//     const payload = {"email": "felixlei@hotmail.com"}
//     const posting = $.ajax({
//         type: "POST",
//         url: "/user/watching",
//         data: payload,
//         success: function(result){
//             let data = JSON.parse(JSON.stringify(result))["result"]
//             console.log(data)
//             for (let genre of data){
//                 // create row entry
//                 let newRow = document.createElement("tr")
//                 // set 1st row entry + text
//                 let col1Entry = document.createElement("td")
//                 let rowAtt = document.createAttribute("scope")
//                 rowAtt.value = "row"
//                 col1Entry.setAttributeNode(rowAtt)
//                 col1Entry.innerHTML = genre["anime_name"]
//
//                 let col2Entry = document.createElement("td")
//                 col2Entry.innerHTML = anime["number"]
//
//                 let col3Entry = document.createElement("td")
//                 col3Entry.innerHTML = anime["video_link"]
//
//                 newRow.appendChild(col1Entry)
//                 newRow.appendChild(col2Entry)
//                 newRow.appendChild(col3Entry)
//                 document.getElementById("table_placeholder").appendChild(newRow)
//             }
//             $('#recentWatchesModal').modal()
//         },
//     });
//     return false;
// })