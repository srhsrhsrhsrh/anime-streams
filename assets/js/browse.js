$(document.getElementById("animeNameSubmit")).on('click', function() {
    const animeName = document.getElementById("anime_name").value
    $.ajax({
        type: "GET",
        url: `/episodes/${animeName}`,
        success: function(result){
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            document.getElementById("modalTitlePlaceholder").innerText = data[0]["anime_name"]
            buildReturnModal(data)
            //TODO: finish embed helper
            // if (!col3Entry.includes(".jpg")){
            //     const embedElement = createEmbedElement(anime["video_link"])
            // }
            document.getElementById("anime_name").value = ""
        },
    });
    return false;
})

$(document.getElementById("animePopularitySubmit")).on('click', function() {
    const animeTitle = document.getElementById("anime_popularity").value
    $.ajax({
        type: "GET",
        url: `/popularity/${animeTitle}`,
        success: function(result){
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
            document.getElementById("anime_popularity").value = ""
        },
    });
    return false;
})

$(document.getElementById("animeExploreSubmit")).on('click', function() {
    const titleWildcard = document.getElementById("anime_wildcard").value
    let isSafe = 0
    if (document.getElementById("isSafeCheckbox").checked) {
        isSafe = 1
    }
    $.ajax({
        type: "GET",
        url: `/browse/${titleWildcard}/${isSafe}`,
        success: function(result){
            let data = JSON.parse(JSON.stringify(result))["result"]
            console.log(data)
            buildReturnModal(data)
            document.getElementById("anime_wildcard").value = ""
            document.getElementById("isSafeCheckbox").checked = false
        },
    });
    return false;
})