function changeDatabase(selection) {
             
    //always set the table selector to be operational
    document.getElementById("tableSelectorDiv").style.display = "block";
    document.getElementById("tableSelector").options[0].selected = "reset";
    
    //reverses the effects of selecting a table
    document.getElementById("tutorial").style.display = "inherit";
    document.getElementById("info").style.display = "none";
    document.getElementById("search").style.display = "none";
    document.getElementById("modify").style.display = "none";
    document.getElementById("console").style.display = "none";
    
    switch(selection) {
    
        case "project":
            
            break;
            
        case "expiremental":
            
            break;
                        
        default:
            console.log("Selected database lacks hard-coding");
            
    }
                
}

function changeTable(selection) {
    
    document.getElementById("tutorial").style.display = "none";
    document.getElementById("info").style.display = "inherit";
    document.getElementById("search").style.display = "inherit";
    document.getElementById("modify").style.display = "inherit";
    document.getElementById("console").style.display = "inherit";
    
    //for project tables
    switch(selection) {
            
        case "student":
            //something
            break;
        
        case "payments":
            //something
            break;
            
        default:
            //something
            
    }
    
}