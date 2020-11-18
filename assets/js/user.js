
//method 1
$(document.getElementById("updateEmailSubmit")).on('click', function() {
    const oldEmail = document.getElementById("old_email").value
    const newEmail = document.getElementById("new_email").value
    const payload = {"new_email" : newEmail, "old_email" : oldEmail}
    $.ajax({
        type: "POST",
        url: "/user/email",
        data: payload,
        success: function(){
            $("#email_update_success_placeholder").html('<div class="alert alert-success alert-dismissible fade show mt-4" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>\n' +
                '</button>'+
                "email has been updated successfully!" +
                '</div>')
            document.getElementById("old_email").value = ""
            document.getElementById("new_email").value = ""
        },
    });
    return false;
})

function cleanModal() {
    let node = document.getElementById("table_placeholder")
    node.innerHTML = "";
}

//TODO: finish embed helper
// function createEmbedElement(link) {
//     let embedVid = document.createElement("div")
//     let embedAttribute = document.createAttribute("class")
//     embedAttribute.value = "embed-responsive embed-responsive-16by9"
//
//     let embedFrame = document.createElement("iframe")
//     let frameAttribute = document.createAttribute("class")
//     frameAttribute.value = "embed-responsive-item"
//     embedFrame.attri
// }

$(document.getElementById("view_recents_submit")).on('click', function() {
    const payload = {"email": "felixlei@hotmail.com"}
    $.ajax({
        type: "POST",
        url: "/user/watching",
        data: payload,
        success: function(result){
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            for (let anime of data){
                // create row entry
                let newRow = document.createElement("tr")
                // set 1st row entry + text
                let col1Entry = document.createElement("td")
                let rowAtt = document.createAttribute("scope")
                rowAtt.value = "row"
                col1Entry.setAttributeNode(rowAtt)
                col1Entry.innerHTML = anime["anime_name"]

                let col2Entry = document.createElement("td")
                col2Entry.innerHTML = anime["number"]

                let col3Entry = document.createElement("td")
                col3Entry.innerHTML = anime["video_link"]

                //TODO: finish embed helper
                // if (!col3Entry.includes(".jpg")){
                //     const embedElement = createEmbedElement(anime["video_link"])
                // }

                newRow.appendChild(col1Entry)
                newRow.appendChild(col2Entry)
                newRow.appendChild(col3Entry)
                document.getElementById("table_placeholder").appendChild(newRow)
            }
            $('#recentWatchesModal').modal()
        },
    });
    return false;
})