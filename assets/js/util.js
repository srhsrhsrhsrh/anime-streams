function cleanModal() {
    document.getElementById("table_placeholder").innerHTML = ""
    document.getElementById("tr_placeholder").innerHTML = ""
    document.getElementById("modalTitlePlaceholder").innerText = ""
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


/**
 * Returns formatted DOM table header column
 */
function formatHeaderColumn(column) {
    let headerColumn = document.createElement("th")
    headerColumn.setAttribute("scope", "col")
    headerColumn.innerHTML = column
    return headerColumn
}

/**
 * Sets the table header titles based off of columns
 */
function processTableColumns(columns) {
    const trDomElem = document.getElementById("tr_placeholder")
    columns.map(column => {
        const childColumn = formatHeaderColumn(column)
        trDomElem.appendChild(childColumn)
    })
}

function processRowColumns(datum, columns){
    let firstCol = true
    let row = document.createElement("tr")
    columns.map(column => {
        let colEntry = document.createElement("td")
        if (firstCol){
            colEntry.setAttribute("scope", "row")
            firstCol = false
        }
        colEntry.innerHTML = datum[`${column}`]
        row.appendChild(colEntry)
    })
    return row
}

function buildReturnModal(data) {
    const columns = Object.keys(data[0])
    processTableColumns(columns)
    for (let episode of data) {
        const processedRow = processRowColumns(episode, columns)
        //TODO: finish embed helper
        // if (!col3Entry.includes(".jpg")){
        //     const embedElement = createEmbedElement(anime["video_link"])
        // }
        document.getElementById("table_placeholder").appendChild(processedRow)
    }
    $('#resultsModal').modal()
}