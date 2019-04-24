function changeDatabase(selection) {
             
    //always set the table selector to be operational
    document.getElementById("tableSelectorDiv").style.display = "inherit";
    document.getElementById("tableSelector").options[0].selected = "reset";
    
    //reverses the effects of selecting a table
    document.getElementById("tutorial").style.display = "inherit";
    document.getElementById("mainSections").style.display = "none";
    
    switch(selection) {
    
        case "project":
            
            break;
            
        case "expiremental":
            
            break;
                        
        default:
            console.log("Selected database lacking hard-code.");
            
    }
                
}

function changeTable(selection) {
    
    document.getElementById("tutorial").style.display = "none";
    document.getElementById("mainSections").style.display = "inherit";
    
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