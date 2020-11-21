
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

$(document.getElementById("view_recents_submit")).on('click', function() {
    const payload = {"email": "felixlei@hotmail.com"}
    $.ajax({
        type: "POST",
        url: "/user/watching",
        data: payload,
        success: function(result){
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
        },
    });
    return false;
})